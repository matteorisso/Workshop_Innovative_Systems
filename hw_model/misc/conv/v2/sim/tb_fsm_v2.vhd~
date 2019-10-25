
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity tb_fsm_v2 is
end entity;

architecture test of tb_fsm_v2 is

  signal ck             : std_logic                  := '0';
  signal rst            : std_logic                  := '1';
  signal start          : std_logic                  := '0';
  signal task           : layer_t                    := c2;
  signal test           : std_logic;
  signal i_data_even    : mem_data_t                 := (others => (others => '0'));
  signal i_data_odd     : mem_data_t                 := (others => (others => '0'));
  signal cs_all         : std_logic                  := '0';
  signal rd             : std_logic_vector(0 to W-1) := (others => '1');
  signal wr             : std_logic_vector(0 to W-1) := (others => '0');
  signal even_rd_addr   : unsigned(clog2m-1 downto 0);
  signal even_wr_addr   : unsigned(clog2m-1 downto 0);
  signal odd_rd_addr    : unsigned(clog2m-1 downto 0);
  signal odd_wr_addr    : unsigned(clog2m-1 downto 0);
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
      test           => '1',
      i_data_even    => i_data_even,
      i_data_odd     => i_data_odd,
      cs_all         => cs_all,
      rd             => rd,
      wr             => wr,
      even_rd_addr   => even_rd_addr,
      even_wr_addr   => even_wr_addr,
      odd_rd_addr    => odd_rd_addr,
      odd_wr_addr    => odd_wr_addr,
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
      s_tc_tilec     => s_tc_tilec
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
      ctrl_weight_wr => ctrl_weight_wr
      );

  -- stimuli
  
  ck    <= not ck after 5 ns;
  rst   <= '0'    after 10 ns;
  start <= '1'    after 15 ns;

end architecture;
