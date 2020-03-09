library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.globals.all;

entity addr_gen_o_ctrl is
  port(
    ctrl_cfg           : in  std_logic;
    psx_ctrl_wr_mem    : in  std_logic;
    psx_ctrl_en_st     : in  std_logic;
    s_tc_L2            : in  std_logic;
    s_tc_L3            : in  std_logic;
    s_tc_L4            : in  std_logic;
    s_L3_ptr_1         : in  std_logic;
    sync_clr_even      : out std_logic;
    sync_clr_odd       : out std_logic;
    clr_offs_even      : out std_logic;
    clr_offs_odd       : out std_logic;
    mux_base_addr_even : out std_logic;
    mux_base_addr_odd  : out std_logic;
    en_base_even       : out std_logic;
    en_base_odd        : out std_logic;
    en_offs_even       : out std_logic;
    en_offs_odd        : out std_logic
    );
end entity;

architecture rtl of addr_gen_o_ctrl is
  
  signal int_c_sync_clr_even       : std_logic;
  signal int_c_clr_offs_even       : std_logic;
  signal int_c_mux_base_addr_even  : std_logic;
  signal int_c_en_base_even        : std_logic;
  signal int_c_en_offs_even        : std_logic;
  signal int_c_sync_clr_odd        : std_logic;
  signal int_c_clr_offs_odd        : std_logic;
  signal int_c_mux_base_addr_odd   : std_logic;
  signal int_c_en_base_odd         : std_logic;
  signal int_c_en_offs_odd         : std_logic;
  signal int_fc_sync_clr_even      : std_logic;
  signal int_fc_clr_offs_even      : std_logic;
  signal int_fc_mux_base_addr_even : std_logic;
  signal int_fc_en_base_even       : std_logic;
  signal int_fc_en_offs_even       : std_logic;
  signal int_fc_sync_clr_odd       : std_logic;
  signal int_fc_clr_offs_odd       : std_logic;
  signal int_fc_mux_base_addr_odd  : std_logic;
  signal int_fc_en_base_odd        : std_logic;
  signal int_fc_en_offs_odd        : std_logic;
  
begin
  --//convolution
  int_c_sync_clr_even       <= s_tc_L2 and s_tc_L3 and s_tc_L4 and psx_ctrl_en_st;  --// end of layer
  int_c_clr_offs_even       <= s_tc_L2 and psx_ctrl_en_st;  --// clr offs at new tilev (byte done) 
  int_c_mux_base_addr_even  <= '0';
  int_c_en_base_even        <= s_tc_L2 and s_tc_L3 and psx_ctrl_en_st;  --// update base at new ofmap after wrb
  int_c_en_offs_even        <= psx_ctrl_wr_mem and not(s_L3_ptr_1);  --// inc offs after word is completed  
  int_c_sync_clr_odd        <= s_tc_L2 and s_tc_L3 and s_tc_L4 and psx_ctrl_en_st;
  int_c_clr_offs_odd        <= s_tc_L2 and psx_ctrl_en_st;
  int_c_mux_base_addr_odd   <= '0';
  int_c_en_base_odd         <= s_tc_L2 and s_tc_L3 and psx_ctrl_en_st;
  int_c_en_offs_odd         <= psx_ctrl_wr_mem and s_L3_ptr_1;
  --// classifier
  int_fc_sync_clr_even      <= '0';
  int_fc_clr_offs_even      <= '0';
  int_fc_mux_base_addr_even <= '0';
  int_fc_en_base_even       <= '0';
  int_fc_en_offs_even       <= '0';     --psx_ctrl_wr_mem
  int_fc_sync_clr_odd       <= '0';
  int_fc_clr_offs_odd       <= '0';
  int_fc_mux_base_addr_odd  <= '0';
  int_fc_en_base_odd        <= '0';
  int_fc_en_offs_odd        <= '0';

  sync_clr_even      <= int_fc_sync_clr_even      when ctrl_cfg = '1' else int_c_sync_clr_even;
  clr_offs_even      <= int_fc_clr_offs_even      when ctrl_cfg = '1' else int_c_clr_offs_even;
  mux_base_addr_even <= int_fc_mux_base_addr_even when ctrl_cfg = '1' else int_c_mux_base_addr_even;
  en_base_even       <= int_fc_en_base_even       when ctrl_cfg = '1' else int_c_en_base_even;
  en_offs_even       <= int_fc_en_offs_even       when ctrl_cfg = '1' else int_c_en_offs_even;
  sync_clr_odd       <= int_fc_sync_clr_odd       when ctrl_cfg = '1' else int_c_sync_clr_odd;
  clr_offs_odd       <= int_fc_clr_offs_odd       when ctrl_cfg = '1' else int_c_clr_offs_odd;
  mux_base_addr_odd  <= int_fc_mux_base_addr_odd  when ctrl_cfg = '1' else int_c_mux_base_addr_odd;
  en_base_odd        <= int_fc_en_base_odd        when ctrl_cfg = '1' else int_c_en_base_odd;
  en_offs_odd        <= int_fc_en_offs_odd        when ctrl_cfg = '1' else int_c_en_offs_odd;
  
end architecture;
