-- Generic mux 5-to-1.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity generic_mux5to1 is

	generic(n : integer := 4);
	
	port(
		sel 	: in 	std_logic_vector(2		downto	0);
		d_0 	: in 	std_logic_vector((n-1)	downto	0);
		d_1 	: in 	std_logic_vector((n-1)	downto	0);
		d_2 	: in 	std_logic_vector((n-1)	downto	0);
		d_3 	: in 	std_logic_vector((n-1)	downto	0);
		d_4 	: in 	std_logic_vector((n-1)	downto	0);
		d_out	: out 	std_logic_vector((n-1)	downto	0)
	);

end generic_mux5to1;

architecture behavior of generic_mux5to1 is
	
	component generic_mux2to1 is
		generic(n : integer := 4);
		port(
			sel 	: in 	std_logic;
			d_0 	: in 	std_logic_vector((n-1) downto 0);
			d_1 	: in 	std_logic_vector((n-1) downto 0);
			d_out	: out 	std_logic_vector((n-1) downto 0)
		);
	end component;
	
	signal d_out_mux_0	:	std_logic_vector((n-1)	downto	0);
	signal d_out_mux_1	:	std_logic_vector((n-1)	downto	0);
	signal d_out_mux_2	:	std_logic_vector((n-1)	downto	0);
	
begin
	
	mux0	:	generic_mux2to1	generic map(
									n	=>	5
								)
								port map(
									sel 	=>	sel(2),
									d_0 	=>	d_0,
									d_1 	=>	d_1,
									d_out	=>	d_out_mux_0
								);
								
	mux1	:	generic_mux2to1	generic map(
									n	=>	5
								)
								port map(
									sel 	=>	sel(2),
									d_0 	=>	d_2,
									d_1 	=>	d_3,
									d_out	=>	d_out_mux_1
								);
								
	mux2	:	generic_mux2to1	generic map(
									n	=>	5
								)
								port map(
									sel 	=>	sel(1),
									d_0 	=>	d_out_mux_0,
									d_1 	=>	d_out_mux_1,
									d_out	=>	d_out_mux_2
								);							
								
	mux3	:	generic_mux2to1	generic map(
									n	=>	5
								)
								port map(
									sel 	=>	sel(0),
									d_0 	=>	d_out_mux_2,
									d_1 	=>	d_4,
									d_out	=>	d_out
								);							

end behavior;