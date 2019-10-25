-------------------------------------------------------------------------------
-- Title      : Testbench for design "addr_gen"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : addr_gen_tb.vhd
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

entity addr_gen_tb is

end entity addr_gen_tb;

-------------------------------------------------------------------------------

architecture addr_gen of addr_gen_tb is

  -- component ports
  

  -- clock
  signal Clk : std_logic := '1';

begin  -- architecture addr_gen

  -- component instantiation
  DUT: entity work.addr_gen;

  -- clock generation
  Clk <= not Clk after 10 ns;

  -- waveform generation
  WaveGen_Proc: process
  begin
    -- insert signal assignments here

    wait until Clk = '1';
  end process WaveGen_Proc;

  

end architecture addr_gen;

-------------------------------------------------------------------------------

configuration addr_gen_tb_addr_gen_cfg of addr_gen_tb is
  for addr_gen
  end for;
end addr_gen_tb_addr_gen_cfg;

-------------------------------------------------------------------------------
