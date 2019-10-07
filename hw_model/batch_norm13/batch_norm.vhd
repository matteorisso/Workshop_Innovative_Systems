library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity batch_norm is

	port(
		clk			:	in	std_logic;
		reset		:	in	std_logic;
		ld_coeff_h	:	in	std_logic;
		act_ready_h	:	in	std_logic;
		act			:	in 	std_logic_vector(12	downto 0);
		coeff		:	in	std_logic_vector(15 downto 0);
		res			: 	out std_logic_vector(2 	downto 0)
		);
		
end entity;

architecture structure of batch_norm is

	component batch_norm_pe is
		port(
			clk		:	in	std_logic;
			en_a_h	:	in	std_logic;
			en_act_h:	in	std_logic;
			en_b_h	:	in	std_logic;
			en_mul_h:	in	std_logic;
			en_sum_h:	in	std_logic;
			rst_l	:	in	std_logic;
			en_mul	:	in	std_logic;
			en_sum	:	in	std_logic;
			act		:	in 	std_logic_vector(12	downto 0);
			a		:	in	std_logic_vector(7 	downto 0);
			b 		:	in 	std_logic_vector(7 	downto 0);
			res		: 	out std_logic_vector(26 downto 0)
			);
	end component;
	
	component relu_4bit is
		port(
			d_in 	: in 	std_logic_vector(26 downto 0);
			d_out 	: out 	std_logic_vector(2 downto 0)
		);
	end component;
	
	component batch_norm_fsm is
		port(
			reset			:	in	std_logic;
			ld_coeff_h		:	in	std_logic;
			act_ready_h		:	in	std_logic;
			clk				:	in	std_logic;
			en_reg_a_h		:	out	std_logic;
			en_reg_act_h	:	out	std_logic;
			en_reg_b_h		:	out	std_logic;
			en_reg_mul_h	:	out	std_logic;
			en_reg_sum_h	:	out	std_logic;
			rst_reg_l		:	out	std_logic;
			en_mul			:	out	std_logic;
			en_sum			:	out	std_logic
		);
	end component;
	
	signal 	en_a_reg_bn_h	:	std_logic;
	signal 	en_b_reg_bn_h	:	std_logic;
	signal 	en_act_reg_bn_h	:	std_logic;
	signal 	en_mul_reg_bn_h	:	std_logic;
	signal 	en_sum_reg_bn_h	:	std_logic;	
	
	signal	rst_reg_l		:	std_logic;
	
	signal	en_multiplier	:	std_logic;
	signal	en_adder		:	std_logic;
	
	signal relu_in			:	std_logic_vector(26 downto 0);
	
	
begin

	pe	:	batch_norm_pe
		port map(
			clk		=>	clk,
			en_a_h	=>	en_a_reg_bn_h,
			en_act_h=>	en_act_reg_bn_h,
			en_b_h	=>	en_b_reg_bn_h,
			en_mul_h=>	en_mul_reg_bn_h,
			en_sum_h=>	en_sum_reg_bn_h,
			rst_l	=>	rst_reg_l,
			en_mul	=>	en_multiplier,
			en_sum	=>	en_adder,
			act		=>	act,
			a		=>	coeff(15 downto 8),
			b 		=>	coeff(7	 downto 0),
			res		=>	relu_in
		);
	
	relu:	relu_4bit
		port map(
		d_in	=>	relu_in,
		d_out	=>	res
		);
	
	fsm	:	batch_norm_fsm
		port map(
			reset		=>	reset,
			ld_coeff_h	=>	ld_coeff_h,
			act_ready_h	=>	act_ready_h,
			clk			=>	clk,
			en_reg_a_h	=>	en_a_reg_bn_h,
			en_reg_act_h=>	en_act_reg_bn_h,
			en_reg_b_h	=>	en_b_reg_bn_h,
			en_reg_mul_h=>	en_mul_reg_bn_h,
			en_reg_sum_h=>	en_sum_reg_bn_h,
			rst_reg_l	=>	rst_reg_l,
			en_mul		=>	en_multiplier,
			en_sum		=>	en_adder
		);
	
end structure;