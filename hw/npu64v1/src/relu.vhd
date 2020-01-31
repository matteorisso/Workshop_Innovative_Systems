library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;            -- OR_REDUCE
use ieee.numeric_std.all;
use work.globals.all;

entity relu is
  port (
    i_data : in  signed(N+BG-1 downto 0);
    o_data : out unsigned(N-1 downto 0)
    );
end entity;

architecture quantized_act_df of relu is
  signal sat : std_logic;
begin
  sat    <= OR_REDUCE(std_logic_vector(i_data(i_data'high-1 downto N)));
  o_data <= unsigned(i_data(N-1 downto 0)) when (sat = '0' and i_data(i_data'high) = '0') else
            (others => '1') when (sat = '1' and i_data(i_data'high) = '0') else
            (others => '0');
  
end architecture;
