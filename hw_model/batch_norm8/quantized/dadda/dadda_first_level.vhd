library ieee;
use ieee.std_logic_1164.all;

use work.dadda_func.all;

entity dadda_first_level is
	port(
		i		:	in	and_matrix;
		o		:	out	first_level
	);
end dadda_first_level;

architecture structure of dadda_first_level is
	
	component half_adder is 
		port(
		a	:	in	std_logic;
		b	:	in	std_logic;
		s	:	out	std_logic;
		c	:	out std_logic
		);
	end component;
	
	component full_adder is 
		port(
		a	:	in	std_logic;
		b	:	in	std_logic;
		cin	:	in	std_logic;
		s	:	out	std_logic;
		c	:	out std_logic
		);
	end component;
	
	
begin

	ha_1 : half_adder
		port map(
			a	=>	i(6)(0),
			b	=>	i(5)(1),	
			s	=>	o(0)(0),	
			c	=>	o(0)(1)	
		);
	
	fa_1 : full_adder
		port map(
			a	=>	i(7)(0),
			b	=>	i(6)(1),
			cin	=>	i(5)(2),			
			s	=>	o(1)(0),	
			c	=>	o(1)(1)	
		);
	
	fa_2 : full_adder
		port map(
			a	=>	i(4)(3),
			b	=>	i(3)(4),
			cin	=>	i(2)(5),			
			s	=>	o(2)(0),	
			c	=>	o(2)(1)	
		);
	
	fa_3 : full_adder
		port map(
			a	=>	i(7)(1),
			b	=>	i(6)(2),
			cin	=>	i(5)(3),			
			s	=>	o(3)(0),	
			c	=>	o(3)(1)	
		);
	
	fa_4 : full_adder
		port map(
			a	=>	i(4)(4),
			b	=>	i(3)(5),
			cin	=>	i(2)(6),			
			s	=>	o(4)(0),	
			c	=>	o(4)(1)	
		);
	
	fa_5 : full_adder
		port map(
			a	=>	i(7)(2),
			b	=>	i(6)(3),
			cin	=>	i(5)(4),			
			s	=>	o(5)(0),	
			c	=>	o(5)(1)	
		);
	
end structure;