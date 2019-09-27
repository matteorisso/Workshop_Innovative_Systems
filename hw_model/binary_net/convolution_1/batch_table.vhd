-- Combinatorial circuit that perform the batch 
-- normalization operation plus sign function.
-- It takes as input the sign of parameter a,b 
-- and a bit which is one if the output of conv
-- is higer than ceil(-b/a), 0 otherwise.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity batch_table is

	port(
		sign_a 		: in 	std_logic;
		sign_b		: in 	std_logic;
		x			: in 	std_logic;
		batch_out 	: out 	std_logic
	);
	
end batch_table;

architecture structure of batch_table is
	
	component generic_mux2to1 is
		generic(n : integer := 4);
		port(
			sel 	: in 	std_logic;
			d_0 	: in 	std_logic_vector((n-1) downto 0);
			d_1 	: in 	std_logic_vector((n-1) downto 0);
			d_out	: out 	std_logic_vector((n-1) downto 0)
		);
	end component;
	
	signal mux_sel	:	std_logic;
	signal not_x	:	std_logic;
	
begin
	
	mux	:	generic_mux2to1	generic map(
								n	=>	1
							)
							port map(
								sel 	=>	mux_sel,
								d_0(0) 	=>	x,
								d_1(0) 	=>	not_x,
								d_out(0)=>	batch_out
							);
							
	mux_sel	<=	sign_a	nor	sign_b;
	not_x	<=	not	x;
	
end structure;