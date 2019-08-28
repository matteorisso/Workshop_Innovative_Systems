--
-- Multiplier that perform multiplication between a certain input and -1 or +1, for -1 operation it
-- uses ca1 representation of data, the error introduced is compensated adding the total number of -1 
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity binary_mult is

	generic(
		n	:	integer	:=	4
		);
	port(
		act 	:	in	signed(n-1	downto	0);
		weight	:	in 	std_logic;
		d_out	: 	out signed(n-1	downto 	0)
	);

end binary_mult;

architecture behavior of binary_mult is

	component generic_mux2to1 is

		generic(
			n	:	integer	:=	4
			);
		port(
			sel 	: in 	std_logic;
			d_0		: in 	signed((n-1) downto 0); 
			d_1 	: in 	signed((n-1) downto 0);
			d_out 	: out 	signed((n-1) downto 0)
		);

	end component;

	signal	act_ca1	:	signed(n-1	downto	0);
	
begin

	act_ca1 <= not act;
	
	mux : generic_mux2to1
		generic map(
			n => 4
		)
		port map(
			sel		=>	weight,
			d_0		=>	act_ca1,
			d_1 	=>	act,
			d_out	=>	d_out
		);
					
	

end behavior;