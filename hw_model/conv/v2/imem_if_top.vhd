library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity imem_if_top is
  port(
    even_odd_n    : in  std_logic;
    rf_ptr        : in  unsigned(clog2W-1 downto 0);
    px_ptr        : in  unsigned(clog2K-1 downto 0);
    i_data_even   : in  mem_data_t;
    i_data_odd    : in  mem_data_t;
    o_data_conv_v : out signed(N*W-1 downto 0);
    o_data_conv_h : out signed(N*W-1 downto 0);
    o_data_fc     : out signed(N-1 downto 0);
    o_data_pool   : out mem_data_t
    );
end entity;

architecture rtl of imem_if_top is

  -- ADDR.POOL
-- |---------------------------| 
--  even_odd_n & tile_v_ptr & rf_ptr
--  ---------------------------
-- ADDR.CONV V
-- |---------------------------| 
--  rf_ptr & tile_v_ptr & even_odd_n
--  ---------------------------
-- ADDR.CONV H
-- |---------------------------| 
--  px_ptr & tile_v_ptr & even_odd_n
--  ---------------------------
-- ADDR.FC
-- |---------------------------| 
--  px_ptr & tile_v_ptr & rf_ptr & even_odd_n
--  ---------------------------

  component imem_if
    port(
      i_data_v      : in  mem_data_t;
      i_data_h      : in  mem_data_t;
      rf_ptr        : in  unsigned(clog2W-1 downto 0);
      px_ptr        : in  unsigned(clog2K-1 downto 0);
      o_data_conv_v : out signed(N*W-1 downto 0);
      o_data_conv_h : out signed(N*W-1 downto 0);
      o_data_fc     : out signed(N-1 downto 0)
      );
  end component;

  component imem_bank_if
    port(
      i_data_even : in  mem_data_t;
      i_data_odd  : in  mem_data_t;
      even_odd_n  : in  std_logic;
      o_data      : out mem_data_t
      );
  end component;

  signal int_data_mem1 : mem_data_t;
  signal int_data_mem2 : mem_data_t;

  signal int_px_ptr : unsigned(px_ptr'high downto 0);

begin
  
  imem_if_mem1:
    imem_bank_if port map (
      i_data_even => i_data_even,
      i_data_odd  => i_data_odd,
      even_odd_n  => even_odd_n,
      o_data      => int_data_mem1
      );

  imem_if_mem2:
    imem_bank_if port map (
      i_data_even => i_data_odd,
      i_data_odd  => i_data_even,
      even_odd_n  => even_odd_n,
      o_data      => int_data_mem2
      );

  imem_if_inst:
    imem_if port map (
      i_data_v      => int_data_mem1,
      i_data_h      => int_data_mem2,
      rf_ptr        => rf_ptr,
      px_ptr        => int_px_ptr,
      o_data_conv_v => o_data_conv_v,
      o_data_conv_h => o_data_conv_h,
      o_data_fc     => o_data_fc
      );

  int_px_ptr  <= '0'&px_ptr(px_ptr'high-1 downto 0);
  o_data_pool <= int_data_mem1;

end architecture;
