library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity softmax is

	port(
		reset	:	in	std_logic;
		clk		:	in	std_logic;
		start	:	in	std_logic;
		en_clk	: 	in	std_logic;
		
		d_in_0 	: 	in 	std_logic_vector(7 downto 0);
		d_in_1 	: 	in 	std_logic_vector(7 downto 0);
		d_in_2 	: 	in 	std_logic_vector(7 downto 0);
		d_in_3 	: 	in 	std_logic_vector(7 downto 0);
		d_in_4 	: 	in 	std_logic_vector(7 downto 0);
		d_in_5 	: 	in 	std_logic_vector(7 downto 0);
		d_in_6 	: 	in 	std_logic_vector(7 downto 0);
		d_in_7 	: 	in 	std_logic_vector(7 downto 0);
		d_in_8 	: 	in 	std_logic_vector(7 downto 0);
		d_in_9 	: 	in 	std_logic_vector(7 downto 0);
		
		two_pow	: 	out std_logic_vector(7 downto 0)
	);
	
end softmax;

architecture structure of softmax is
	
	component softmax_eu is
		port(
			en_clk	: 	in	std_logic;
			clk		:	in	std_logic;
			rst_l	:	in	std_logic;
			en_h	:	in	std_logic;
			
			en_cnt	:	in	std_logic;
			
			d_in_0 	: 	in 	std_logic_vector(7 downto 0);
			d_in_1 	: 	in 	std_logic_vector(7 downto 0);
			d_in_2 	: 	in 	std_logic_vector(7 downto 0);
			d_in_3 	: 	in 	std_logic_vector(7 downto 0);
			d_in_4 	: 	in 	std_logic_vector(7 downto 0);
			d_in_5 	: 	in 	std_logic_vector(7 downto 0);
			d_in_6 	: 	in 	std_logic_vector(7 downto 0);
			d_in_7 	: 	in 	std_logic_vector(7 downto 0);
			d_in_8 	: 	in 	std_logic_vector(7 downto 0);
			d_in_9 	: 	in 	std_logic_vector(7 downto 0);
			
			tc_9	:	out	std_logic;
			two_pow	: 	out std_logic_vector(7 downto 0)
		);
	end component;
	
	component softmax_fsm is
		port(
			reset			:	in		std_logic;
			clk				:	in		std_logic;
			start			:	in		std_logic;
			
			tc_9			:	in		std_logic;
			
			cnt4_en_h		:	out		std_logic;
			
			en_reg_h		:	out		std_logic;
			rst_reg_l		:	out		std_logic
		);	
	end component;
	
	signal	tc_9		:	std_logic;
	signal 	rst_reg_l	:	std_logic;
	signal 	en_reg_h	:	std_logic;
	signal 	en_cnt		:	std_logic;
	
begin
	
	eu	:	softmax_eu	port map(
							en_clk		=>	en_clk,
							clk			=>	clk,
							rst_l		=>	rst_reg_l,
							en_h		=>	en_reg_h,
							en_cnt		=>	en_cnt,
							d_in_0  	=>	d_in_0,
							d_in_1 		=>	d_in_1,
							d_in_2 		=>	d_in_2,
							d_in_3 		=>	d_in_3,
							d_in_4 		=>	d_in_4,
							d_in_5 		=>	d_in_5,
							d_in_6 		=>	d_in_6,
							d_in_7 		=>	d_in_7,
							d_in_8 		=>	d_in_8,
							d_in_9 		=>	d_in_9,
							tc_9		=>	tc_9,
							two_pow		=>	two_pow
						);
	
	fsm	:	softmax_fsm port map(
							reset		=>	reset,
							clk			=>	clk,
							start		=>	start,
							tc_9		=>	tc_9,
							cnt4_en_h	=>	en_cnt,
							en_reg_h	=>	en_reg_h,
							rst_reg_l	=>	rst_reg_l
						);
	
end structure;