-- 1D convolutional unit realized with 5 xnor logic gates.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity cu_1d is

	port(
		d_in 	: in 	std_logic_vector(4 downto 0);
		weights	: in 	std_logic_vector(4 downto 0);
		d_out 	: out 	std_logic_vector(4 downto 0)
	);
	
end cu_1d;

architecture structure of cu_1d is

begin
	
	d_out(0) <=	d_in(0)	and weights(0);
	d_out(1) <=	d_in(1)	and weights(1);
	d_out(2) <=	d_in(2)	and weights(2);
	d_out(3) <=	d_in(3)	and weights(3);
	d_out(4) <=	d_in(4)	and weights(4);
	
end structure;