library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

-- TODO: skip ckgated pe at wr_pipe
-- TODO: merge regfile in data_buffer -> all beh
-- TODO: VSG (style guide) do not use logic on ctrl signals in input (set int_pe_en from fsm)
-- TODO: mux entities, port map no proceint_o_data (mux5to1n, mux2to1n)
-- TODO: VSG instead of caps-lock naming, ctrl_xxxx
-- TODO: core v2 implementation
-- TODO: split data_buffer even/odd tile, OCM (on-chip mem) 4-bit word access int_o_data 
-- TODO: add fine-grained ckg to registers in PE Block (conv psum width < fc psum width)							

entity main is 
port(
	ck  					: in 	std_logic; 
	rst 					: in 	std_logic;
	
	task					: in 	layer_t;
	
	ctrl_en_pe			: in 	std_logic;
	ctrl_en_hmode  	: in 	std_logic;
	ctrl_en_vmode		: in  std_logic; 
	ctrl_en_wr_ptr  	: in 	std_logic;
	ctrl_en_res_ptr 	: in 	std_logic;
	ctrl_sel_arv_res	: in 	std_logic;
	
	s_tc_wr				: out std_logic; 
	s_tc_hmode			: out std_logic;
	s_tc_vmode			: out std_logic;
	s_tc_res				: out std_logic; 
	s_ckg					: out std_logic; 
	s_tc_tilev			: out std_logic; 
	s_tc_tileh			: out std_logic; 
	s_tc_tileb			: out std_logic; 
	s_tc_tilec 			: out std_logic;
	
	i_kernel 			: in 	std_logic_vector(2*K-1 downto 0);
	i_data 				: in  FIFORowData;
	o_data				: out PEResData
	);
end entity; 

architecture rtl of main is

component ckg_ctrl 
port	(
	ck 			: in 	std_logic;
	rst 			: in 	std_logic; 
	ck_en			: in 	std_logic;
	ckg_rsel 	: in 	std_logic;
	ckg_csel		: in 	std_logic; 
	ckg_mask		: in 	std_logic_vector(0 to W-1);
	ckg_mask_lt : in 	std_logic_vector(0 to W-1);
	ckg_rmask	: out std_logic_vector(0 to W-1);
	ckg_cmask	: out std_logic_vector(0 to W-1);
	s_ckg			: out std_logic
	); 
end component;

component core 
port(
	ck 	 		: in 	std_logic;
	rst	 		: in 	std_logic; 
	ld 	 		: in 	std_logic; 
	en				: in 	std_logic;
	ckg_rmask	: in 	std_logic_vector(0 to W-1);
	ckg_cmask	: in 	std_logic_vector(0 to W-1);
	sync_clr		: in 	std_logic;
	rd_ptr 		: in 	unsigned(2 downto 0);
	wr_ptr 		: in 	unsigned(1 downto 0);
	i_kernel 	: in	std_logic_vector(1 downto 0);
	i_data 		: in  FIFORowData;
	o_data 		: out PEBlockDataRes
	);
end component;

component wr_pipe
port( 
	ck 	 				: in  std_logic; 
	rst 	 				: in  std_logic; 
	ctrl_en_res_ptr 	: in 	std_logic; 
	arv_res				: in 	unsigned(clog2W-1 downto 0);
	s_tc_res	 	 		: out std_logic;
	i_data 				: in  PEBlockDataRes;
	o_data		 		: out PEResData
	);
end component;

component weight_buffer
port( 
	ck 			: in 	std_logic;
	rst			: in 	std_logic;
	cs				: in 	std_logic;
	rd_wr_n		: in 	std_logic;
	vmode_ptr	: in 	unsigned(clog2K-1 downto 0);
	hmode_ptr	: in 	unsigned(clog2K-1 downto 0);
	i_data		: in 	std_logic_vector(2*K-1 downto 0);
	o_data 		: out std_logic_vector(1 downto 0)
	);
end component;

component addr_gen 
port(
	ck  					: in 	std_logic;
	rst 					: in 	std_logic;
	inc					: in 	std_logic;
	arv_tilev			: in 	unsigned(clog2v-1 downto 0);
	arv_tileh			: in	unsigned(clog2h-1 downto 0);
	arv_tileb			: in 	unsigned(clog2b-1 downto 0);
	arv_tilec			: in 	unsigned(clog2c-1 downto 0); 
	s_tc_tilev			: out std_logic; 
	s_tc_tileh			: out std_logic;
	s_tc_tileb			: out std_logic; 
	s_tc_tilec			: out std_logic;
	even_addr			: out unsigned(clog2m-1 downto 0);
	odd_addr				: out unsigned(clog2m-1 downto 0)
	);		
end component;

component countern 
generic ( N	: natural := 16 );    
port( 
	ck 			: in std_logic; 
	rst			: in std_logic; 
	sync_clr		: in std_logic; 
	en 			: in std_logic;
	arv			: in unsigned(N-1 downto 0); 
	q 				: out unsigned(N-1 downto 0); 
	tc				: out std_logic
	);
end component;

component urom
port(
	task 				: in 	layer_t;
	arv_hmode 		: out unsigned(clog2K-1 downto 0);
	arv_vmode 		: out unsigned(clog2K-1 downto 0);
	arv_wr	 		: out unsigned(clog2W-1 downto 0);
	arv_tilev 		: out unsigned(clog2v-1 downto 0);
	arv_tileh		: out unsigned(clog2h-1 downto 0);
	arv_tileb 		: out unsigned(clog2b-1 downto 0);
	arv_tilec	 	: out unsigned(clog2c-1 downto 0);
	arv_ckg			: out unsigned(clog2W-1 downto 0);
	ckg_mask 		: out std_logic_vector(W-1 downto 0);
	ckg_mask_lt		: out std_logic_vector(W-1 downto 0)
	);
end component;

signal int_o_data		 			: PEBlockDataRes;

signal int_k_cs					: std_logic;
signal int_k_rd					: std_logic;  
signal int_k_data					: std_logic_vector(N_WEIGHT-1 downto 0);

signal int_tc_wr 					: std_logic; 
signal int_tc_hmode				: std_logic;
signal int_tc_vmode				: std_logic;
signal int_tc_res 				: std_logic; 

signal int_tc_tilev 				: std_logic;
signal int_tc_tileh 				: std_logic;
signal int_tc_tileb				: std_logic;
signal int_tc_tilec 				: std_logic;

signal int_en_wr_ptr 			: std_logic; 
signal int_en_res_ptr 			: std_logic; 
signal int_arv_res				: unsigned(clog2W-1 downto 0);

signal int_en_hmode_cnt			: std_logic;
signal int_en_vmode_cnt 		: std_logic;

signal int_en_tilev_ptr 		: std_logic;
signal int_en_tileh_ptr			: std_logic;
	
signal int_arv_hmode 			: unsigned(clog2K-1 downto 0);
signal int_arv_vmode				: unsigned(clog2K-1 downto 0);

signal int_arv_tilev 			: unsigned(clog2v-1 downto 0);
signal int_arv_tileh				: unsigned(clog2v-1 downto 0);
signal int_arv_tileb				: unsigned(clog2b-1 downto 0);
signal int_arv_tilec 			: unsigned(clog2c-1 downto 0); 

signal int_tilev_ptr 			: unsigned(clog2v-1 downto 0);  
signal int_tileh_ptr 			: unsigned(clog2v-1 downto 0); 

signal int_hmode_cnt 			: unsigned(clog2K-1 downto 0);
signal int_vmode_cnt 			: unsigned(clog2K-1 downto 0);
 
signal int_wr_ptr 				: unsigned(clog2W-1 downto 0);
signal int_arv_wr 				: unsigned(clog2W-1 downto 0);

signal int_even_addr				: unsigned(clog2m-1 downto 0);
signal int_odd_addr				: unsigned(clog2m-1 downto 0);

signal int_en_pe 					: std_logic; 
signal int_pe_sync_clr 			: std_logic; 

signal int_s_ckg					: std_logic; 
signal int_ckg_mask				: std_logic_vector(0 to W-1);
signal int_ckg_mask_lt  		: std_logic_vector(0 to W-1);
signal int_ckg_rmask				: std_logic_vector(0 to W-1); 
signal int_ckg_cmask				: std_logic_vector(0 to W-1); 
signal int_arv_ckg				: unsigned(clog2W-1 downto 0);

begin

int_en_pe 	   		<= ctrl_en_pe;
int_pe_sync_clr		<= int_tc_res;

int_en_hmode_cnt  	<= ctrl_en_hmode;
int_en_vmode_cnt 		<= ctrl_en_vmode 	or int_tc_res;
int_en_wr_ptr  		<= ctrl_en_wr_ptr;
int_en_res_ptr 		<= ctrl_en_res_ptr;
int_en_tilev_ptr 		<= int_tc_wr and int_en_wr_ptr; 

s_tc_wr 					<= int_tc_wr;
s_tc_hmode 				<= int_tc_hmode;
s_tc_vmode 				<= int_tc_vmode;
s_tc_res  				<= int_tc_res;
s_tc_tilev 				<= int_tc_tilev;
s_tc_tileh				<= int_tc_tileh;
s_tc_tileb				<= int_tc_tileb;
s_tc_tilec 				<= int_tc_tilec;
s_ckg 					<= int_s_ckg;

int_arv_res 			<= int_arv_ckg when ctrl_sel_arv_res = '1' else int_arv_wr;

-- set these in fsm 
int_k_cs					<= '1';
int_k_rd					<= int_en_hmode_cnt;


KERNEL:
weight_buffer port map (
	ck 		 	=> ck,
	rst		 	=> rst,
	cs 		 	=> int_k_cs,
	rd_wr_n 		=> int_k_rd,
	vmode_ptr	=> int_vmode_cnt,
	hmode_ptr 	=> int_hmode_cnt,
	i_data		=> i_kernel,
	o_data 	 	=> int_k_data);
	
NPU: 
core port map(
	ck 	 	 	=> ck,
	rst	 	 	=> rst,
	ld 	 	 	=> int_en_wr_ptr,
	en		 		=> int_en_pe,
	sync_clr		=> int_pe_sync_clr,
	ckg_rmask	=> int_ckg_rmask,
	ckg_cmask	=> int_ckg_cmask,
	rd_ptr 	 	=> int_hmode_cnt,
	wr_ptr 	 	=> int_wr_ptr,
	i_kernel  	=> int_k_data,
	i_data 		=> i_data,
	o_data 	 	=> int_o_data);

WRITE_PIPELINE:
wr_pipe port map (
	ck						=> ck,
	rst 					=> rst,
	ctrl_en_res_ptr	=> int_en_res_ptr, 
	arv_res				=> int_arv_res,
	s_tc_res 	 		=> int_tc_res,
	i_data 	 			=> int_o_data,
	o_data 	 			=> o_data);	

VMODE_CNT:
countern generic map (N => int_arv_vmode'length) port map (
	ck 			=> ck, 
	rst 			=> rst, 
	sync_clr 	=> '0',
	en	 			=> int_en_vmode_cnt, 
	arv			=> int_arv_vmode,
	q				=> int_vmode_cnt,
	tc				=> int_tc_vmode);
											
HMODE_CNT: 
countern generic map (N => int_arv_hmode'length) port map (
	ck 			=> ck, 
	rst 			=> rst, 
	sync_clr 	=> '0',
	en 			=> int_en_hmode_cnt, 
	arv 			=> int_arv_hmode, 
	q 				=> int_hmode_cnt, 
	tc 			=> int_tc_hmode);

FIFO_CTRL: 
countern generic map (N => int_arv_wr'length) port map (
	ck 			=> ck, 
	rst 			=> rst, 
	sync_clr 	=> '0',
	en 			=> int_en_wr_ptr, 
	arv			=> int_arv_wr, 
	q 				=> int_wr_ptr,
	tc 			=> int_tc_wr);
	
CKG_MASK_CTRL:
ckg_ctrl port map (
	ck 				=> ck,
	rst 				=> rst,
	ck_en				=> int_tc_hmode,
	ckg_rsel 		=> int_tc_tilev,
	ckg_csel			=> int_tc_tileh,
	ckg_mask			=> int_ckg_mask,
	ckg_mask_lt		=> int_ckg_mask_lt,
	ckg_rmask		=> int_ckg_rmask,
	ckg_cmask		=> int_ckg_cmask,
	s_ckg				=> int_s_ckg
	);
	
RD_ADDR_GEN: 
addr_gen port map (
	ck 		 			=> ck,
	rst		 			=> rst,
	inc					=> int_en_tilev_ptr,
	arv_tilev			=> int_arv_tilev,
	arv_tileh			=> int_arv_tileh,
	arv_tileb			=> int_arv_tileb,
	arv_tilec			=> int_arv_tilec,
	s_tc_tilev 			=> int_tc_tilev,
	s_tc_tileh 			=> int_tc_tileh,
	s_tc_tileb			=> int_tc_tileb,
	s_tc_tilec 			=> int_tc_tilec,
	even_addr			=> int_even_addr,
	odd_addr				=> int_odd_addr
	);
	
WR_ADDR_GEN: 
addr_gen port map (
	ck 		 			=> ck,
	rst		 			=> rst,
	inc					=> int_tc_res,
	arv_tilev			=> int_arv_tilev,
	arv_tileh			=> int_arv_tileh,
	arv_tileb			=> int_arv_tileb,
	arv_tilec			=> int_arv_tilec
--	even_addr			=> int_even_addr,
--	odd_addr				=> int_odd_addr
	);
	
GLOBALS_T:
urom port map (
	task 			=> task, 
	arv_hmode 	=> int_arv_hmode,
	arv_vmode	=> int_arv_vmode,
	arv_wr 	 	=> int_arv_wr,
	arv_tilev 	=> int_arv_tilev,
	arv_tileh	=> int_arv_tileh,
	arv_tileb 	=> int_arv_tileb,
	arv_tilec 	=> int_arv_tilec,
	arv_ckg		=> int_arv_ckg,
	ckg_mask		=> int_ckg_mask,
	ckg_mask_lt => int_ckg_mask_lt
	);
	
end architecture; 

