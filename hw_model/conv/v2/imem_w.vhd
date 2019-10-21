library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;
  
entity imem_w is
  port(
    ck            : in  std_logic;
    rst           : in  std_logic; 
    test          : in  std_logic;
    i_data_even   : in  mem_data_t;
    i_data_odd    : in  mem_data_t;
    cs_all        : in  std_logic;
    rd            : in  std_logic_vector(0 to W-1);
    wr            : in  std_logic_vector(0 to W-1);
    even_rd_addr  : in  unsigned(clog2m-1 downto 0);
    even_wr_addr  : in  unsigned(clog2m-1 downto 0);
    odd_rd_addr   : in  unsigned(clog2m-1 downto 0);
    odd_wr_addr   : in  unsigned(clog2m-1 downto 0);
    even_odd_n    : in  std_logic;
    rf_ptr        : in  unsigned(clog2W-1 downto 0);
    px_ptr        : in  unsigned(clog2K-1 downto 0);
    o_data_conv_v : out signed(N*W-1 downto 0);
    o_data_conv_h : out signed(N*W-1 downto 0);
    o_data_pool   : out mem_data_t;
    o_data_fc     : out signed(N-1 downto 0)
    );
end entity;

architecture rtl of imem_w is

  component imem
    port(
      ck           : in  std_logic;
      rst          : in  std_logic; 
      test         : in  std_logic;
      i_data_even  : in  mem_data_t;
      i_data_odd   : in  mem_data_t;
      cs           : in  std_logic_vector(0 to W-1);
      rd           : in  std_logic_vector(0 to W-1);
      wr           : in  std_logic_vector(0 to W-1);
      even_rd_addr : in  unsigned(clog2m-1 downto 0);
      even_wr_addr : in  unsigned(clog2m-1 downto 0);
      odd_rd_addr  : in  unsigned(clog2m-1 downto 0);
      odd_wr_addr  : in  unsigned(clog2m-1 downto 0);
      o_data_even  : out mem_data_t;
      o_data_odd   : out mem_data_t
      );
  end component;

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

  signal int_data_even : mem_data_t;
  signal int_data_odd  : mem_data_t;

  signal int_data_mem1 : mem_data_t;
  signal int_data_mem2 : mem_data_t;

  signal int_cs : std_logic_vector(0 to W-1);
  signal int_en : std_logic_vector(0 to W-1);

  signal int_px_ptr : unsigned(px_ptr'high downto 0);

--signal addr_conv_v : unsigned(clog2W downto 0);
--signal addr_conv_h : unsigned(clog2K+clog2W downto 0);
--signal addr_pool : unsigned(clog2K+clog2W downto 0);
--signal addr_fc        : unsigned(clog2K+clog2W downto 0);

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

begin

  cs_dec:
  process(rf_ptr, rst)
  begin
    if rst = '1' then
      int_cs <= (others => '0');
    else
      case(to_integer(rf_ptr)) is
        when 1 => int_cs <= "0100";
      when 2      => int_cs <= "0010";
      when 3      => int_cs <= "0001";
      when others => int_cs <= "1000";
    end case;
  end if;
end process;

latch_en:
  for i in 0 to int_cs'high generate
    int_en(i) <= cs_all or int_cs(i);
  end generate;

  imem_inst :
    imem port map (
      ck           => ck,
      rst          => rst, 
      test         => test,
      i_data_even  => i_data_even,
      i_data_odd   => i_data_odd,
      cs           => int_en,
      rd           => rd,
      wr           => wr,
      even_rd_addr => even_rd_addr,
      even_wr_addr => even_wr_addr,
      odd_rd_addr  => odd_rd_addr,
      odd_wr_addr  => odd_wr_addr,
      o_data_even  => int_data_even,
      o_data_odd   => int_data_odd
      );

  imem_if_mem1:
    imem_bank_if port map (
      i_data_even => int_data_even,
      i_data_odd  => int_data_odd,
      even_odd_n  => even_odd_n,
      o_data      => int_data_mem1
      );

  imem_if_mem2:
    imem_bank_if port map (
      i_data_even => int_data_odd,
      i_data_odd  => int_data_even,
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
