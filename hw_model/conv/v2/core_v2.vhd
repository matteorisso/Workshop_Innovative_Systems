library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity core_v2 is
port(
	ck 	 				: in 	std_logic;
	rst	 				: in 	std_logic;
	
	i_weight_conv		: in 	std_logic_vector(1 downto 0);
	i_data_conv_h 		: in  signed(N*(K-1)-1 downto 0);	-- to conv_buffer
	i_data_conv_v		: in  signed(N*(K-1)-1 downto 0);  	-- to pe_array
	
	ctrl_en_npu			: in 	std_logic;
	ctrl_ld_h			: in 	std_logic;
	ctrl_ld_v			: in 	std_logic;
	ctrl_en_vmode		: in 	std_logic; -- since npu size diff. ksize
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
end entity;

architecture rtl of core_v2 is

component pe_array
port(
	ck 					: in 	std_logic;
	rst 					: in 	std_logic;
	en						: in 	std_logic;
	ld_h					: in	std_logic;
	ld_v					: in	std_logic;
	wr_pipe				: in	std_logic;
	ckg_rmask  			: in 	std_logic_vector(0 to W-1);
	ckg_cmask 			: in 	std_logic_vector(0 to W-1);
	i_weight_conv	 	: in	std_logic_vector(N_WEIGHT-1 downto 0); 
	i_data_conv_h		: in 	PE_ARRAY_I;
	i_data_conv_v		: in 	PE_ARRAY_I;
	i_data_pool			: in 	PEBlockData;
	i_weight_fc			: in 	std_logic_vector(N_WEIGHT-1 downto 0);	--TMP CHECK ALE
	i_data_fc			: in 	signed(N-1 downto 0);
	o_data				: out PE_ARRAY_O
	);
end component; 

component conv_buffer
port(
	ck 		: in 	std_logic; 
	rst 		: in 	std_logic; 
	ld 	 	: in 	std_logic;
	rd_ptr 	: in 	unsigned(clog2W-1 downto 0); -- clog2(K-1)
 	wr_ptr 	: in 	unsigned(clog2W-1 downto 0); 
	i_data 	: in  signed(N*(K-1)-1 downto 0); 
	o_data 	: out PE_ARRAY_I
	);
end component; 

component countern 
generic ( N	: natural := 16 );    
port( 
	ck 			: in 	std_logic; 
	rst			: in 	std_logic; 
	sync_clr		: in 	std_logic; 
	en 			: in 	std_logic;
	arv			: in 	unsigned(N-1 downto 0); 
	q 				: out unsigned(N-1 downto 0); 
	tc				: out std_logic
	);
end component; 

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



signal int_weight_fc				: std_logic_vector(N_WEIGHT-1 downto 0);--TMP CHECK ALE
signal int_data_fc				: signed(N-1 downto 0);
signal int_data_pool				: PEBlockData;
signal int_i_data_conv_h		: signed(N*(K-1)-1 downto 0);
signal int_i_data_conv_v		: signed(N*(K-1)-1 downto 0);
signal int_data_conv_h			: PE_ARRAY_I;
signal int_data_conv_v			: PE_ARRAY_I;
signal int_o_data					: PE_ARRAY_O;

signal int_rd_ptr					: unsigned(1 downto 0); -- clog2(K-1)
signal int_wr_ptr					: unsigned(clog2W-1 downto 0);

signal int_en_npu 				: std_logic;
signal int_ld_h 					: std_logic;
signal int_ld_v 					: std_logic;
signal int_wr_pipe				: std_logic;
signal int_en_wr_ptr 			: std_logic;
signal int_last_tile				: std_logic;

signal int_en_hmode_cnt			: std_logic;
signal int_en_vmode_cnt			: std_logic; 

signal int_tc_wr 					: std_logic; 
signal int_tc_res					: std_logic; 
signal int_tc_hmode				: std_logic;
signal int_tc_vmode				: std_logic;

signal int_arv_wr 				: unsigned(clog2W-1 downto 0);
signal int_arv_res				: unsigned(clog2W-1 downto 0);
signal int_arv_ksize 			: unsigned(clog2K-1 downto 0);
signal int_arv_ckg				: unsigned(clog2W-1 downto 0);
signal int_sel_arv_res			: std_logic; 

signal int_ck_en					: std_logic;
signal int_ckg_rsel				: std_logic;
signal int_ckg_csel				: std_logic;
signal int_ckg_mask				: std_logic_vector(0 to W-1);
signal int_ckg_mask_lt  		: std_logic_vector(0 to W-1);
signal int_ckg_rmask				: std_logic_vector(0 to W-1); 
signal int_ckg_cmask				: std_logic_vector(0 to W-1); 

signal int_hmode_cnt 			: unsigned(clog2K-1 downto 0);

begin

int_i_data_conv_v		<= i_data_conv_v;
int_i_data_conv_h		<= i_data_conv_h;

int_data_conv_v(0) 	<= int_i_data_conv_v( (N*(K-1)-1 -0*N) downto (N*(K-1) - 1*N) );
int_data_conv_v(1) 	<= int_i_data_conv_v( (N*(K-1)-1 -1*N) downto (N*(K-1) - 2*N) );
int_data_conv_v(2)	<= int_i_data_conv_v( (N*(K-1)-1 -2*N) downto (N*(K-1) - 3*N) );
int_data_conv_v(3)	<= int_i_data_conv_v( (N*(K-1)-1 -3*N) downto (N*(K-1) - 4*N) );

o_data 					<= int_o_data;
wr_ptr					<= int_wr_ptr;


int_en_npu 				<= ctrl_en_npu;
int_ld_h					<= ctrl_ld_h or ctrl_ld_v;
int_ld_v					<= ctrl_ld_v;

int_en_hmode_cnt		<= ctrl_ld_h;
int_en_vmode_cnt		<= ctrl_en_vmode or int_tc_res;

int_en_wr_ptr			<= ctrl_ld_v;
int_wr_pipe				<= ctrl_wr_pipe;
int_sel_arv_res		<= ctrl_sel_arv_res;

int_arv_wr				<= arv_wr_ptr;
int_arv_ksize			<= arv_ksize;
int_arv_ckg				<= arv_ckg;
int_arv_res				<= int_arv_wr; 
--	when int_sel_arv_res = '0' else int_arv_ckg; @TCTILEH!! new state in fsm ?
int_ck_en				<= int_tc_res;
int_ckg_rsel			<= ckg_rsel;
int_ckg_csel			<= ckg_csel;
int_ckg_mask			<= ckg_mask;
int_ckg_mask_lt		<= ckg_mask_lt;

s_tc_wr 					<= int_tc_wr;
s_tc_hmode 				<= int_tc_hmode;
s_tc_vmode 				<= int_tc_vmode;
s_tc_res  				<= int_tc_res;
s_last_tile 			<= int_last_tile;

int_rd_ptr				<= int_hmode_cnt(int_hmode_cnt'high-1 downto 0);

NPU: pe_array port map (
	ck 					=> ck,
	rst 					=> rst,
	en 					=> int_en_npu,
	ld_h 					=> int_ld_h,
	ld_v 					=> int_ld_v,
	wr_pipe 				=> int_wr_pipe,
	ckg_rmask			=> int_ckg_rmask,
	ckg_cmask			=> int_ckg_cmask,
	i_weight_conv 		=> i_weight_conv,
	i_weight_fc			=> int_weight_fc,
	i_data_conv_h 		=> int_data_conv_h,
	i_data_conv_v 		=> int_data_conv_v,
	i_data_pool	 		=> int_data_pool,
	i_data_fc			=> int_data_fc,
	o_data				=> int_o_data
	);

H_FIFO: conv_buffer port map (
	ck				=> ck,
	rst 			=> rst,
	ld				=> int_ld_v,
	rd_ptr 		=> int_rd_ptr,
	wr_ptr		=>	int_wr_ptr,
	i_data 		=>	int_i_data_conv_h,
	o_data		=>	int_data_conv_h
	);

FIFO_CTRL: 
countern generic map (N => int_arv_wr'length) port map (
	ck 			=> ck, 
	rst 			=> rst, 
	sync_clr 	=> '0',
	en 			=> int_en_wr_ptr, 
	arv			=> int_arv_wr, 
	q 				=> int_wr_ptr,
	tc 			=> int_tc_wr
	);

VMODE_CNT:
countern generic map (N => int_arv_ksize'length) port map (
	ck 			=> ck, 
	rst 			=> rst, 
	sync_clr 	=> '0',
	en	 			=> int_en_vmode_cnt, 
	arv			=> int_arv_ksize,
	tc				=> int_tc_vmode
	);
											
HMODE_CNT: 
countern generic map (N => int_arv_ksize'length) port map (
	ck 			=> ck, 
	rst 			=> rst, 
	sync_clr 	=> '0',
	en 			=> int_en_hmode_cnt, 
	arv 			=> int_arv_ksize, 
	q 				=> int_hmode_cnt, 
	tc 			=> int_tc_hmode
	);
	
RES_PIPE_CNT: 
countern generic map(N => int_arv_res'length) port map(
	ck 		=> ck, 
	rst		=> rst,
	sync_clr => '0',
	en 		=> int_wr_pipe,
	arv		=> int_arv_res,
	tc 		=> int_tc_res);
	
CKG_MASK_CTRL:
ckg_ctrl port map (
	ck 				=> ck,
	rst 				=> rst,
	ck_en				=> int_ck_en,
	ckg_rsel 		=> int_ckg_rsel,
	ckg_csel			=> int_ckg_csel,
	ckg_mask			=> int_ckg_mask,
	ckg_mask_lt		=> int_ckg_mask_lt,
	ckg_rmask		=> int_ckg_rmask,
	ckg_cmask		=> int_ckg_cmask,
	s_ckg				=> int_last_tile
	);
	
end architecture; 