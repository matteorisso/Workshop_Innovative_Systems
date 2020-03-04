library ieee;
use ieee.std_logic_1164.all;

entity FF is 
      port (D, clock, reset  : in std_logic;
            Q                : out std_logic);
end FF;

architecture comportamento of FF is
begin 
process (clock, reset)
      begin
          if (reset = '0') then
              Q<= '0';
          elsif (clock'event and clock = '1') then
              Q<=D;
        end if;
      end process;
end comportamento;
            