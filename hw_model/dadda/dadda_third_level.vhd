library ieee;
use ieee.std_logic_1164.all;

use work.dadda_func.all;

entity dadda_third_level is
	port(
		i		:	in	and_matrix;
		i_f		:	in	first_level;
		i_s		:	in	second_level;
		o		:	out	third_level
	);
end dadda_third_level;

architecture structure of dadda_third_level is
	
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
			a	=>	i(3)(0),
			b	=>	i(2)(1),	
			s	=>	o(0)(0),	
			c	=>	o(0)(1)	
		);
	
	fa_1 : full_adder
		port map(
			a	=>	i(0)(5),
			b	=>	i_s(0)(1),
			cin	=>	i_s(1)(0),			
			s	=>	o(1)(0),	
			c	=>	o(1)(1)	
		);
	
	fa_2 : full_adder
		port map(
			a	=>	i(2)(2),
			b	=>	i(1)(3),
			cin	=>	i(0)(4),			
			s	=>	o(2)(0),	
			c	=>	o(2)(1)	
		);
	
	fa_3 : full_adder
		port map(
			a	=>	i_s(1)(1),
			b	=>	i_s(2)(1),
			cin	=>	i_s(3)(0),			
			s	=>	o(3)(0),	
			c	=>	o(3)(1)	
		);
	
	fa_4 : full_adder
		port map(
			a	=>	i_s(3)(1),
			b	=>	i_s(4)(1),
			cin	=>	i_s(6)(0),			
			s	=>	o(4)(0),	
			c	=>	o(4)(1)	
		);
		
	fa_5 : full_adder
		port map(
			a	=>	i_s(5)(1),
			b	=>	i_s(6)(1),
			cin	=>	i_s(8)(0),			
			s	=>	o(5)(0),	
			c	=>	o(5)(1)	
		);
	
	fa_6 : full_adder
		port map(
			a	=>	i_s(7)(1),
			b	=>	i_s(8)(1),
			cin	=>	i_s(10)(0),			
			s	=>	o(6)(0),	
			c	=>	o(6)(1)	
		);
	
	fa_7 : full_adder
		port map(
			a	=>	i_s(9)(1),
			b	=>	i_s(10)(1),
			cin	=>	i_s(11)(0),			
			s	=>	o(7)(0),	
			c	=>	o(7)(1)	
		);
		
	fa_8 : full_adder
		port map(
			a	=>	i_s(11)(1),
			b	=>	i(4)(7),
			cin	=>	i_s(12)(1),			
			s	=>	o(8)(0),	
			c	=>	o(8)(1)	
		);
	
	fa_9 : full_adder
		port map(
			a	=>	i(7)(5),
			b	=>	i(6)(6),
			cin	=>	i(5)(7),			
			s	=>	o(9)(0),	
			c	=>	o(9)(1)	
		);

		
end structure;