 -- Pooling elementary unit.
 -- The pooling operation is realized with
 -- a simple boolean function :
 -- pool = yzw + xy(notz)w + x(noty)zw + xyz(notw).

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity pe_pooling is

	port(
		x		:	in	std_logic;
		y		:	in	std_logic;
		z		:	in	std_logic;
		w		:	in	std_logic;
		d_out	:	out	std_logic
	);
	
end pe_pooling;

architecture structure of pe_pooling is

begin
	
	d_out	<=	(y and z and w) or (x and y and (not z) and w) or (x and (not y) and z and w) or (x and y and z and (not w));
	
end structure;