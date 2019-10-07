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
		en_ab_h		:	in	std_logic;
		en_coeff_h	:	in	std_logic;
		sign_a 		: 	in 	std_logic;
		sign_b		: 	in 	std_logic;
		conv_out	: 	in 	std_logic_vector(5 downto 0);
		coefficient	: 	in 	std_logic_vector(5 downto 0);
		bn_out 		: 	out std_logic
	);
	
end bn_unit;

architecture structure of bn_unit is
	
	component comparator is
		port(
			en_clk		: 	in	std_logic;
			clk			:	in	std_logic;
			en_h		:	in	std_logic;
			rst_l		:	in	std_logic;
			conv_out	: 	in 	std_logic_vector(5 downto 0);
			coefficient	: 	in 	std_logic_vector(5 downto 0);
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
	
	component generic_register is
		generic(n : integer := 8);
		port(
			en_clk	: in	std_logic;
			clk		: in 	std_logic;
			en_h	: in 	std_logic;
			rst_l 	: in 	std_logic;
			d_in 	: in 	std_logic_vector((n-1) downto 0);
			d_out 	: out 	std_logic_vector((n-1) downto 0)
		);
	end component;
	
	signal sign_ab_in	:	std_logic_vector(1	downto	0);
	signal sign_ab_out	:	std_logic_vector(1	downto	0);
	
	signal coeff_out	:  	std_logic_vector(5 	downto 	0);
	
	signal comp_out		:	std_logic;
	
begin
	
	reg_ab		:	generic_register	generic map(
											n	=>	2
										)
										port map(
											en_clk	=>	en_clk,
											clk		=>	clk,
											en_h	=>	en_ab_h,
											rst_l 	=>	rst_l,
											d_in 	=>	sign_ab_in,
											d_out 	=>	sign_ab_out
										);
	
	sign_ab_in	<=	sign_a&sign_b;
	
	reg_coeff	:	generic_register	generic map(
											n	=>	6
										)
										port map(
											en_clk	=>	en_clk,
											clk		=>	clk,
											en_h	=>	en_coeff_h,
											rst_l 	=>	rst_l,
											d_in 	=>	coefficient,
											d_out 	=>	coeff_out
										);
	
	comp		:	comparator			port map(
											en_clk		=>	en_clk,
											clk			=>	clk,
											rst_l		=>	rst_l,
											en_h		=>	'1',
											conv_out	=>	conv_out,
											coefficient	=>	coeff_out,
											x	 		=>	comp_out
										);
	
	table		:	batch_table			port map(
											sign_a 		=>	sign_ab_out(1),
											sign_b		=>	sign_ab_out(0),
											x			=>	comp_out,
											batch_out 	=>	bn_out
										);
	
	
end structure;