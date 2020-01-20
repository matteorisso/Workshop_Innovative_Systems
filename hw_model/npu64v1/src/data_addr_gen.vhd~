library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity data_addr_gen is
  port(
    ck             : in  std_logic;
    rst            : in  std_logic;
    sync_clr       : in  std_logic;
    en             : in  std_logic;
    inc_even       : in  std_logic;
    inc_odd        : in  std_logic;
    data_even_addr : out unsigned(CLOG2M+CLOG2W-1 downto 0);
    data_odd_addr  : out unsigned(CLOG2M+CLOG2W-1 downto 0)
    );
end entity;

architecture beh of data_addr_gen is

  signal int_data_offs_addr      : unsigned(CLOG2M+CLOG2W-1 downto 0);
  signal int_data_odd_base_addr  : unsigned(CLOG2M+CLOG2W-1 downto 0);
  signal int_data_even_base_addr : unsigned(CLOG2M+CLOG2W-1 downto 0);
  
begin
  
  data_even_addr <= int_data_even_base_addr + int_data_offs_addr;
  data_odd_addr  <= int_data_odd_base_addr + int_data_offs_addr;


  --// base for even memory loc
  process(ck, rst)
  begin
    if rst = '1' then
      int_data_even_base_addr <= (others => '0');
    elsif rising_edge(ck) then
      if sync_clr = '1' then
        int_data_even_base_addr <= (others => '0');
      elsif en = '1' then
        if inc_even = '1' then
          int_data_even_base_addr <= int_data_offs_addr + 1;
        end if;
      end if;
    end if;
  end process;

  --// base for odd memory loc
  process(ck, rst)
  begin
    if rst = '1' then
      int_data_odd_base_addr <= (others => '0');
    elsif rising_edge(ck) then
      if sync_clr = '1' then
        int_data_odd_base_addr <= (others => '0');
      elsif en = '1' then
        if inc_odd = '1' then
          int_data_odd_base_addr <= int_data_offs_addr + 1;
        end if;
      end if;
    end if;
  end process;

  -- cnt + 1 (offset in base)
  process(ck, rst)
  begin
    if rst = '1' then
      int_data_offs_addr <= (others => '0');
    elsif rising_edge(ck) then
      if en = '1' then
        if (inc_odd or inc_even) = '1' then
          int_data_offs_addr <= (others => '0');
        else
          int_data_offs_addr <= int_data_offs_addr + 1;
        end if;
      end if;
    end if;
  end process;

end architecture;
