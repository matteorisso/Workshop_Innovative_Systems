library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;               --// boolean reduction function
use work.globals.all;

entity round is
  generic (
    i_N : natural := 8;
    o_N : natural := 2);
  port (
    i_data : in  std_logic_vector(i_N-1 downto 0);
    o_data : out std_logic_vector(o_N-1 downto 0)
    );
end entity;

architecture beh of round is
  constant LSB : natural := (i_N - o_N);
begin
  process (i_data)
  begin
    if i_data(LSB-1) = '1' then                        --// =.5
      if OR_REDUCE(i_data(LSB-2 downto 0)) = '1' then  --// >.5
        o_data <= std_logic_vector(unsigned(i_data(i_data'high downto LSB)) + 1);
      else                                             --// tie-breaker
        if i_data(LSB) = '1' then                      --// is odd
          o_data <= std_logic_vector(unsigned(i_data(i_data'high downto LSB)) + 1);
        else
          o_data <= i_data(i_data'high downto LSB);    --// floor
        end if;
      end if;
    else                                               --// <.5
      o_data <= i_data(i_data'high downto LSB);        --// floor
    end if;
  end process;
  
end architecture;
