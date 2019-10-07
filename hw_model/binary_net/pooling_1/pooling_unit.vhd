-- Pooling unit, it is realized with seven PEs
-- of type pe_pooling.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity pooling_unit is

	port(
		x 		: in 	std_logic_vector(6 downto 0);
		y		: in 	std_logic_vector(6 downto 0);
		z 		: in 	std_logic_vector(6 downto 0);
		w		: in 	std_logic_vector(6 downto 0);
		d_out 	: out 	std_logic_vector(6 downto 0)
	);
	
end pooling_unit;

architecture structure of pooling_unit is
	
	component pe_pooling is
		port(
			x		:	in	std_logic;
			y		:	in	std_logic;
			z		:	in	std_logic;
			w		:	in	std_logic;
			d_out	:	out	std_logic
		);
	end component;
	
begin

	pe_0	:	pe_pooling	port map(
								x		=>	x(6),
								y		=>	y(6),
								z		=>	z(6),
								w		=>	w(6),
								d_out	=>	d_out(6)
							);
	
	pe_1	:	pe_pooling	port map(
								x		=>	x(5),
								y		=>	y(5),
								z		=>	z(5),
								w		=>	w(5),
								d_out	=>	d_out(5)
							);
							
	pe_2	:	pe_pooling	port map(
								x		=>	x(4),
								y		=>	y(4),
								z		=>	z(4),
								w		=>	w(4),
								d_out	=>	d_out(4)
							);						
							
	pe_3	:	pe_pooling	port map(
								x		=>	x(3),
								y		=>	y(3),
								z		=>	z(3),
								w		=>	w(3),
								d_out	=>	d_out(3)
							);						
							
	pe_4	:	pe_pooling	port map(
								x		=>	x(2),
								y		=>	y(2),
								z		=>	z(2),
								w		=>	w(2),
								d_out	=>	d_out(2)
							);						
							
	pe_5	:	pe_pooling	port map(
								x		=>	x(1),
								y		=>	y(1),
								z		=>	z(1),
								w		=>	w(1),
								d_out	=>	d_out(1)
							);						
							
	pe_6	:	pe_pooling	port map(
								x		=>	x(0),
								y		=>	y(0),
								z		=>	z(0),
								w		=>	w(0),
								d_out	=>	d_out(0)
							);						
	
end structure;