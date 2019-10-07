-- Binary batch normalization unit, realized with
-- a comparator and a simple boolean table.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity bn_unit is

	port(
		en_clk		: 	in	std_logic;
		clk			:	in	std_logic;
		rst_l		:	in	std_logic;
		sign_a 		: 	in 	std_logic;
		sign_b		: 	in 	std_logic;
		conv_out	: 	in 	std_logic_vector(9 downto 0);
		coefficient	: 	in 	std_logic_vector(9 downto 0);
		bn_out 		: 	out std_logic
	);
	
end bn_unit;

architecture structure of bn_unit is
	
	component comparator is
		port(
			en_clk		: 	in	std_logic;
			clk			:	in	std_logic;
			rst_l		:	in	std_logic;
			en_h		:	in	std_logic;
			conv_out	: 	in 	std_logic_vector(9 downto 0);
			coefficient	: 	in 	std_logic_vector(9 downto 0);
			x	 		: 	out std_logic
		);
	end component;
	
	component  batch_table is
		port(
			sign_a 		: in 	std_logic;
			sign_b		: in 	std_logic;
			x			: in 	std_logic;
			batch_out 	: out 	std_logic
		);	
	end component;
	
	signal comp_out		:	std_logic;
	
begin
	
	comp		:	comparator			port map(
											en_clk		=>	en_clk,
											clk			=>	clk,
											rst_l		=>	rst_l,
											en_h		=>	'1',
											conv_out	=>	conv_out,
											coefficient	=>	coefficient,
											x	 		=>	comp_out
										);
	
	table		:	batch_table			port map(
											sign_a 		=>	sign_a,
											sign_b		=>	sign_b,
											x			=>	comp_out,
											batch_out 	=>	bn_out
										);
	
	
end structure;