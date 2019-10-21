library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	
	use work.param.all;

entity multiplier is
	
	generic(n : integer := (N+G));
	port(
		a	:	in 	std_logic_vector((n-1) downto 0);
		b 	:	in 	std_logic_vector((n-1) downto 0);
		res	: 	out std_logic_vector((2*n-1) downto 0)
		);
		
end entity;

architecture behavior of multiplier is
begin

	res  <= std_logic_vector(signed(a)*signed(b)); 	

end architecture behavior; 
