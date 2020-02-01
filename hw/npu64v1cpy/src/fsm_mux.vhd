library ieee;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm_mux is
  port(
    sel_cp_fc_n     : in  std_logic;
    fc_ctrl_en_npu  : in  std_logic;
    fc_ctrl_ldh_v_n : in  std_logic;
    fc_ctrl_wr_pipe : in  std_logic;
    c_ctrl_en_npu   : in  std_logic;
    c_ctrl_en_hmode : in  std_logic;
    c_ctrl_en_vmode : in  std_logic;
    c_ctrl_ldh_v_n  : in  std_logic;
    c_ctrl_wr_pipe  : in  std_logic;
    c_ctrl_en_p     : in  std_logic;
    c_ctrl_wr_mem   : in  std_logic;
    ctrl_en_npu     : out std_logic;
    ctrl_en_hmode   : out std_logic;
    ctrl_en_vmode   : out std_logic;
    ctrl_ldh_v_n    : out std_logic;
    ctrl_wr_pipe    : out std_logic;
    ctrl_en_p       : out std_logic;
    ctrl_wr_mem     : out std_logic
    );
end entity;

architecture beh of fsm_mux is

begin

  process(sel_cp_fc_n)
  begin
    if sel_cp_fc_n = '1' then
      ctrl_en_npu   <= fc_ctrl_en_npu;
      ctrl_ldh_v_n  <= fc_ctrl_ldh_v_n;
      ctrl_wr_pipe  <= fc_ctrl_wr_pipe;
      ctrl_wr_mem   <= fc_ctrl_wr_pipe;
      ctrl_en_p     <= '0';
      ctrl_en_hmode <= '0';
      ctrl_en_vmode <= '0';
    else
      ctrl_en_npu   <= c_ctrl_en_npu;
      ctrl_ldh_v_n  <= c_ctrl_ldh_v_n;
      ctrl_wr_pipe  <= c_ctrl_wr_pipe;
      ctrl_wr_mem   <= c_ctrl_wr_pipe;
      ctrl_en_p     <= c_ctrl_en_p;
      ctrl_en_hmode <= c_ctrl_en_hmode;
      ctrl_en_vmode <= c_ctrl_en_vmode;
    end if;
  end process;
end architecture;
