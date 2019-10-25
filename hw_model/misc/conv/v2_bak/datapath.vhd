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
		ctrl_en_hmode		: in 	std_logic;
		ctrl_en_vmode		: in 	std_logic;
		ctrl_en_npu			: in 	std_logic;
		ctrl_ld_v			: in 	std_logic;
		ctrl_en_rf_ptr		: in 	std_logic;
		ctrl_wr_pipe		: in 	std_logic;
		ctrl_weight_wr		: in  std_logic; 
		s_tc_rd				: out std_logic; 
		s_tc_hmode			: out std_logic;
		s_tc_vmode			: out std_logic;
		s_tc_res				: out std_logic; 
		s_tc_tilev			: out std_logic; 
		s_tc_tileh			: out std_logic; 
		s_tc_tileb			: out std_logic; 
		s_tc_tilec 			: out std_logic;
		tb						: in  std_logic; 
		tb_i_data_conv		: in  signed(2*N*W-1 downto 0); 
		tb_i_weight_conv  : in  std_logic_vector(N_WEIGHT*K-1 downto 0);
		
		o_data				: out o_pe_array_t
		);
end entity;

architecture rtl of datapath is

signal int_o_data			: o_pe_array_t;
signal int_data_pool 	: mem_data_t;
signal int_data_mem		: signed(N*W-1 downto 0);
signal int_data_conv_h 	: signed(N*W-1 downto 0);
signal int_data_conv_v 	: signed(N*W-1 downto 0);
signal int_i_weight_conv : std_logic_vector(N_WEIGHT*K-1 downto 0);

signal int_ckg_mask		: std_logic_vector(0 to W-1);
signal int_ckg_mask_lt	: std_logic_vector(0 to W-1);

signal int_arv_ckg 		: unsigned(clog2W-1 downto 0);
signal int_arv_res		: unsigned(clog2W-1 downto 0);
signal int_arv_rf_ptr 	: unsigned(clog2W-1 downto 0);
signal int_arv_hmode	 	: unsigned(clog2K-1 downto 0);
signal int_arv_vmode  	: unsigned(clog2K-1 downto 0);
signal int_arv_tilev  	: unsigned(clog2v-1 downto 0);
signal int_arv_tileh	 	: unsigned(clog2v-1 downto 0);
signal int_arv_tileb	 	: unsigned(clog2b-1 downto 0);
signal int_arv_tilec  	: unsigned(clog2c-1 downto 0);

signal int_tc_rd			: std_logic;
signal int_tc_res			: std_logic; 
signal int_tc_tilev 		: std_logic;
signal int_tc_tileh 		: std_logic;
signal int_tc_tileb		: std_logic;
signal int_tc_tilec 		: std_logic;

signal int_s_tc_tilev 	: std_logic;
signal int_s_tc_tileh 	: std_logic;
signal int_s_tc_tileb 	: std_logic;
signal int_s_tc_tilec 	: std_logic;

signal int_even_odd_n 	: std_logic;
signal int_even_rd_addr	: unsigned(clog2M-1 downto 0);
signal int_odd_rd_addr	: unsigned(clog2M-1 downto 0); 
signal int_rf_ptr  		: unsigned(clog2W-1 downto 0);

signal int_hmode_cnt		: unsigned(clog2K-1 downto 0);
signal int_vmode_cnt		: unsigned(clog2K-1 downto 0);

signal int_weight_wr		: std_logic;

begin

	s_tc_rd	 	<= int_tc_rd;
	s_tc_res		<= int_tc_res;
	s_tc_tilev	<= int_s_tc_tilev;
	s_tc_tileh	<= int_s_tc_tileh;
	s_tc_tileb	<= int_s_tc_tileb;
	s_tc_tilec	<= int_s_tc_tilec;

	int_weight_wr	<= (int_s_tc_tileh and int_s_tc_tilev and (ctrl_en_vmode or int_tc_res)) or ctrl_weight_wr;
	int_arv_res		<= int_arv_rf_ptr when int_s_tc_tileh = '0' else int_arv_ckg; 

	o_reg:
	process(ck, rst, ctrl_wr_pipe)
	begin
		if rst = '1' then 
			o_data <= (others=>(others=>'0'));
		elsif rising_edge(ck) and ctrl_wr_pipe = '1' then
			o_data <= int_o_data;
		end if;
	end process;

	core_inst:
	entity work.core_v2 port map (	
		ck 					=> ck,
		rst 					=> rst, 
		en_npu				=> ctrl_en_npu,
		ld_h					=> ctrl_en_hmode,
		ld_v					=> ctrl_ld_v,
		rld_v					=> int_tc_res,
		wr_pipe				=> ctrl_wr_pipe,
		ckg_rsel				=> int_s_tc_tilev,
		ckg_csel				=> int_s_tc_tileh,
		ckg_mask				=> int_ckg_mask,
		ckg_mask_lt			=> int_ckg_mask_lt,
		weight_rd			=> ctrl_en_hmode,
		weight_wr			=> int_weight_wr,
		weight_sel			=> int_hmode_cnt,
		weight_rd_ptr		=> int_vmode_cnt,
		weight_wr_ptr		=> int_vmode_cnt,
		i_weight_conv		=> int_i_weight_conv,
		i_data_conv_h 		=> int_data_conv_h,
		i_data_conv_v		=> int_data_conv_v,
		o_data				=> int_o_data
		);

	npu_ctrl_inst:
	entity work.npu_ctrl port map (
		ck				=> ck,
		rst 			=> rst,
		en_vmode 	=> ctrl_en_vmode,
		en_hmode		=> ctrl_en_hmode,
		wr_pipe		=> ctrl_wr_pipe,
		arv_vmode	=> int_arv_vmode,	
		arv_res		=> int_arv_res,		
		hmode_cnt   => int_hmode_cnt,     
		vmode_cnt 	=> int_vmode_cnt,		
		tc_hmode		=> s_tc_hmode,	
		tc_vmode		=> s_tc_vmode,	
		tc_res		=> int_tc_res		
		);
		
	s_tile_gen_inst:
	entity work.s_tile_gen port map (
		ck					=> ck,
		rst 				=> rst,
		ck_en 			=> int_tc_res,
		tc_tilev		 	=> int_tc_tilev,
		tc_tileh 		=> int_tc_tileh,
		tc_tileb			=> int_tc_tileb,
		tc_tilec 		=> int_tc_tilec,
		s_tc_tilev	 	=> int_s_tc_tilev,
		s_tc_tileh	 	=> int_s_tc_tileh,
		s_tc_tileb 		=> int_s_tc_tileb,
		s_tc_tilec 		=> int_s_tc_tilec
		);

	addr_gen_inst: 
	entity work.addr_gen port map (
		ck 		 		=> ck,
		rst		 		=> rst,
		inc				=> ctrl_en_rf_ptr,
		arv_rf_ptr		=> int_arv_rf_ptr,
		arv_tilev		=> int_arv_tilev,
		arv_tileh		=> int_arv_tileh,
		arv_tileb		=> int_arv_tileb,
		arv_tilec		=> int_arv_tilec,
		tc_rd				=> int_tc_rd,
		tc_tilev 		=> int_tc_tilev,
		tc_tileh 		=> int_tc_tileh,
		tc_tileb			=> int_tc_tileb,
		tc_tilec 		=> int_tc_tilec,
		even_odd_n		=> int_even_odd_n,
		even_addr		=> int_even_rd_addr,
		odd_addr			=> int_odd_rd_addr,
		rf_ptr			=> int_rf_ptr
		);
		
	globals_inst:
	entity work.urom port map (
		task 				=> task, 
		arv_hmode 		=> int_arv_hmode,
		arv_vmode		=> int_arv_vmode,
		arv_rf_ptr 	 	=> int_arv_rf_ptr,
		arv_tilev 		=> int_arv_tilev,
		arv_tileh		=> int_arv_tileh,
		arv_tileb 		=> int_arv_tileb,
		arv_tilec 		=> int_arv_tilec,
		arv_ckg			=> int_arv_ckg,
		ckg_mask			=> int_ckg_mask,
		ckg_mask_lt 	=> int_ckg_mask_lt
		);
end architecture; 