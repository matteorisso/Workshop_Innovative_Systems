library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

-- TODO: skip ckgated pe at wr_pipe
-- TODO: merge counters in addreint_o_data gen 
-- TODO: merge regfile in data_buffer -> all beh
-- TODO: VSG (style guide) do not use logic on ctrl signals in input (set int_pe_en from fsm !)
-- TODO: mux entities, port map no proceint_o_data (mux5to1n, mux2to1n)
-- TODO: VSG instead of caps-lock naming, ctrl_xxxx
-- TODO: core v2 implementation
-- TODO: split data_buffer even/odd tile, OCM (on-chip mem) 4-bit word acceint_o_data 
-- TODO: add fine-grained ckg to registers in PE Block (conv psum width < fc psum width)							

entity main is 
port(
	ck  					: in 	std_logic; 
	rst 					: in 	std_logic;
	task					: in 	layer_t;
	ctrl_en_pe			: in 	std_logic;
	ctrl_en_rd_ptr  	: in 	std_logic;
	ctrl_en_wr_ptr  	: in 	std_logic;
	ctrl_en_res_ptr 	: in 	std_logic;  
	s_tc_wr				: out std_logic; 
	s_tc_hmode			: out std_logic;
	s_tc_vmode			: out std_logic;
	s_tc_res				: out std_logic; 
	s_tc_tilev			: out std_logic; 
	s_tc_tilec 			: out std_logic;
	i_kernel 			: in 	std_logic_vector(2*K-1 downto 0);
	i_data 				: in  RFRowData;
	o_data				: out PEResData);
end entity; 

architecture rtl of main is

signal int_o_data		 	: PEBlockDataRes;

signal int_pe_en 			: std_logic; 
signal int_pe_sync_clr 	: std_logic; 

signal int_k_cs			: std_logic;
signal int_k_rd			: std_logic;  
signal int_k_data			: std_logic_vector(1 downto 0);

signal int_tc_wr 			: std_logic; 
signal int_tc_hmode		: std_logic;
signal int_tc_vmode		: std_logic;
signal int_tc_res 		: std_logic; 

signal int_tc_tilev 		: std_logic;
signal int_tc_tileh 		: std_logic;
signal int_tc_tilec 		: std_logic;

signal int_en_wr_ptr 	: std_logic; 
signal int_en_res_ptr 	: std_logic; 

signal int_en_hmode_cnt	: std_logic;
signal int_en_vmode_cnt : std_logic;

signal int_en_tileh_ptr	: std_logic;

signal int_hmode_cnt 	: unsigned(clog2K-1 downto 0);
signal int_vmode_cnt 	: unsigned(clog2K-1 downto 0);
signal int_arv_hmode 	: unsigned(clog2K-1 downto 0);
signal int_arv_vmode		: unsigned(clog2K-1 downto 0);

signal int_arv_tilev 	: unsigned(clog2v downto 0);
signal int_arv_tileh		: unsigned(clog2h downto 0);
signal int_arv_tilec 	: unsigned(clog2c downto 0); 

signal int_tilev_ptr 	: unsigned(clog2v downto 0);  
signal int_tileh_ptr 	: unsigned(clog2h downto 0); 
 
signal int_wr_ptr 		: unsigned(clog2W-1 downto 0);
signal int_arv_wr 		: unsigned(clog2W-1 downto 0);

signal int_even_addr		: unsigned(clog2X-1 downto 0);
signal int_odd_addr		: unsigned(clog2X-1 downto 0);

-------------------------------------------------

signal int_arv_lt_ckg		: unsigned(clog2v-1 downto 0);
signal int_last_tilev_data : unsigned(clog2v-1 downto 0);
signal int_last_tileh_data : unsigned(clog2v-1 downto 0);
signal int_last_tilev		: std_logic;
signal int_last_tileh		: std_logic;

signal int_ckg_mask		: std_logic_vector(0 to W-1);
signal int_ckg_lt_mask  : std_logic_vector(0 to W-1);
signal int_ckg_rmask		: std_logic_vector(0 to W-1); 
signal int_ckg_cmask		: std_logic_vector(0 to W-1); 

-------------------------------------------------
begin
-------------------------------------------------

-- port

s_tc_wr 					<= int_tc_wr;
s_tc_hmode 				<= int_tc_hmode;
s_tc_vmode 				<= int_tc_vmode;
s_tc_res  				<= int_tc_res;
s_tc_tilev 				<= int_tc_tilev;
s_tc_tilec 				<= int_tc_tilec;

int_pe_en 	   		<= ctrl_en_pe;
int_en_hmode_cnt  	<= ctrl_en_rd_ptr;
int_en_wr_ptr  		<= ctrl_en_wr_ptr;
int_en_res_ptr 		<= ctrl_en_res_ptr;

-------------------------------------------------
-- intern
-------------------------------------------------
-- set these in fsm 
int_k_cs					<= '1';
int_k_rd					<= int_en_hmode_cnt;
--int_pe_en=(not int_en_res_ptr) and int_en_hmode_cnt;   
-------------------------------------------------
int_pe_sync_clr		<= int_tc_res;

int_last_tilev_data 	<= int_tilev_ptr(int_last_tilev_data'high downto 0);
int_last_tileh_data 	<= int_tileh_ptr(int_last_tileh_data'high downto 0);
int_arv_lt_ckg			<= int_arv_tilev(int_arv_lt_ckg'high downto 0);

int_ckg_rmask 			<= int_ckg_lt_mask when int_last_tilev = '1' else int_ckg_mask;
int_ckg_cmask 			<= int_ckg_lt_mask when int_last_tileh = '1' else int_ckg_mask;

int_en_vmode_cnt 		<= int_tc_hmode;

-------------------------------------------------

WEIGHT_BUFFER:
entity work.weight_buffer port map (
	ck 		 	=> ck,
	rst		 	=> rst,
	cs 		 	=> int_k_cs,
	rd_wr_n 		=> int_k_rd,
	vmode_ptr	=> int_vmode_cnt,
	hmode_ptr 	=> int_hmode_cnt,
	i_data		=> i_kernel,
	o_data 	 	=> int_k_data);
	
CORE: 
entity work.core port map(
	ck 	 	 	=> ck,
	rst	 	 	=> rst,
	ld 	 	 	=> int_en_wr_ptr,
	en		 		=> int_pe_en,
	sync_clr		=> int_pe_sync_clr,
	ckg_rmask	=> int_ckg_rmask,
	ckg_cmask	=> int_ckg_cmask,
	rd_ptr 	 	=> int_hmode_cnt,
	wr_ptr 	 	=> int_wr_ptr,
	i_kernel  	=> int_k_data,
	i_data 		=> i_data,
	o_data 	 	=> int_o_data);

WRITE_PIPELINE:
entity work.wr_pipe port map (
	ck						=> ck,
	rst 					=> rst,
	ctrl_en_res_ptr	=> int_en_res_ptr, 
	s_tc_res 	 		=> int_tc_res,
	i_data 	 			=> int_o_data,
	o_data 	 			=> o_data);	

VMODE_CNT:
entity work.countern generic map (N => clog2K) port map (
	ck 	=> ck, 
	rst 	=> rst, 
	en	 	=> int_en_vmode_cnt, 
	arv	=> int_arv_vmode,
	q		=> int_vmode_cnt,
	tc		=> int_tc_vmode);
											
HMODE_CNT: 
entity work.countern generic map (N => clog2K) port map (
	ck 	=> ck, 
	rst 	=> rst, 
	en 	=> int_en_hmode_cnt, 
	arv 	=> int_arv_hmode, 
	q 		=> int_hmode_cnt, 
	tc 	=> int_tc_hmode);

FIFO_CTRL: 
entity work.countern generic map (N => clog2W) port map (
	ck 		=> ck, 
	rst 		=> rst, 
	en 		=> int_en_wr_ptr, 
	arv		=> int_arv_wr, 
	q 			=> int_wr_ptr,
	tc 		=> int_tc_wr);
	
ADDR_GEN:
entity work.addr_gen port map (
	ck 				=> ck,
	rst 				=> rst,
	en					=> int_en_tileh_ptr,
	offset_val		=> int_arv_tilev,
	tilev_ptr		=> int_tilev_ptr,
	tileh_ptr		=> int_tileh_ptr,
	even_addr 		=> int_even_addr,
	odd_addr			=> int_odd_addr);
	
TILE_CTRL: 
entity work.tile_ctrl port map (
	ck 		 			=> ck,
	rst		 			=> rst,
	int_en_wr_ptr		=> int_en_wr_ptr, 
	int_tc_wr			=> int_tc_wr,
	arv_tilev			=> int_arv_tilev,
	arv_tileh			=> int_arv_tileh,
	arv_tilec			=> int_arv_tilec,
	tilev_ptr			=> int_tilev_ptr,
	tileh_ptr			=> int_tileh_ptr,
	s_tc_tilev 			=> int_tc_tilev,
	s_tc_tileh 			=> int_tc_tileh,
	s_tc_tilec 			=> int_tc_tilec,
	en_tileh_ptr 		=> int_en_tileh_ptr);

CKG_CTRL:
entity work.ckg_ctrl port map (
	ck 					=> ck,
	rst 					=> rst,
	last_tilev_data 	=> int_last_tilev_data,
	last_tileh_data 	=> int_last_tileh_data,
	arv_lt_ckg 		 	=> int_arv_lt_ckg,
	last_tilev		 	=> int_last_tilev,
	last_tileh		 	=> int_last_tileh);

GLOBALS_T:
entity work.urom port map (
	task 			=> task, 
	arv_hmode 	=> int_arv_hmode,
	arv_vmode	=> int_arv_vmode,
	arv_wr 	 	=> int_arv_wr,
	arv_tilev 	=> int_arv_tilev,
	arv_tileh 	=> int_arv_tileh,
	arv_tilec 	=> int_arv_tilec,
	ckg_lt_mask => int_ckg_lt_mask,
	ckg_mask		=> int_ckg_mask);
	
							
end architecture; 

