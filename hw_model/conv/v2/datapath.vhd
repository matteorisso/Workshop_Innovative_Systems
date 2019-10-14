library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.globals.all;

entity datapath is
port(
	ck  					: in 	std_logic; 
	rst 					: in 	std_logic;
	task					: in 	layer_t;
	i_data_mem			: in 	signed(N*(K-1)-1 downto 0);
	ctrl_en_vmode		: in 	std_logic;
	ctrl_en_npu			: in 	std_logic;
	ctrl_ld_h			: in 	std_logic;
	ctrl_ld_v			: in 	std_logic;
	ctrl_wr_pipe		: in 	std_logic;
	ctrl_sel_arv_res	: in 	std_logic;
	
	s_tc_wr				: out std_logic; 
	s_tc_hmode			: out std_logic;
	s_tc_vmode			: out std_logic;
	s_tc_res				: out std_logic; 
	s_last_tile			: out std_logic;
	s_tc_tilev			: out std_logic; 
	s_tc_tileh			: out std_logic; 
	s_tc_tileb			: out std_logic; 
	s_tc_tilec 			: out std_logic;
	
	tb						: in  std_logic; 
	tb_i_data_conv		: in  signed(2*N*(K-1)-1 downto 0); 
	-- W*N rather than N*(K-1) + data to conv_buffer?  NO, we choose this array size also to use even/odd memory split 
	tb_i_weight_conv  : in  std_logic_vector(N_WEIGHT-1 downto 0);
	
	o_data				: out PE_ARRAY_O
	);
end entity;

architecture rtl of datapath is

component core_v2 
port(
	ck 	 				: in 	std_logic;
	rst	 				: in 	std_logic;
	
	i_weight_conv		: in 	std_logic_vector(1 downto 0);
	i_data_conv_h 		: in  signed(N*(K-1)-1 downto 0);  	-- to conv_buffer
	i_data_conv_v		: in  signed(N*(K-1)-1 downto 0);  	-- to pe_array
	
	ctrl_en_npu			: in 	std_logic;
	ctrl_ld_h			: in 	std_logic;
	ctrl_ld_v			: in 	std_logic;
	ctrl_en_vmode		: in 	std_logic;
	ctrl_wr_pipe		: in 	std_logic;
	ctrl_sel_arv_res	: in 	std_logic;
	
	arv_ksize			: in 	unsigned(clog2K-1 downto 0);
	arv_wr_ptr			: in 	unsigned(clog2W-1 downto 0);	
	arv_ckg				: in 	unsigned(clog2W-1 downto 0);
	ckg_rsel				: in 	std_logic;
	ckg_csel				: in 	std_logic;
	ckg_mask				: in 	std_logic_vector(0 to W-1);
	ckg_mask_lt			: in 	std_logic_vector(0 to W-1);
				
	s_tc_wr				: out std_logic; 
	s_tc_hmode			: out std_logic;
	s_tc_vmode			: out std_logic;
	s_tc_res				: out std_logic; 
	s_last_tile			: out std_logic; 
	
	wr_ptr				: out unsigned(clog2W-1 downto 0); --LSBs ADDR.
	o_data				: out PE_ARRAY_O
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

component imem_w
port(
	ck 				: in  std_logic;
	rst 				: in 	std_logic; 
	even_rd_addr	: in 	unsigned(clog2m-1 downto 0);
	even_wr_addr	: in 	unsigned(clog2m-1 downto 0);
	odd_rd_addr 	: in 	unsigned(clog2m-1 downto 0);
	odd_wr_addr 	: in 	unsigned(clog2m-1 downto 0);
	even_odd_n		: in  std_logic;
	sel				: in	unsigned(clog2W-1 downto 0);
	sel2				: in 	std_logic; 
	i_data 			: in 	signed(N*(K-1)-1 downto 0);	
	o_data_conv 	: out signed(2*N*(K-1)-1 downto 0);
	o_data_pool		: out MemDataOut
	);
end component; 

component kmem_w
port( 
	ck 		: in 	std_logic;
	rst		: in 	std_logic;
	cs 		: in 	std_logic; 
	rd			: in 	std_logic;
	wr			: in 	std_logic;
	rd_addr	: in 	unsigned(clog2m-1 downto 0);
	wr_addr 	: in 	unsigned(clog2m-1 downto 0);
	i_data	: in 	signed(N_WEIGHT*K-1 downto 0); 
	o_data 	: out signed(N_WEIGHT*K-1 downto 0)
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

signal int_data_mem			: signed(N*(K-1)-1 downto 0);
signal int_data_pool 		: MemDataOut;

signal int_data_conv 		: signed(2*N*(K-1)-1 downto 0);
signal int_data_conv_h		: signed(N*(K-1)-1 downto 0);
signal int_data_conv_v		: signed(2*N*(K-1)-1 downto N*(K-1));
signal int_i_weight_conv	: std_logic_vector(N_WEIGHT-1 downto 0);

signal int_o_data				: PE_ARRAY_O;

signal int_even_rd_addr		: unsigned(clog2m-1 downto 0);
signal int_even_wr_addr		: unsigned(clog2m-1 downto 0);
signal int_odd_rd_addr		: unsigned(clog2m-1 downto 0);
signal int_odd_wr_addr		: unsigned(clog2m-1 downto 0);

signal int_sel_conv			: unsigned(clog2W-1 downto 0); 
signal int_sel_pool			: std_logic;

signal int_en_npu 			: std_logic;
signal int_ld_h 				: std_logic;
signal int_ld_v 				: std_logic;
signal int_wr_pipe			: std_logic;
signal int_en_vmode			: std_logic;
 
signal int_tc_hmode			: std_logic;
signal int_tc_vmode			: std_logic;
signal int_tc_wr				: std_logic;
signal int_tc_res				: std_logic; 
signal int_last_tile			: std_logic; 

signal int_ckg_en				: std_logic;
signal int_ckg_rsel			: std_logic;
signal int_ckg_csel			: std_logic;
signal int_ckg_mask			: std_logic_vector(0 to W-1);
signal int_ckg_mask_lt  	: std_logic_vector(0 to W-1);

signal int_arv_ksize 		: unsigned(clog2K-1 downto 0);
signal int_arv_wr				: unsigned(clog2W-1 downto 0);
signal int_arv_ckg			: unsigned(clog2W-1 downto 0);
signal int_sel_arv_res		: std_logic; 

signal int_arv_tilev 		: unsigned(clog2v-1 downto 0);
signal int_arv_tileh			: unsigned(clog2v-1 downto 0);
signal int_arv_tileb			: unsigned(clog2b-1 downto 0);
signal int_arv_tilec 		: unsigned(clog2c-1 downto 0); 

signal int_en_tilev_ptr 	: std_logic;
signal int_en_tileh_ptr		: std_logic;	

signal int_wr_ptr				: unsigned(clog2W-1 downto 0);
signal int_tilev_ptr 		: unsigned(clog2v-1 downto 0);  
signal int_tileh_ptr 		: unsigned(clog2v-1 downto 0); 

signal int_tc_tilev 			: std_logic;
signal int_tc_tileh 			: std_logic;
signal int_tc_tileb			: std_logic;
signal int_tc_tilec 			: std_logic;

begin
-- DFT 		
int_data_conv_v		<= (others=>'0')
	when tb = '0' else tb_i_data_conv(2*N*(K-1)-1 downto N*(K-1));

int_data_conv_h		<= (others=>'0')
	when tb = '0' else tb_i_data_conv(N*(K-1)-1 downto 0);

o_data					<= int_o_data;

int_i_weight_conv		<= tb_i_weight_conv;

int_en_npu				<= ctrl_en_npu;
int_en_vmode  			<= ctrl_en_vmode;
int_ld_h  				<= ctrl_ld_h;
int_ld_v					<= ctrl_ld_v;
int_wr_pipe		 		<= ctrl_wr_pipe;
int_sel_arv_res		<= ctrl_sel_arv_res;

int_ckg_rsel			<= int_tc_tilev;
int_ckg_csel			<= int_tc_tileh;

s_tc_wr 					<= int_tc_wr;
s_tc_hmode 				<= int_tc_hmode;
s_tc_vmode 				<= int_tc_vmode;
s_tc_res  				<= int_tc_res;
s_tc_tilev 				<= int_tc_tilev;
s_tc_tileh				<= int_tc_tileh;
s_tc_tileb				<= int_tc_tileb;
s_tc_tilec 				<= int_tc_tilec;
s_last_tile 			<= int_last_tile;--last tile v

int_en_tilev_ptr 		<= int_tc_wr and int_ld_v; 
int_sel_conv			<= int_wr_ptr;

img_mem:
imem_w port map (
	ck					=> ck,
	rst 				=> rst,
	even_rd_addr 	=> int_even_rd_addr,
	even_wr_addr	=> int_even_wr_addr,
	odd_rd_addr		=> int_odd_rd_addr,
	odd_wr_addr		=> int_odd_wr_addr,
	even_odd_n		=> int_tileh_ptr(int_tileh_ptr'low),
	sel				=> int_sel_conv,
	sel2				=> int_sel_pool,
	i_data			=> i_data_mem,
	o_data_conv		=> int_data_conv,
	o_data_pool		=> int_data_pool
	);
	
--	component kmem_w
--port( 
--	ck 		: in 	std_logic;
--	rst		: in 	std_logic;
--	cs 		: in 	std_logic; 
--	rd			: in 	std_logic;
--	wr			: in 	std_logic;
--	rd_addr	: in 	unsigned(clog2m-1 downto 0);
--	wr_addr 	: in 	unsigned(clog2m-1 downto 0);
--	i_data	: in 	signed(N_WEIGHT*K-1 downto 0); 
--	o_data 	: out signed(N_WEIGHT*K-1 downto 0)
--	);

	
core:
core_v2 port map (
	ck 					=> ck,
	rst 					=> rst, 
	ctrl_en_vmode		=> int_en_vmode,
	ctrl_en_npu			=> int_en_npu,
	ctrl_ld_h			=> int_ld_h,	
	ctrl_ld_v			=> int_ld_v,
	ctrl_wr_pipe		=> int_wr_pipe,
	ctrl_sel_arv_res 	=> int_sel_arv_res, 

	arv_wr_ptr			=> int_arv_wr,
	arv_ksize			=> int_arv_ksize,
	arv_ckg				=> int_arv_ckg,
	ckg_rsel				=> int_ckg_rsel,
	ckg_csel				=> int_ckg_csel,
	ckg_mask				=> int_ckg_mask,
	ckg_mask_lt			=> int_ckg_mask_lt,
	
	s_tc_wr				=> int_tc_wr,
	s_tc_hmode			=> int_tc_hmode,
	s_tc_vmode			=> int_tc_vmode,
	s_tc_res				=> int_tc_res,
	s_last_tile			=> int_last_tile,
	i_weight_conv		=> int_i_weight_conv,
	i_data_conv_h 		=> int_data_conv_h,
	i_data_conv_v		=> int_data_conv_v,
	wr_ptr				=> int_wr_ptr,
	o_data				=> int_o_data
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
	even_addr			=> int_even_rd_addr,
	odd_addr				=> int_odd_rd_addr
	);
	
WR_ADDR_GEN: 
addr_gen port map (
	ck 		 			=> ck,
	rst		 			=> rst,
	inc					=> int_tc_res,
	arv_tilev			=> int_arv_tilev,
	arv_tileh			=> int_arv_tileh,
	arv_tileb			=> int_arv_tileb,
	arv_tilec			=> int_arv_tilec,
	even_addr			=> int_even_wr_addr,
	odd_addr				=> int_odd_wr_addr
	);
	
GLOBALS_T:
urom port map (
	task 				=> task, 
	arv_hmode 		=> int_arv_ksize,
	arv_wr 	 		=> int_arv_wr,
	arv_tilev 		=> int_arv_tilev,
	arv_tileh		=> int_arv_tileh,
	arv_tileb 		=> int_arv_tileb,
	arv_tilec 		=> int_arv_tilec,
	arv_ckg			=> int_arv_ckg,
	ckg_mask			=> int_ckg_mask,
	ckg_mask_lt 	=> int_ckg_mask_lt
	);
end architecture; 