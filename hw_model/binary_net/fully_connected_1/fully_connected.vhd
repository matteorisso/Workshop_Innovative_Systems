-- Fully connected layer 120 to 84.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity fully_connected is

	port(
		en_clk		: 	in	std_logic;
		reset		:	in	std_logic;
		clk			:	in	std_logic;
		start		:	in	std_logic;
		done		:	in	std_logic;
		
		sign_a 		: 	in 	std_logic;
		sign_b		: 	in 	std_logic;
		coefficient	: 	in 	std_logic_vector(9 		downto 0);
		
		act_in 		:	in std_logic_vector(119 	downto 0);
		weights		: 	in 	std_logic_vector(119	downto 0);
		act_out		: 	out std_logic
	);
	
end fully_connected;

architecture structure of fully_connected is
	
	component fc_eu is
		port(
			en_clk		: 	in	std_logic;
			clk			: 	in 	std_logic;
			rst_l 		: 	in 	std_logic;
			
			en_pipe_h	: 	in	std_logic;
			
			en_sp_0_h	: 	in	std_logic;
			en_sp_1_h	: 	in	std_logic;
			en_sp_2_h	: 	in	std_logic;
			en_sp_3_h	: 	in	std_logic;
			en_sp_4_h	: 	in	std_logic;
			
			sign_a 		: 	in 	std_logic;
			sign_b		: 	in 	std_logic;
			coefficient	: 	in 	std_logic_vector(9 		downto 0);
			
			act_in 		:	in std_logic_vector(119 	downto 0);
			weights		: 	in 	std_logic_vector(119	downto 0);
			act_out		: 	out std_logic
		);	
	end component;
	
	component fc_fsm is
		port(
			reset		:	in	std_logic;
			clk			:	in	std_logic;
			start		:	in	std_logic;
			done		:	in	std_logic;

			en_pipe_h	: 	out	std_logic;
			
			en_sp_0_h	: 	out	std_logic;
			en_sp_1_h	: 	out	std_logic;
			en_sp_2_h	: 	out	std_logic;
			en_sp_3_h	: 	out	std_logic;
			en_sp_4_h	: 	out	std_logic;
			
			rst_reg_l	:	out	std_logic
		);		
	end component;
	
	signal en_pipe_h	:	std_logic;
	signal en_sp_0_h	:	std_logic;
	signal en_sp_1_h	:	std_logic;
	signal en_sp_2_h	:	std_logic;
	signal en_sp_3_h	:	std_logic;
	signal en_sp_4_h	:	std_logic;
	signal rst_l		:	std_logic;
		
begin
	
	eu	:	fc_eu	port map(
						en_clk		=>	en_clk,
						clk			=>	clk,
						rst_l 		=>	rst_l,
						en_pipe_h	=>	en_pipe_h,
						en_sp_0_h	=>	en_sp_0_h,
						en_sp_1_h	=>	en_sp_1_h,
						en_sp_2_h	=>	en_sp_2_h,
						en_sp_3_h	=>	en_sp_3_h,
						en_sp_4_h	=>	en_sp_4_h,
						sign_a 		=>	sign_a,
						sign_b		=>	sign_b,
						coefficient	=>	coefficient,
						act_in 		=>	act_in,
						weights		=>	weights,
						act_out		=>	act_out
					);
	
	
	fsm	:	fc_fsm	port map(
						reset		=>	reset,
						clk			=>	clk,
						start		=>	start,
						done		=>	done,
						en_pipe_h	=>	en_pipe_h,
						en_sp_0_h	=>	en_sp_0_h,
						en_sp_1_h	=>	en_sp_1_h,
						en_sp_2_h	=>	en_sp_2_h,
						en_sp_3_h	=>	en_sp_3_h,
						en_sp_4_h	=>	en_sp_4_h,
						rst_reg_l	=>	rst_l
					);
	
	
	
	
	
	
	
	
end structure;