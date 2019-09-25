library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
	port(
		a	:	in	std_logic;
		b	:	in	std_logic;
		cin	:	in	std_logic;
		s	:	out	std_logic;
		c	:	out std_logic
	);
end full_adder;

architecture structure of full_adder is
	
	component half_adder is 
		port(
		a	:	in	std_logic;
		b	:	in	std_logic;
		s	:	out	std_logic;
		c	:	out std_logic
		);
	end component;

	signal	psum	: std_logic;
	signal	pc1		: std_logic;
	signal	pc2		: std_logic;
	
	
begin
	
	ha1 : half_adder
		port map(
			a	=>	a,
			b	=>	b,	
			s	=>	psum,	
			c	=>	pc1	
		);
		
	ha2 : half_adder
		port map(
			a	=>	cin,
			b	=>	psum,	
			s	=>	s,	
			c	=>	pc2	
		);
		
	c <= pc1 or pc2;
	
end structure;