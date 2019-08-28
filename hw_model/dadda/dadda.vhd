library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.dadda_func.all;

entity dadda is
	port(
		a	:	in	signed(7 downto 0);
		b	:	in	signed(7 downto 0);
		o	:	out	and_matrix;
		xor_msb	:	out	std_logic;
		and_msb	:	out	std_logic
	);
end dadda;

architecture structure of dadda is

begin
	o <= and_8b(a, b);
	xor_msb <= a(7) xor b(7);
	and_msb <= a(7) and b(7);
end structure;
