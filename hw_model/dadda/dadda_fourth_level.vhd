library ieee;
use ieee.std_logic_1164.all;

use work.dadda_func.all;

entity dadda_fourth_level is
	port(
		i		:	in	and_matrix;
		i_s		:	in	second_level;
		i_t		:	in 	third_level;
		o		:	out	fourth_level
	);
end dadda_fourth_level;

architecture structure of dadda_fourth_level is
	
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
			a	=>	i(2)(0),
			b	=>	i(1)(1),	
			s	=>	o(0)(0),	
			c	=>	o(0)(1)	
		);
	
	fa_1 : full_adder
		port map(
			a	=>	i_t(0)(0),
			b	=>	i(1)(2),
			cin	=>	i(0)(3),			
			s	=>	o(1)(0),	
			c	=>	o(1)(1)	
		);
	
	fa_2 : full_adder
		port map(
			a	=>	i_t(0)(1),
			b	=>	i_s(0)(0),
			cin	=>	i_t(2)(0),			
			s	=>	o(2)(0),	
			c	=>	o(2)(1)	
		);
	
	fa_3 : full_adder
		port map(
			a	=>	i_t(1)(0),
			b	=>	i_t(2)(1),
			cin	=>	i_s(2)(0),			
			s	=>	o(3)(0),	
			c	=>	o(3)(1)	
		);
	
	fa_4 : full_adder
		port map(
			a	=>	i_t(1)(1),
			b	=>	i_t(3)(0),
			cin	=>	i_s(4)(0),			
			s	=>	o(4)(0),	
			c	=>	o(4)(1)	
		);
	
	fa_5 : full_adder
		port map(
			a	=>	i_t(3)(1),
			b	=>	i_s(5)(0),
			cin	=>	i_t(4)(0),			
			s	=>	o(5)(0),	
			c	=>	o(5)(1)	
		);
	
	fa_6 : full_adder
		port map(
			a	=>	i_t(4)(1),
			b	=>	i_s(7)(0),
			cin	=>	i_t(5)(0),			
			s	=>	o(6)(0),	
			c	=>	o(6)(1)	
		);
		
	fa_7 : full_adder
		port map(
			a	=>	i_t(5)(1),
			b	=>	i_s(9)(0),
			cin	=>	i_t(6)(0),			
			s	=>	o(7)(0),	
			c	=>	o(7)(1)	
		);
	
	fa_8 : full_adder
		port map(
			a	=>	i_t(9)(1),
			b	=>	i(6)(7),
			cin	=>	i(7)(6),			
			s	=>	o(8)(0),	
			c	=>	o(8)(1)	
		);
	
	fa_9 : full_adder
		port map(
			a	=>	i_t(6)(1),
			b	=>	i_t(7)(0),
			cin	=>	i_s(12)(0),			
			s	=>	o(9)(0),	
			c	=>	o(9)(1)	
		);
	
	fa_10 : full_adder
		port map(
			a	=>	i_t(8)(0),
			b	=>	i_t(7)(1),
			cin	=>	i_s(13)(0),			
			s	=>	o(10)(0),	
			c	=>	o(10)(1)	
		);
	
	fa_11 : full_adder
		port map(
			a	=>	i_t(8)(1),
			b	=>	i_t(9)(0),
			cin	=>	i_s(13)(1),			
			s	=>	o(11)(0),	
			c	=>	o(11)(1)	
		);
	
	
	
		
end structure;