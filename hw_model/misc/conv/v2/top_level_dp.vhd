library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity top_level_dp is
  port(
    ck             : in  std_logic;
    rst            : in  std_logic;
    task           : in  layer_t;
    test           : in  std_logic;
    i_data_even    : in  mem_data_t;
    i_data_odd     : in  mem_data_t;
    cs_all         : in  std_logic;
    rd             : in  std_logic_vector(0 to W-1);
    wr             : in  std_logic_vector(0 to W-1);
    even_rd_addr   : in  unsigned(clog2m-1 downto 0);
    even_wr_addr   : in  unsigned(clog2m-1 downto 0);
    odd_rd_addr    : in  unsigned(clog2m-1 downto 0);
    odd_wr_addr    : in  unsigned(clog2m-1 downto 0);
    ctrl_en_hmode  : in  std_logic;
    ctrl_en_vmode  : in  std_logic;
    ctrl_en_npu    : in  std_logic;
    ctrl_ld_v      : in  std_logic;
    ctrl_en_rf_ptr : in  std_logic;
    ctrl_wr_pipe   : in  std_logic;
    ctrl_weight_wr : in  std_logic;
    s_tc_rd        : out std_logic;
    s_tc_hmode     : out std_logic;
    s_tc_vmode     : out std_logic;
    s_tc_res       : out std_logic;
    s_tc_tilev     : out std_logic;
    s_tc_tileh     : out std_logic;
    s_tc_tileb     : out std_logic;
    s_tc_tilec     : out std_logic;
    o_data         : out o_pe_array_t
    );
end entity;

architecture rtl of top_level_dp is

  signal int_data_even : mem_data_t;
  signal int_data_odd  : mem_data_t;
  signal int_weight    : std_logic_vector(K*N_WEIGHT-1 downto 0);


  signal int_cs_all       : std_logic;
  signal int_cs_enc       : unsigned(clog2W-1 downto 0);
  signal int_rd           : std_logic_vector(0 to W-1);
  signal int_wr           : std_logic_vector(0 to W-1);
  signal int_addr_rd_even : unsigned(clog2m-1 downto 0);
  signal int_addr_wr_even : unsigned(clog2m-1 downto 0);
  signal int_addr_rd_odd  : unsigned(clog2m-1 downto 0);
  signal int_addr_wr_odd  : unsigned(clog2m-1 downto 0);
  -- signal int_even_rd_addr_dp : unsigned(clog2m-1 downto 0);
  -- signal int_even_wr_addr_dp : unsigned(clog2m-1 downto 0);
  -- signal int_odd_rd_addr_dp  : unsigned(clog2m-1 downto 0);
  -- signal int_odd_wr_addr_dp  : unsigned(clog2m-1 downto 0);
  
begin

  dp_inst:
    entity work.datapath port map (
      ck             => ck,
      rst            => rst,
      task           => task,
      ctrl_en_hmode  => ctrl_en_hmode,
      ctrl_en_vmode  => ctrl_en_vmode,
      ctrl_en_npu    => ctrl_en_npu,
      ctrl_ld_v      => ctrl_ld_v,
      ctrl_en_rf_ptr => ctrl_en_rf_ptr,
      ctrl_wr_pipe   => ctrl_wr_pipe,
      ctrl_weight_wr => ctrl_weight_wr,
      s_tc_rd        => s_tc_rd,
      s_tc_hmode     => s_tc_hmode,
      s_tc_vmode     => s_tc_vmode,
      s_tc_res       => s_tc_res,
      s_tc_tilev     => s_tc_tilev,
      s_tc_tileh     => s_tc_tileh,
      s_tc_tileb     => s_tc_tileb,
      s_tc_tilec     => s_tc_tilec,
      i_weight       => int_weight,
      i_data_even    => int_data_even,
      i_data_odd     => int_data_odd,
      o_cs_enc       => int_cs_enc,
      o_addr_rd_even => int_addr_rd_even,
      o_addr_wr_even => int_addr_wr_even,
      o_addr_rd_odd  => int_addr_rd_odd,
      o_addr_wr_odd  => int_addr_wr_odd,
      o_data         => o_data
      );

  imem_inst:
    entity work.imem_w port map (
      ck           => ck,
      rst          => rst,
      test         => test,
      i_data_even  => i_data_even,
      i_data_odd   => i_data_odd,
      cs_all       => int_cs_all,
      cs_enc       => int_cs_enc,
      rd           => int_rd,
      wr           => int_wr,
      even_rd_addr => int_addr_rd_even,
      even_wr_addr => int_addr_wr_even,
      odd_rd_addr  => int_addr_rd_odd,
      odd_wr_addr  => int_addr_wr_odd,
      o_data_even  => int_data_even,
      o_data_odd   => int_data_odd
      );

  int_cs_all <= cs_all;
  int_rd     <= (others => ctrl_en_rf_ptr);
  int_wr     <= wr;

  -- TMP
  int_weight       <= (others => '1');
  int_addr_wr_even <= (others => '0');
  int_addr_wr_odd  <= (others => '0');
  
end architecture;
