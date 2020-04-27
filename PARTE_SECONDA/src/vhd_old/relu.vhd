library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;            -- OR_REDUCE
use ieee.numeric_std.all;
use work.globals.all;

entity relu is
  generic (
    i_N : natural := N+BG;
    o_N : natural := N);
  port (
    i_data : in  signed(i_N-1 downto 0);
    o_data : out unsigned(o_N-1 downto 0)
    );
end entity;

architecture sat of relu is
  signal sat : std_logic;
begin
  sat    <= OR_REDUCE(std_logic_vector(i_data(i_N-1 downto o_N)));
  o_data <= unsigned(i_data(o_N-1 downto 0)) when (sat = '0' and i_data(i_data'high) = '0') else  --// truncated
            (others => '1') when (sat = '1' and i_data(i_data'high) = '0') else  --// sat
            (others => '0');            --// < 0        
end architecture;
