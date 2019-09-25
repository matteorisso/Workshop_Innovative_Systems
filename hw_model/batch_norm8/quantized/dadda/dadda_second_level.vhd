library ieee;
use ieee.std_logic_1164.all;

use work.dadda_func.all;

entity dadda_second_level is
	port(
		i		:	in	and_matrix;
		i_f		:	in	first_level;
		xor_msb	:	in	std_logic;
		and_msb	:	in	std_logic;
		o		:	out	second_level
	);
end dadda_second_level;

architecture structure of dadda_second_level is
	
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
			a	=>	i(4)(0),
			b	=>	i(3)(1),	
			s	=>	o(0)(0),	
			c	=>	o(0)(1)	
		);
	
	fa_1 : full_adder
		port map(
			a	=>	i(5)(0),
			b	=>	i(4)(1),
			cin	=>	i(3)(2),			
			s	=>	o(1)(0),	
			c	=>	o(1)(1)	
		);
	
	ha_2 : half_adder
		port map(
			a	=>	i(2)(3),
			b	=>	i(1)(4),		
			s	=>	o(2)(0),	
			c	=>	o(2)(1)	
		);
	
	fa_2 : full_adder
		port map(
			a	=>	i(4)(2),
			b	=>	i(3)(3),
			cin	=>	i(2)(4),			
			s	=>	o(3)(0),	
			c	=>	o(3)(1)	
		);
	
	fa_3 : full_adder
		port map(
			a	=>	i_f(0)(0),
			b	=>	i(1)(5),
			cin	=>	i(0)(6),			
			s	=>	o(4)(0),	
			c	=>	o(4)(1)	
		);
	
	fa_4 : full_adder
		port map(
			a	=>	i_f(0)(1),
			b	=>	i_f(1)(0),
			cin	=>	i_f(2)(0),			
			s	=>	o(5)(0),	
			c	=>	o(5)(1)	
		);
		
	fa_5 : full_adder
		port map(
			a	=>	i(1)(6),
			b	=>	i(0)(7),
			cin	=>	xor_msb,			
			s	=>	o(6)(0),	
			c	=>	o(6)(1)	
		);
	
	fa_6 : full_adder
		port map(
			a	=>	i_f(2)(1),
			b	=>	i_f(3)(0),
			cin	=>	i_f(4)(0),			
			s	=>	o(7)(0),	
			c	=>	o(7)(1)	
		);
	
	fa_7 : full_adder
		port map(
			a	=>	i_f(1)(1),
			b	=>	i(1)(7),
			cin	=>	and_msb,			
			s	=>	o(8)(0),	
			c	=>	o(8)(1)	
		);
		
	fa_8 : full_adder
		port map(
			a	=>	i_f(3)(1),
			b	=>	i_f(4)(1),
			cin	=>	i_f(5)(0),			
			s	=>	o(9)(0),	
			c	=>	o(9)(1)	
		);
	
	fa_9 : full_adder
		port map(
			a	=>	i(4)(5),
			b	=>	i(3)(6),
			cin	=>	i(2)(7),			
			s	=>	o(10)(0),	
			c	=>	o(10)(1)	
		);
	
	fa_10 : full_adder
		port map(
			a	=>	i(7)(3),
			b	=>	i(6)(4),
			cin	=>	i(5)(5),			
			s	=>	o(11)(0),	
			c	=>	o(11)(1)	
		);
	
	fa_11 : full_adder
		port map(
			a	=>	i_f(5)(1),
			b	=>	i(4)(6),
			cin	=>	i(3)(7),			
			s	=>	o(12)(0),	
			c	=>	o(12)(1)	
		);
	
	fa_12 : full_adder
		port map(
			a	=>	i(5)(6),
			b	=>	i(6)(5),
			cin	=>	i(7)(4),			
			s	=>	o(13)(0),	
			c	=>	o(13)(1)	
		);

		
end structure;