library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	
	use work.param.all;

entity batch_norm_pe is

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
		act		:	in 	std_logic_vector((N+G-1)	downto 0);
		a		:	in	std_logic_vector(7 	downto 0);
		b 		:	in 	std_logic_vector(7 	downto 0);
		res		: 	out std_logic_vector(2*(N+G) downto 0)
		);
		
end entity;

architecture structure of batch_norm_pe is

	component generic_mux2to1 is
		generic(n : integer := 4);
		port(
			sel 	: in 	std_logic;
			d_0 	: in 	std_logic_vector((n-1) downto 0);
			d_1 	: in 	std_logic_vector((n-1) downto 0);
			d_out	: out 	std_logic_vector((n-1) downto 0)
		);
	end component;

	component generic_register is
		generic(n : integer := 8);
		port(
			clk		: in 	std_logic;
			en_h	: in 	std_logic;
			rst_l 	: in 	std_logic;
			d_in 	: in 	std_logic_vector((n-1) downto 0);
			d_out 	: out 	std_logic_vector((n-1) downto 0)
			);
	end component;
	
	component multiplier is
		generic(n : integer := (N+G));
		port(
			a	:	in 	std_logic_vector((n-1) downto 0);
			b 	:	in 	std_logic_vector((n-1) downto 0);
			res	: 	out std_logic_vector((2*n-1) downto 0)
			);
	end component;
	
	component adder is 
		generic(n : integer := 2*(N+G));
		port(
			a	:	in 	std_logic_vector(n downto 0);
			b 	:	in 	std_logic_vector(n downto 0);
			res	: 	out std_logic_vector(n downto 0)
			);
	end component;
	
	constant	init_mul		:	std_logic_vector((N+G-1)	downto	0)	:=	(others => '0');
	constant	init_sum		:	std_logic_vector(7	downto	0)	:=	(others => '0');
	constant	init_sum_mul	:	std_logic_vector((2*(N+G)-1)	downto	0)	:=	(others => '0');
	
	signal		mux_act_out		:	std_logic_vector((N+G-1)	downto 0);
	signal		mux_a_out		:	std_logic_vector(7	downto 0);
	signal		mux_b_out		:	std_logic_vector(7	downto 0);
	signal		mux_mul_out		:	std_logic_vector((2*(N+G)-1) downto 0);
		
	signal 		act_reg_out		:	std_logic_vector((N+G-1)	downto 0);
	signal 		a_reg_out		:	std_logic_vector(7	downto 0);
	signal 		b_reg_out		:	std_logic_vector(7	downto 0);
	
	signal		mult_out		:	std_logic_vector((2*(N+G)-1) downto 0);
	signal		mult_reg_out	:	std_logic_vector((2*(N+G)-1) downto 0);
	
	signal 		a_ext_mul		:	std_logic_vector((N+G-1)	downto 0);
	
	signal		a_ext			:	std_logic_vector(2*(N+G) downto 0);
	signal		b_ext			:	std_logic_vector(2*(N+G) downto 0);
	signal		adder_out		:	std_logic_vector(2*(N+G) downto 0);
		
begin
	
	a_ext_mul((N+G-1)	downto 8)	<=	((N+G-1)	downto 8 => mux_a_out(7));
	a_ext_mul(7			downto 0)	<=	mux_a_out;
	
	a_ext							<=	mux_mul_out(2*(N+G)-1)&mux_mul_out;
	b_ext(2*(N+G) 		downto 11)	<=	(2*(N+G) downto 11 => mux_b_out(7));
	b_ext(10 			downto 3)	<=	mux_b_out;
	b_ext(2 			downto 0)	<=	(others => '0');
	
	reg_act		:	generic_register
		generic map(
			n		=>	(N+G)
		)
		port map(
			clk		=>	clk,
			en_h	=>	en_act_h,
			rst_l 	=>	rst_l,
			d_in 	=>	act,
			d_out 	=>	act_reg_out
		);
		
	reg_a		:	generic_register
		generic map(
			n		=>	8
		)
		port map(
			clk		=>	clk,
			en_h	=>	en_a_h,
			rst_l 	=>	rst_l,
			d_in 	=>	a,
			d_out 	=>	a_reg_out
		);
		
	reg_b		:	generic_register
		generic map(
			n		=>	8
		)
		port map(
			clk		=>	clk,
			en_h	=>	en_b_h,
			rst_l 	=>	rst_l,
			d_in 	=>	b,
			d_out 	=>	b_reg_out
		);	

	mux_a		:	generic_mux2to1
		generic map(
			n		=>	8
		)
		port map(
			sel 	=>	en_mul,
			d_0 	=>	init_mul(7 downto 0),
			d_1 	=>	a_reg_out,
			d_out	=>	mux_a_out
		);	
	
	mux_act		:	generic_mux2to1
		generic map(
			n		=>	(N+G)
		)
		port map(
			sel 	=>	en_mul,
			d_0 	=>	init_mul,
			d_1 	=>	act_reg_out,
			d_out	=>	mux_act_out
		);

	mux_b		:	generic_mux2to1
		generic map(
			n		=>	8
		)
		port map(
			sel 	=>	en_sum,
			d_0 	=>	init_sum,
			d_1 	=>	b_reg_out,
			d_out	=>	mux_b_out
		);	
		
	mult		:	multiplier
		generic map(
			n	=>	(N+G)
		)
		port map(
			a	=>	a_ext_mul,
			b 	=>	mux_act_out,
			res	=>	mult_out
		);
		
	reg_mult	:	generic_register
		generic map(
			n		=>	2*(N+G)
		)
		port map(
			clk		=>	clk,
			en_h	=>	en_mul_h,
			rst_l 	=>	rst_l,
			d_in 	=>	mult_out,
			d_out 	=>	mult_reg_out
		);
	
	mux_mul		:	generic_mux2to1
		generic map(
			n		=>	2*(N+G)
		)
		port map(
			sel 	=>	en_sum,
			d_0 	=>	init_sum_mul,
			d_1 	=>	mult_reg_out,
			d_out	=>	mux_mul_out
		);	
	
	sum			:	adder
		generic map(
			n		=>	2*(N+G)
		)
		port map(
			a		=>	a_ext,
			b 		=>	b_ext,
			res		=>	adder_out
		);
		
	reg_out		:	generic_register
		generic map(
			n		=>	2*(N+G)+1
		)
		port map(
			clk		=>	clk,
			en_h	=>	en_sum_h,
			rst_l 	=>	rst_l,
			d_in 	=>	adder_out,
			d_out 	=>	res
		);
	
end structure;