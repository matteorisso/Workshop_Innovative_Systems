library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity convolutional_layer is
  port (
    ck            : in  std_logic;
    rst           : in  std_logic;
    start         : in  std_logic;
    test          : in  std_logic;
    task          : in  layer_t;
    i_data_even   : in  mem_data_t;
    i_data_odd    : in  mem_data_t;
    i_data_weight : in  std_logic_vector(N_WEIGHT*K-1 downto 0);
    cs_all        : in  std_logic;
    wr            : in  std_logic_vector(0 to W-1);
    rd_spad       : in  std_logic;
    rf_ptr_spad   : in  unsigned(CLOG2W-1 downto 0);
    rd_addr_spad  : in  unsigned(CLOG2M_SP-1 downto 0);
    even_wr_addr  : in  unsigned(clog2M-1 downto 0);
    odd_wr_addr   : in  unsigned(clog2M-1 downto 0);
    done          : out std_logic;
    o_data        : out signed((N+BG2)*W-1 downto 0)
    );
end entity;

architecture rtl of convolutional_layer is

  signal even_rd_addr   : unsigned(clog2m-1 downto 0) := (others => '0');
  signal odd_rd_addr    : unsigned(clog2m-1 downto 0) := (others => '0');
  signal ctrl_en_hmode  : std_logic;
  signal ctrl_en_vmode  : std_logic;
  signal ctrl_en_npu    : std_logic;
  signal ctrl_ld_v      : std_logic;
  signal ctrl_en_rf_ptr : std_logic;
  signal ctrl_wr_pipe   : std_logic;
  signal ctrl_weight_wr : std_logic;
  signal s_tc_rd        : std_logic;
  signal s_tc_hmode     : std_logic;
  signal s_tc_vmode     : std_logic;
  signal s_tc_res       : std_logic;
  signal s_tc_tilev     : std_logic;
  signal s_tc_tileh     : std_logic;
  signal s_tc_tileb     : std_logic;
  signal s_tc_tilec     : std_logic;
  
begin
  
  top_level_dp_1 : entity work.top_level_dp
    port map (
      ck             => ck,
      rst            => rst,
      task           => task,
      test           => test,
      i_data_weight  => i_data_weight,
      i_data_even    => i_data_even,
      i_data_odd     => i_data_odd,
      cs_all         => cs_all,
      wr             => wr,
      even_wr_addr   => even_wr_addr,
      odd_wr_addr    => odd_wr_addr,
      even_rd_addr   => even_rd_addr,
      odd_rd_addr    => odd_rd_addr,
      rd_spad        => rd_spad,
      rf_ptr_spad    => rf_ptr_spad,
      rd_addr_spad   => rd_addr_spad,
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
      o_data         => o_data
      );

  conv_fsm_v2_1 : entity work.conv_fsm_v2
    port map (
      ck             => ck,
      rst            => rst,
      start          => start,
      s_tc_rd        => s_tc_rd,
      s_tc_hmode     => s_tc_hmode,
      s_tc_vmode     => s_tc_vmode,
      s_tc_res       => s_tc_res,
      s_tc_tilev     => s_tc_tilev,
      s_tc_tileh     => s_tc_tileh,
      s_tc_tileb     => s_tc_tileb,
      s_tc_tilec     => s_tc_tilec,
      ctrl_en_npu    => ctrl_en_npu,
      ctrl_en_hmode  => ctrl_en_hmode,
      ctrl_en_vmode  => ctrl_en_vmode,
      ctrl_en_rf_ptr => ctrl_en_rf_ptr,
      ctrl_ld_v      => ctrl_ld_v,
      ctrl_wr_pipe   => ctrl_wr_pipe,
      ctrl_weight_wr => ctrl_weight_wr,
      done           => done
      );

end architecture;
