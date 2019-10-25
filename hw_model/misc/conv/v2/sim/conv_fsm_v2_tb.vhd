-------------------------------------------------------------------------------
-- Title      : Testbench for design "conv_fsm_v2"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : conv_fsm_v2_tb.vhd
-- Author     :   <lp19.20@localhost.localdomain>
-- Company    : 
-- Created    : 2019-10-21
-- Last update: 2019-10-21
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2019 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2019-10-21  1.0      lp19.20	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity conv_fsm_v2_tb is

end entity conv_fsm_v2_tb;


architecture test of conv_fsm_v2_tb is

  -- component ports
  signal ck             : std_logic;
  signal rst            : std_logic;
  signal start          : std_logic;
  signal s_tc_rd        : std_logic;
  signal s_tc_hmode     : std_logic;
  signal s_tc_vmode     : std_logic;
  signal s_tc_res       : std_logic;
  signal s_tc_tilev     : std_logic;
  signal s_tc_tileh     : std_logic;
  signal s_tc_tileb     : std_logic;
  signal s_tc_tilec     : std_logic;
  signal ctrl_en_npu    : std_logic;
  signal ctrl_en_hmode  : std_logic;
  signal ctrl_en_vmode  : std_logic;
  signal ctrl_en_rf_ptr : std_logic;
  signal ctrl_ld_v      : std_logic;
  signal ctrl_wr_pipe   : std_logic;
  signal ctrl_weight_wr : std_logic;
  signal done           : std_logic;

  -- clock
  signal Clk : std_logic := '1';

begin  -- architecture test

  -- component instantiation
  DUT: entity work.conv_fsm_v2
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
      done           => done);

  -- clock generation
  Clk <= not Clk after 10 ns;

  -- waveform generation
  WaveGen_Proc: process
  begin
    -- insert signal assignments here

    wait until Clk = '1';
  end process WaveGen_Proc;

  

end architecture test;

-------------------------------------------------------------------------------

configuration conv_fsm_v2_tb_test_cfg of conv_fsm_v2_tb is
  for test
  end for;
end conv_fsm_v2_tb_test_cfg;

-------------------------------------------------------------------------------
  -------------------------------------------------------------------------------
