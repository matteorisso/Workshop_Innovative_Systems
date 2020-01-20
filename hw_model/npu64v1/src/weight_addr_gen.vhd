library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.globals.all;

entity weight_addr_gen is
  port(
    ck       : in  std_logic;
    rst      : in  std_logic;
    sync_clr : in  std_logic;
    en       : in  std_logic;
    inc      : in  std_logic;
    o_addr   : out unsigned(31 downto 0)
    );
end entity;

architecture beh of weight_addr_gen is

  signal int_o_addr    : unsigned(31 downto 0);
  signal int_offs_addr : unsigned(31 downto 0);
  signal int_base_addr : unsigned(31 downto 0);
  
begin
  
  o_addr     <= int_o_addr;
  int_o_addr <= int_base_addr + int_offs_addr;

  --// base address
  process(ck, rst)
  begin
    if rst = '1' then
      int_base_addr <= (others => '0');
    elsif rising_edge(ck) then
      if inc = '1' then
        int_base_addr <= int_o_addr;
      end if;
    end if;
  end process;

  --// cnt + 1 : offset in base
  process(ck, rst)
  begin
    if rst = '1' then
      int_offs_addr <= (others => '0');
    elsif rising_edge(ck) then
      if sync_clr = '1' then
        int_offs_addr <= (others => '0');
      elsif en = '1' then
        int_offs_addr <= int_offs_addr + 1;
      end if;
    end if;
  end process;

end architecture;
