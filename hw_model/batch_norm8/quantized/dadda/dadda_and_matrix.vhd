library ieee;
use ieee.std_logic_1164.all;

use work.dadda_func.all;

entity dadda_and_matrix is
	port(
		a		:	in	std_logic_vector(7 downto 0);
		b		:	in	std_logic_vector(7 downto 0);
		o		:	out	and_matrix;
		xor_msb	:	out	std_logic;
		and_msb	:	out	std_logic
	);
end dadda_and_matrix;

architecture structure of dadda_and_matrix is

begin
	o 		<= and_8b(a, b);
	xor_msb <= a(7) xor b(7);
	and_msb <= a(7) and b(7);
end structure;
