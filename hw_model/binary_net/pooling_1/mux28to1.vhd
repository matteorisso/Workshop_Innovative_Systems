-- Mux 28-to-1.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity mux28to1 is

	port(
		sel 	: in 	std_logic_vector(4	downto	0);
		d_in 	: in 	std_logic_vector(27 downto 	0);
		d_out	: out 	std_logic
	);

end mux28to1;

architecture behavior of mux28to1 is

begin
	
	d_out <= d_in(to_integer(unsigned(sel)));
	
end behavior;