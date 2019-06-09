library ieee;
use ieee.std_logic_1164.all;
use work.fixed_pkg.all;

entity binary_adder_tree is
generic ( qi : natural := 8; qf : natural := 8);
port(
		ck, rstn	: in std_logic;
		a, b, c, d, e 
					: in  sfixed(qi-1 downto -qf);
		result	: out sfixed(qi-1 downto -qf));
end entity;

architecture structure of binary_adder_tree is

signal sum1 : sfixed( qi downto -qf ) ;
signal sum2 : sfixed( qi downto -qf ) ;
signal sum3 : sfixed( qi+1 downto -qf ) ;
signal sum4 : sfixed( qi+2 downto -qf ) ;

begin
	
process (ck)
begin
pipeline:
	if (rising_edge(ck)) then
		if rstn = '0' then

			sum1 <= (others =>'0');
			sum2 <= (others =>'0');
			sum3 <= (others =>'0');
			sum4 <= (others =>'0');
		else
		
			sum1 <= a + b;
			sum2 <= c + d;
			sum3 <= sum1 + sum2;
			sum4 <= sum3 + e;
		end if;
	end if;
end process;

result <= sum4(qi-1 downto -qf);
	
end architecture structure;