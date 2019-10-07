library ieee;
use ieee.std_logic_1164.all;

use work.wallace_func.all;

entity wallace_and_matrix is
	port(
		a		:	in	std_logic_vector(12 downto 0);
		b		:	in	std_logic_vector(12 downto 0);
		o		:	out	and_matrix;
		xor_msb	:	out	std_logic;
		and_msb	:	out	std_logic
	);
end wallace_and_matrix;

architecture structure of wallace_and_matrix is

begin
	o 		<= and_13b(a, b);
	xor_msb <= a(12) xor b(12);
	and_msb <= a(12) and b(12);
end structure;
