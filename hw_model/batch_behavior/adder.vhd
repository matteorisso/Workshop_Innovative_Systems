library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	
	use work.param.all;

entity adder is
	
	generic(n : integer := 2*(N+G));
	port(
		a	:	in 	std_logic_vector(n downto 0);
		b 	:	in 	std_logic_vector(n downto 0);
		res	: 	out std_logic_vector(n downto 0)
		);
		
end entity;

architecture behavior of adder is
begin

	res  <= std_logic_vector(signed(a)+signed(b)); 	

end architecture behavior; 
