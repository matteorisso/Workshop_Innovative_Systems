-- 6 bit subtractor.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity subtractor is

	port(
		a 		: in 	std_logic_vector(5 downto 0);
		b		: in 	std_logic_vector(5 downto 0);
		d_out 	: out 	std_logic_vector(5 downto 0)
	);
	
end subtractor;

architecture structure of subtractor is

begin
	
	sub_process	:	process(a, b)
	begin
		
		d_out  <= std_logic_vector(unsigned(b)-unsigned(a)); 
		
	end process;
	
end structure;