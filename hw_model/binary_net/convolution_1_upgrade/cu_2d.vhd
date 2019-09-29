-- 2D convolutional unit realized with 5 1D convolutional unit
-- and a pop counter.
-- The output of this unit is 2*#1, the complete result of the 
-- convolution would be 2*#1-N, with N : max output value, which 
-- is for the first conv 25, for the second 25*6, for the third
-- 25*16. The -N operation is performed in the following batch 
-- norm layer.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity cu_2d is

	port(
		ifmap_0		: in 	std_logic_vector(4 downto 0);
		ifmap_1		: in 	std_logic_vector(4 downto 0);
		ifmap_2		: in 	std_logic_vector(4 downto 0);
		ifmap_3		: in 	std_logic_vector(4 downto 0);
		ifmap_4 	: in 	std_logic_vector(4 downto 0);
		weights_0	: in 	std_logic_vector(4 downto 0);
		weights_1	: in 	std_logic_vector(4 downto 0);
		weights_2	: in 	std_logic_vector(4 downto 0);
		weights_3	: in 	std_logic_vector(4 downto 0);
		weights_4	: in 	std_logic_vector(4 downto 0);
		pop_window	: out 	std_logic_vector(4 downto 0);
		ofmap 		: out 	std_logic_vector(5 downto 0)
	);
	
end cu_2d;

architecture structure of cu_2d is

	component cu_1d is
		port(
			d_in 	: in 	std_logic_vector(4 downto 0);
			weights	: in 	std_logic_vector(4 downto 0);
			d_out 	: out 	std_logic_vector(4 downto 0)
		);
	end component;
	
	component popcount
		port(
			d_in 	: in 	std_logic_vector(24 downto 0);
			d_out 	: out 	std_logic_vector(4 downto 0)
		);
	end component;
	
	signal c1d_out_0	:	std_logic_vector(4 	downto 0);
	signal c1d_out_1	:	std_logic_vector(4 	downto 0);
	signal c1d_out_2	:	std_logic_vector(4 	downto 0);
	signal c1d_out_3	:	std_logic_vector(4 	downto 0);
	signal c1d_out_4	:	std_logic_vector(4	downto 0);
	
	signal ofmap_pre_sh	:	std_logic_vector(4	downto 0);
	
	signal popcount_in	:	std_logic_vector(24	downto 0);
	signal ifmap		:	std_logic_vector(24	downto 0);

begin
	
	unit_0	:	cu_1d	port map(
							d_in 	=> ifmap_0,
							weights	=> weights_0,
							d_out 	=> c1d_out_0
						);
				
	unit_1	:	cu_1d	port map(
							d_in 	=> ifmap_1,
							weights	=> weights_1,
							d_out 	=> c1d_out_1
						);
	
	unit_2	:	cu_1d	port map(
							d_in 	=> ifmap_2,
							weights	=> weights_2,
							d_out 	=> c1d_out_2
						);
						
	unit_3	:	cu_1d	port map(
							d_in 	=> ifmap_3,
							weights	=> weights_3,
							d_out 	=> c1d_out_3
						);
				
	unit_4	:	cu_1d	port map(
							d_in 	=> ifmap_4,
							weights	=> weights_4,
							d_out 	=> c1d_out_4
						);
				
	popcount_in	<=	c1d_out_4&c1d_out_3&c1d_out_2&c1d_out_1&c1d_out_0;
	
	popcnt	:	popcount	port map(
								d_in 	=> popcount_in,
								d_out 	=> ofmap_pre_sh
							);
							
	ofmap	<=	ofmap_pre_sh&'0';
	
	ifmap	<=	ifmap_0&ifmap_1&ifmap_2&ifmap_3&ifmap_4;
	
	pop_in	:	popcount	port map(
								d_in 	=> ifmap,
								d_out 	=> pop_window
							);
	
end structure;