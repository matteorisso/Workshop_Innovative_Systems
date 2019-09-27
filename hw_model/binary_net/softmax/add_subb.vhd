-- adder/subtractor

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity add_subb is

	port(
		a			:	in 	std_logic_vector(7 downto 0);
		b 			:	in 	std_logic_vector(7 downto 0);
		addh_subl	:	in	std_logic;
		res			: 	out std_logic_vector(7 downto 0)
		);
		
end add_subb;

architecture behavior of add_subb is
begin

	add_sub_process	:	process(a, b, addh_subl)
	begin
		if addh_subl = '1' then
			res  <= std_logic_vector(unsigned(a)+unsigned(b)); 	
		else
			res  <= std_logic_vector(unsigned(a)-unsigned(b)); 
		end if;
	end process;

end architecture behavior; 
