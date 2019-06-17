library ieee;
use ieee.std_logic_1164.all;
use work.fixed_pkg.all;

entity multiplier is

	generic(
			qi : natural := 8;
			qf : natural := 8
			);
	port(
		a 	: in 	sfixed(qi-1 downto -qf);
		b 	: in 	sfixed(qi-1 downto -qf);
		res	: out 	sfixed(2*qi-1 downto -2*qf)
		);
		
end entity;

architecture behavior of multiplier is

begin

	res <= a*b; 	

end architecture behavior; 

