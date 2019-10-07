-- Circuit that implements the function e^(x_i-x_max).

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity exp_func is

	port(
		en_clk		: in	std_logic;
		clk			: in 	std_logic;
		en_h		: in 	std_logic;
		rst_l 		: in 	std_logic;
		d_in 		: in 	std_logic_vector(6 	downto 	0);
		max			: in 	std_logic_vector(6 	downto 	0);
		two_pow		: out 	std_logic_vector(7 	downto 	0)
	);
	
end exp_func;

architecture structure of exp_func is
	
	component	generic_register is
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
	
	component add_subb is
		port(
			a			:	in 	std_logic_vector(7 downto 0);
			b 			:	in 	std_logic_vector(7 downto 0);
			addh_subl	:	in	std_logic;
			res			: 	out std_logic_vector(7 downto 0)
			);	
	end component;
	
	signal d_in_ext		:	std_logic_vector(7	downto	0);
	signal max_ext		:	std_logic_vector(7	downto	0);
	signal sub_0_out	:	std_logic_vector(7	downto	0);
	signal reg_0_out	:	std_logic_vector(7	downto	0);
	signal d_shift_1	:	std_logic_vector(7	downto	0);
	signal d_shift_4	:	std_logic_vector(7	downto	0);
	signal add_1_out	:	std_logic_vector(7	downto	0);
	signal reg_1_out	:	std_logic_vector(7	downto	0);
	signal reg_2_out	:	std_logic_vector(7	downto	0);
	
	
begin
	
	d_in_ext	<=	d_in(6)&d_in;
	max_ext		<=	max(6)&max;
	
	sub_0	:	add_subb			port map(
										a			=>	d_in_ext,
										b 			=>	max_ext,
										addh_subl	=>	'0',
										res			=>	sub_0_out
									);
	
	reg0	:	generic_register	generic map(
										n	=>	8
									)
									port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_h,
										rst_l 	=>	rst_l,
										d_in 	=>	sub_0_out,
										d_out 	=>	reg_0_out
									);
	
	d_shift_1	<=	reg_0_out(7)&reg_0_out(7 downto 1);
	d_shift_4	<=	reg_0_out(7)&reg_0_out(7)&reg_0_out(7)&reg_0_out(7)&reg_0_out(7 downto 4);
	
	add_1	:	add_subb			port map(
										a			=>	d_shift_1,
										b 			=>	d_shift_4,
										addh_subl	=>	'0',
										res			=>	add_1_out
									);
	
	reg1	:	generic_register	generic map(
										n	=>	8
									)
									port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_h,
										rst_l 	=>	rst_l,
										d_in 	=>	reg_0_out,
										d_out 	=>	reg_1_out
									);
	
	reg2	:	generic_register	generic map(
										n	=>	8
									)
									port map(
										en_clk	=>	en_clk,
										clk		=>	clk,
										en_h	=>	en_h,
										rst_l 	=>	rst_l,
										d_in 	=>	add_1_out,
										d_out 	=>	reg_2_out
									);
	
	sub_2	:	add_subb			port map(
										a			=>	reg_2_out,
										b 			=>	reg_1_out,
										addh_subl	=>	'1',
										res			=>	two_pow
									);
	
end structure;