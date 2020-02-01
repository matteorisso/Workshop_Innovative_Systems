library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.globals.all;

entity addr_gen is
  generic (N : natural := 16);
  port(
    ck             : in  std_logic;
    rst            : in  std_logic;
    sync_clr       : in  std_logic;
    en_offs        : in  std_logic;
    en_base        : in  std_logic;
    mux_base_addr  : in  std_logic;
    clr_offs       : in  std_logic;
    inc_value_base : in  unsigned(N-1 downto 0);
    inc_value_offs : in  unsigned(N-1 downto 0);
    addr           : out unsigned(N-1 downto 0)
    );
end entity;


architecture beh of addr_gen is
  
  signal int_offs_addr : unsigned(N-1 downto 0);
  signal int_base_addr : unsigned(N-1 downto 0);
  signal int_addr      : unsigned(N-1 downto 0);

begin
  addr     <= int_addr;
  int_addr <= int_base_addr + int_offs_addr;

  --// base addr
  process(ck, rst)
  begin
    if rst = '1' then
      int_base_addr <= (others => '0');
    elsif rising_edge(ck) then
      if sync_clr = '1' then
        int_base_addr <= (others => '0');
      elsif en_base = '1' then
        if mux_base_addr = '1' then
          int_base_addr <= int_addr + inc_value_base;
        else
          int_base_addr <= int_base_addr + inc_value_base;  
        end if;
      end if;
    end if;
  end process;

  --// cnt + 1 (offset in base)
  process(ck, rst)
  begin
    if rst = '1' then
      int_offs_addr <= (others => '0');
    elsif rising_edge(ck) then
      if clr_offs = '1' then
        int_offs_addr <= (others => '0');
      elsif en_offs = '1' then
        int_offs_addr <= int_offs_addr + inc_value_offs;
      end if;
    end if;
  end process;

end architecture;
