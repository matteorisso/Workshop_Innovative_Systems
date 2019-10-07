-- Adder with generic parallelism.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity generic_adder is
	
	generic(n : integer := 8);
	
	port(
		a			:	in 	std_logic_vector((n-1) downto 0);
		b 			:	in 	std_logic_vector((n-1) downto 0);
		res			: 	out std_logic_vector((n-1) downto 0)
		);
		
end generic_adder;

architecture behavior of generic_adder is
begin

	add_process	:	process(a, b)
	begin
		
		res  <= std_logic_vector(unsigned(a)+unsigned(b)); 	
	
	end process;

end architecture behavior; 
