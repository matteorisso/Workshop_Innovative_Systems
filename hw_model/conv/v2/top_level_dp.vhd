library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity top_level_dp is
  port(
    );
end entity;

architecture rtl of top_level_dp is

begin
  dp_inst:
    entity work.datapath port map (
      ck             => ck,
      rst            => rst,
      task           => task,
      test           => '1',
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
      i_data_v       => int_data_v,
      i_data_h       => int_data_h,
      o_data         => o_data
      );

  
  imem_inst:
    entity work.imem_w port map (
);

  

end architecture;
