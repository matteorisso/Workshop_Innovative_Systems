library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.globals.all;

--// sll 2 for avg pooling
--// 2b round-to-nearest-even

entity quantize_p is
  port (
    ck     : in  std_logic;
    rst    : in  std_logic;
    en     : in  std_logic;
    i_data : in  unsigned(3 downto 0);
    o_data : out unsigned(1 downto 0)
    );
end entity;

architecture beh of quantize_p is

  signal int_trunc  : unsigned(1 downto 0);
  signal int_o_data : unsigned(1 downto 0);
begin

  int_trunc <= i_data(3 downto 2);
  o_data    <= int_o_data when i_data(1) = '1' else int_trunc;

  --process(ck, rst)
  --begin
  --  if rst = '1' then
  --    o_data <= (others => '0');
  --  elsif rising_edge(ck) then
  --    if en = '1' then
  --      if i_data(1) = '1' then         --// R : search tie-break
  --        o_data <= int_o_data;
  --      else
  --        o_data <= int_trunc;          --// floor
  --      end if;
  --    end if;
  --  end if;
  --end process;

  process(int_trunc, i_data)
  begin
    if i_data(0) = '1' then             --// > 0.5 lsb            
      int_o_data <= int_trunc + 1;
    else
      if int_trunc(0) = '1' then        --// odd
        int_o_data <= int_trunc + 1;
      else                              --// even; then floor
        int_o_data <= int_trunc;
      end if;
    end if;
  end process;

end architecture;


