-------------------------------------------------------------------------------
-- Title      : Testbench for design "convolutional_layer"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : convolutional_layer_tb.vhd
-- Author     :   <lp19.20@localhost.localdomain>
-- Company    : 
-- Created    : 2019-10-22
-- Last update: 2019-10-25
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2019 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2019-10-22  1.0      lp19.20 Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

-------------------------------------------------------------------------------

entity convolutional_layer_tb is
end entity convolutional_layer_tb;

-------------------------------------------------------------------------------

architecture test of convolutional_layer_tb is

  -- component ports
  signal tb_ck            : std_logic                               := '0';
  signal tb_rst           : std_logic                               := '1';
  signal tb_start         : std_logic                               := '0';
  signal tb_test          : std_logic                               := '0';
  signal tb_task          : layer_t                                 := c2;
  signal tb_i_data_even   : mem_data_t                              := (others => (others => '1'));
  signal tb_i_data_odd    : mem_data_t                              := (others => (others => '1'));
  signal tb_i_data_weight : std_logic_vector(N_WEIGHT*K-1 downto 0) := (others => '1');
  signal tb_cs_all        : std_logic                               := '0';
  signal tb_wr            : std_logic_vector(0 to W-1)              := (others => '0');
  signal tb_even_wr_addr  : unsigned(clog2M-1 downto 0)             := (others => '0');
  signal tb_odd_wr_addr   : unsigned(clog2M-1 downto 0)             := (others => '0');
  signal tb_rd_spad       : std_logic                               := '0';
  signal tb_rf_ptr_spad   : unsigned(clog2W-1 downto 0)             := (others => '0');
  signal tb_rd_addr_spad  : unsigned(clog2M_SP-1 downto 0)          := (others => '0');
  signal tb_done          : std_logic;
  signal tb_o_data        : signed((N+BG2)*W-1 downto 0);

  -- testbench 
  constant half_period : time    := 5 ns;
  signal wr_max_addr   : natural := 0;
  signal rd_max_addr   : natural := 0;
  
begin  -- architecture test

  -- component instantiation
  DUT : entity work.convolutional_layer
    port map (
      ck            => tb_ck,
      rst           => tb_rst,
      start         => tb_start,
      test          => tb_test,
      task          => tb_task,
      i_data_even   => tb_i_data_even,
      i_data_odd    => tb_i_data_odd,
      i_data_weight => tb_i_data_weight,
      cs_all        => tb_cs_all,
      wr            => tb_wr,
      rd_spad       => tb_rd_spad,
      rf_ptr_spad   => tb_rf_ptr_spad,
      rd_addr_spad  => tb_rd_addr_spad,
      even_wr_addr  => tb_even_wr_addr,
      odd_wr_addr   => tb_odd_wr_addr,
      done          => tb_done,
      o_data        => tb_o_data
      );

  -- clock generation
  tb_ck  <= not tb_ck after half_period;
  -- rst
  tb_rst <= '0'       after half_period;

  -- start
  process
  begin
    wait until falling_edge(tb_cs_all);
    tb_start   <= '1';
    wait for 10 ns;
    tb_start   <= '0';
    wait until rising_edge(tb_done);
    tb_rd_spad <= '1';
    wait;
  end process;

  -- set max addr for tb : config file (test signal idem)
  rd_max_addr <= C2_MEM_WIDTH_SP-1 when tb_task = C2 else C1_MEM_WIDTH_SP-1;
  wr_max_addr <= C2_MEM_WIDTH-1    when tb_task = C2 else C2_MEM_WIDTH_SP-1;

  -- init proc
  process(tb_ck)
    
    variable init_v : boolean                := false;
    variable px_v   : signed(N-1 downto 0)   := (others => '0');
    variable word_v : signed(N*W-1 downto 0) := (others => '0');
    
  begin

    if rising_edge(tb_ck) and tb_test = '0' then
      if init_v = false then
        if tb_even_wr_addr = wr_max_addr then

          init_v := true;

          tb_even_wr_addr <= (others => '0');
          tb_odd_wr_addr  <= (others => '0');
          tb_cs_all       <= '0';
          tb_wr           <= (others => '0');
          
          
        else
          
          for i in 0 to W-1 loop        -- nb banks
            for j in 0 to W-1 loop      -- px in word
              word_v(word_v'length -1 - j*px_v'length downto word_v'length - (j+1)*px_v'length) := (others => '1');  -- px_v+j;
            end loop;

            tb_i_data_even(i) <= word_v;
            tb_i_data_odd(i)  <= word_v;

          end loop;

          px_v := px_v+1;

          tb_cs_all <= '1';
          tb_wr     <= (others => '1');

          if tb_cs_all = '1' then
            
            tb_even_wr_addr <= tb_even_wr_addr +1;
            tb_odd_wr_addr  <= tb_odd_wr_addr +1;
          end if;
        end if;
      end if;
    end if;
  end process;


  -- rd scratchpad @DONE

  process(tb_ck)
    variable sim_finished_v : boolean := false;

  begin
    
    if rising_edge(tb_ck) then
      if sim_finished_v = false then
        if tb_rd_spad = '1' then
          if tb_rf_ptr_spad = W-1 then
            tb_rf_ptr_spad <= (others => '0');
            if tb_rd_addr_spad = rd_max_addr then
              sim_finished_v  := true;
              tb_rd_addr_spad <= (others => '0');
            else
              tb_rd_addr_spad <= tb_rd_addr_spad+1;
            end if;
          else
            tb_rf_ptr_spad <= tb_rf_ptr_spad+1;
            
          end if;
        end if;
      end if;
    end if;
  end process;

  -- check o_data against expected result
  
end architecture test;

-------------------------------------------------------------------------------

configuration convolutional_layer_tb_test_cfg of convolutional_layer_tb is
  for test
  end for;
end convolutional_layer_tb_test_cfg;

-------------------------------------------------------------------------------
