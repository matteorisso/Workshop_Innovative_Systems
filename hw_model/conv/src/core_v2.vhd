library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity core_v2 is
port(
		ck 	 				: in 	std_logic;
		rst	 				: in 	std_logic;
		ctrl_ld_im			: in 	std_logic;
		ctrl_en_npu			: in 	std_logic;
		ctrl_ld_h			: in 	std_logic;
		ctrl_ld_v			: in 	std_logic;
		ctrl_wr_pipe		: in 	std_logic;
		ckg_rmask			: in 	std_logic_vector(0 to W-1);
		ckg_cmask			: in 	std_logic_vector(0 to W-1);
		i_weight_conv		: in 	std_logic_vector(1 downto 0);
	   i_data_conv_h 		: in  signed(N*(K-1)-1 downto 0);  -- to conv_buffer
		i_data_conv_v		: in  signed(N*(K-1)-1 downto 0)  -- to pe_array
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
	i_weight_fc			: in 	std_logic_vector(N_WEIGHT-1 downto 0);--TMP CHECK ALE
	i_data_conv_h		: in 	PERowData2;--signed(N*W-1 downto 0);
	i_data_conv_v		: in 	signed(N*W-1 downto 0);
	i_data_pool			: in 	PEBlockData;
	i_data_fc			: in 	signed(N-1 downto 0);
	o_data				: out PEResData2
	);
end component; 

component conv_buffer is
port(
	ck 			: in 	std_logic; 
	rst 			: in 	std_logic; 
	ld 	 		: in 	std_logic;
	rd_ptr 		: in 	unsigned(clog2W-1 downto 0); -- clog2(K-1)
 	wr_ptr		: in 	unsigned(clog2W-1 downto 0); 
	i_data 		: in  signed(N*(K-1)-1 downto 0); 
	o_data 		: out PERowData2
	);
end component; 

signal int_weight_fc		: std_logic_vector(N_WEIGHT-1 downto 0);--TMP CHECK ALE
signal int_data_fc		: signed(N-1 downto 0);
signal int_data_pool		: PEBlockData;
signal int_data_h			: PERowData2;

signal int_en_npu 	: std_logic;
signal int_ld_h 		: std_logic;
signal int_ld_v 		: std_logic;
signal int_wr_pipe	: std_logic;

begin

NPU: pe_array port map (
	ck 					=> ck,
	rst 					=> rst,
	en 					=> int_en_npu,
	ld_h 					=> int_ld_h,
	ld_v 					=> int_ld_v,
	wr_pipe 				=> int_wr_pipe,
	ckg_rmask			=> ckg_rmask,
	ckg_cmask			=> ckg_cmask,
	i_weight_conv 		=> i_weight_conv,
	i_weight_fc			=> int_weight_fc,
	i_data_conv_h 		=> int_data_h,
	i_data_conv_v 		=> i_data_conv_v,
	i_data_pool	 		=> int_data_pool,
	i_data_fc			=> int_data_fc
	);
--	
--H_FIFO: conv_buffer port map (
--	)
end architecture; 