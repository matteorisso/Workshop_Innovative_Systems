-- Pooling.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity pooling is

	port(
		reset		:	in	std_logic;
		clk			:	in	std_logic;
		start		:	in	std_logic;
		done		:	in	std_logic;
		en_clk		:	in	std_logic;
		
		d_in		:	in	std_logic_vector(83 downto	0);
		
		d_out 		:  	out	std_logic_vector(6	downto 	0)
	);

end pooling;

architecture behavior of pooling is

	component pooling_eu is
		port(
			en_clk		:	in	std_logic;
			clk			:  	in 	std_logic;
			rst_l 		:  	in 	std_logic;
			
			en_cnt5_h	: 	in	std_logic;
			
			en_rfint_h	:	in 	std_logic;
			
			rf_en_0_h	: 	in 	std_logic;
			rf_en_1_h	: 	in 	std_logic;
			rf_en_2_h	: 	in 	std_logic;
			rf_en_3_h	: 	in 	std_logic;
			rf_en_4_h	: 	in 	std_logic;
			rf_in		:	in	std_logic_vector(83 downto	0);
			
			tc_27		:  	out	std_logic;
			d_out 		:  	out	std_logic_vector(6	downto 	0)
		);
	end component;
	
	component pooling_fsm is
		port(
			reset		:	in	std_logic;
			clk			:	in	std_logic;
			start		:	in	std_logic;
			done		:	in	std_logic;

			tc_27		:	in	std_logic;
			
			cnt5_en_h	:	out	std_logic;
			
			en_rfint_h	:	out std_logic;
			
			rf_en_0_h	: 	out std_logic;
			rf_en_1_h	: 	out std_logic;
			rf_en_2_h	: 	out std_logic;
			rf_en_3_h	: 	out std_logic;
			rf_en_4_h	: 	out std_logic;
			
			rst_reg_l	:	out	std_logic
		);	
	end component;
	
	signal en_cnt5_h	:	std_logic;
	signal en_rfint_h	:	std_logic;
	signal rst_l		:	std_logic;
	signal rf_en_0_h	:	std_logic;
	signal rf_en_1_h	:	std_logic;
	signal rf_en_2_h	:	std_logic;
	signal rf_en_3_h	:	std_logic;
	signal rf_en_4_h	:	std_logic;
	signal tc_27		:	std_logic;
	
	
begin
	
	eu	:	pooling_eu	port map(
							en_clk		=>	en_clk,
							clk			=>	clk,
							rst_l 		=>	rst_l,
							
							en_cnt5_h	=>	en_cnt5_h,
							
							en_rfint_h	=>	en_rfint_h,
							
							rf_en_0_h	=>	rf_en_0_h,
							rf_en_1_h	=>	rf_en_1_h,
							rf_en_2_h	=>	rf_en_2_h,
							rf_en_3_h	=>	rf_en_3_h,
							rf_en_4_h	=>	rf_en_4_h,
							rf_in		=>	d_in,
							
							tc_27		=>	tc_27,
							d_out 		=>	d_out
						);
	
	fsm	:	pooling_fsm	port map(
							reset		=>	reset,
							clk			=>	clk,
							start		=>	start,
							done		=>	done,

							tc_27		=>	tc_27,
							
							cnt5_en_h	=>	en_cnt5_h,
							
							en_rfint_h	=>	en_rfint_h,
							
							rf_en_0_h	=>	rf_en_0_h,
							rf_en_1_h	=>	rf_en_1_h,
							rf_en_2_h	=>	rf_en_2_h,
							rf_en_3_h	=>	rf_en_3_h,
							rf_en_4_h	=>	rf_en_4_h,
							
							rst_reg_l	=>	rst_l
						);
	
end behavior;