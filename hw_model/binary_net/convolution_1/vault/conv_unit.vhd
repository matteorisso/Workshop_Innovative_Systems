-- 1D convolutional unit realized with 5 xnor logic gates.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity conv_unit is

	port(
		reset	:	in	std_logic;
		start	:	in	std_logic;
		done	:	in	std_logic;
		clk		:	in	std_logic;
		en_clk	:	in	std_logic;
		
		rf_in 	: 	in 	std_logic_vector(83	downto 0);
		spw0_in	: 	in 	std_logic_vector(4	downto 0);
		spw1_in	: 	in 	std_logic_vector(4	downto 0);
		spw2_in	: 	in 	std_logic_vector(4	downto 0);
		spw3_in	: 	in 	std_logic_vector(4	downto 0);
		spw4_in	: 	in 	std_logic_vector(4	downto 0);
		spw5_in	: 	in 	std_logic_vector(4	downto 0);
		
		ofmap_0	: 	out std_logic_vector(5	downto 0);
		ofmap_1	: 	out std_logic_vector(5	downto 0);
		ofmap_2	: 	out	std_logic_vector(5	downto 0);
		ofmap_3	: 	out	std_logic_vector(5	downto 0);
		ofmap_4	: 	out std_logic_vector(5	downto 0);
		ofmap_5	: 	out std_logic_vector(5	downto 0)
	);
	
end conv_unit;

architecture structure of conv_unit is
	
	component conv_unit_eu is
		port(
			en_clk			:	in	std_logic;
			clk				:	in 	std_logic;
			rst_l 			: 	in 	std_logic;
			
			cnt5_en_h		:	in	std_logic;
			
			sbpg_ctrl_inc	:	in	std_logic;
			sbpg_tgl_en		:	in	std_logic;
			
			rf_ctrl_inc_h	:	in	std_logic;
			
			rf_in 			: 	in 	std_logic_vector(83	downto 0);
			
			spw0_en_0_h		: 	in 	std_logic;
			spw0_en_1_h		: 	in 	std_logic;
			spw0_en_2_h		: 	in 	std_logic;
			spw0_en_3_h		: 	in 	std_logic;
			spw0_en_4_h		: 	in 	std_logic;
			spw0_in			: 	in 	std_logic_vector(4	downto 0);
			
			spw1_en_0_h		: 	in 	std_logic;
			spw1_en_1_h		: 	in 	std_logic;
			spw1_en_2_h		: 	in 	std_logic;
			spw1_en_3_h		: 	in 	std_logic;
			spw1_en_4_h		: 	in 	std_logic;
			spw1_in			: 	in 	std_logic_vector(4	downto 0);
			
			spw2_en_0_h		: 	in 	std_logic;
			spw2_en_1_h		: 	in 	std_logic;
			spw2_en_2_h		: 	in 	std_logic;
			spw2_en_3_h		: 	in 	std_logic;
			spw2_en_4_h		: 	in 	std_logic;
			spw2_in			: 	in 	std_logic_vector(4	downto 0);
			
			spw3_en_0_h		: 	in 	std_logic;
			spw3_en_1_h		: 	in 	std_logic;
			spw3_en_2_h		: 	in 	std_logic;
			spw3_en_3_h		: 	in 	std_logic;
			spw3_en_4_h		: 	in 	std_logic;
			spw3_in			: 	in 	std_logic_vector(4	downto 0);
			
			spw4_en_0_h		: 	in 	std_logic;
			spw4_en_1_h		: 	in 	std_logic;
			spw4_en_2_h		: 	in 	std_logic;
			spw4_en_3_h		: 	in 	std_logic;
			spw4_en_4_h		: 	in 	std_logic;
			spw4_in			: 	in 	std_logic_vector(4	downto 0);
			
			spw5_en_0_h		: 	in 	std_logic;
			spw5_en_1_h		: 	in 	std_logic;
			spw5_en_2_h		: 	in 	std_logic;
			spw5_en_3_h		: 	in 	std_logic;
			spw5_en_4_h		: 	in 	std_logic;
			spw5_in			: 	in 	std_logic_vector(4	downto 0);
			
			rfint_ctrl_sh_h	:	in	std_logic;
			
			rfint_en_h		:	in	std_logic;
			
			sbpg_ctrl_uphdnl:	out	std_logic;
			
			cnt5_tc_4		:	out	std_logic;
			cnt5_tc_31		:	out	std_logic;
			
			ofmap_0			: 	out std_logic_vector(5	downto 0);
			ofmap_1			: 	out std_logic_vector(5	downto 0);
			ofmap_2			: 	out	std_logic_vector(5	downto 0);
			ofmap_3			: 	out	std_logic_vector(5	downto 0);
			ofmap_4			: 	out std_logic_vector(5	downto 0);
			ofmap_5			: 	out std_logic_vector(5	downto 0)
			);
	end component;
	
	component conv_unit_fsm is
		port(
			reset			:	in		std_logic;
			clk				:	in		std_logic;
			start			:	in		std_logic;
			done			:	in		std_logic;
			
			tc_4			:	in		std_logic;
			tc_31			:	in		std_logic;
			uph_dnl			:	in		std_logic;
			
			cnt5_en_h		:	out		std_logic;
			
			sbpg_ctrl_inc	:	out		std_logic;
			sbpg_tgl_en_h	:	out		std_logic;
			
			rf_ctrl_inc_h	:	out		std_logic;
			
			spw0_en_0_h		: 	out 	std_logic;
			spw0_en_1_h		: 	out 	std_logic;
			spw0_en_2_h		: 	out 	std_logic;
			spw0_en_3_h		: 	out 	std_logic;
			spw0_en_4_h		: 	out 	std_logic;
			
			spw1_en_0_h		: 	out 	std_logic;
			spw1_en_1_h		: 	out 	std_logic;
			spw1_en_2_h		: 	out 	std_logic;
			spw1_en_3_h		: 	out 	std_logic;
			spw1_en_4_h		: 	out 	std_logic;
			
			spw2_en_0_h		: 	out 	std_logic;
			spw2_en_1_h		: 	out 	std_logic;
			spw2_en_2_h		: 	out 	std_logic;
			spw2_en_3_h		: 	out 	std_logic;
			spw2_en_4_h		: 	out 	std_logic;
			
			spw3_en_0_h		: 	out 	std_logic;
			spw3_en_1_h		: 	out 	std_logic;
			spw3_en_2_h		: 	out 	std_logic;
			spw3_en_3_h		: 	out 	std_logic;
			spw3_en_4_h		: 	out 	std_logic;
			
			spw4_en_0_h		: 	out 	std_logic;
			spw4_en_1_h		: 	out 	std_logic;
			spw4_en_2_h		: 	out 	std_logic;
			spw4_en_3_h		: 	out 	std_logic;
			spw4_en_4_h		: 	out 	std_logic;
			
			spw5_en_0_h		: 	out 	std_logic;
			spw5_en_1_h		: 	out 	std_logic;
			spw5_en_2_h		: 	out 	std_logic;
			spw5_en_3_h		: 	out 	std_logic;
			spw5_en_4_h		: 	out 	std_logic;
			
			rfint_ctrl_sh_h	:	out		std_logic;
			
			rfint_en_h		:	out		std_logic;
			
			rst_reg_l		:	out		std_logic
		);	
	end component;
	
	signal	tc_4			:	std_logic;
	signal	tc_31			:	std_logic;
	signal	uph_dnl			:	std_logic;
	
	signal	cnt5_en_h		:	std_logic;
	
	signal	sbpg_ctrl_inc	:	std_logic;
	signal	sbpg_tgl_en		:	std_logic;
	
	signal	rf_ctrl_inc_h	:	std_logic;
	
	signal	spw0_en_0_h		:	std_logic;
	signal	spw0_en_1_h		:	std_logic;
	signal	spw0_en_2_h		: 	std_logic;
	signal	spw0_en_3_h		: 	std_logic;
	signal	spw0_en_4_h		: 	std_logic;
	
	signal	spw1_en_0_h		: 	std_logic;
	signal	spw1_en_1_h		: 	std_logic;
	signal	spw1_en_2_h		: 	std_logic;
	signal	spw1_en_3_h		: 	std_logic;
	signal	spw1_en_4_h		: 	std_logic;
	
	signal	spw2_en_0_h		: 	std_logic;
	signal	spw2_en_1_h		: 	std_logic;
	signal	spw2_en_2_h		: 	std_logic;
	signal	spw2_en_3_h		: 	std_logic;
	signal	spw2_en_4_h		: 	std_logic;
	
	signal	spw3_en_0_h		: 	std_logic;
	signal	spw3_en_1_h		: 	std_logic;
	signal	spw3_en_2_h		: 	std_logic;
	signal	spw3_en_3_h		: 	std_logic;
	signal	spw3_en_4_h		: 	std_logic;
	
	signal	spw4_en_0_h		: 	std_logic;
	signal	spw4_en_1_h		: 	std_logic;
	signal	spw4_en_2_h		: 	std_logic;
	signal	spw4_en_3_h		: 	std_logic;
	signal	spw4_en_4_h		: 	std_logic;
	
	signal	spw5_en_0_h		: 	std_logic;
	signal	spw5_en_1_h		: 	std_logic;
	signal	spw5_en_2_h		: 	std_logic;
	signal	spw5_en_3_h		: 	std_logic;
	signal	spw5_en_4_h		: 	std_logic;
	
	signal	rfint_ctrl_sh_h	:	std_logic;
	
	signal	rfint_en_h		:	std_logic;
	
	signal	rst_reg_l		:	std_logic;
	
begin
	
	eu	:	conv_unit_eu	port map(
								en_clk			=>	en_clk,
								clk				=>	clk,
								rst_l 			=>	rst_reg_l,
								
								cnt5_en_h		=>	cnt5_en_h,
								
								sbpg_ctrl_inc	=>	sbpg_ctrl_inc,
								sbpg_tgl_en		=>	sbpg_tgl_en,
								
								rf_ctrl_inc_h	=>	rf_ctrl_inc_h,
								
								rf_in 			=>	rf_in,
								
								spw0_en_0_h		=>	spw0_en_0_h,
								spw0_en_1_h		=>	spw0_en_1_h,
								spw0_en_2_h		=>	spw0_en_2_h,
								spw0_en_3_h		=>	spw0_en_3_h,
								spw0_en_4_h		=>	spw0_en_4_h,
								spw0_in			=>	spw0_in,
								
								spw1_en_0_h		=>	spw1_en_0_h,
								spw1_en_1_h		=>	spw1_en_1_h,
								spw1_en_2_h		=>	spw1_en_2_h,
								spw1_en_3_h		=>	spw1_en_3_h,
								spw1_en_4_h		=>	spw1_en_4_h,
								spw1_in			=>	spw1_in,
								
								spw2_en_0_h		=>	spw2_en_0_h,
								spw2_en_1_h		=>	spw2_en_1_h,
								spw2_en_2_h		=>	spw2_en_2_h,
								spw2_en_3_h		=>	spw2_en_3_h,
								spw2_en_4_h		=>	spw2_en_4_h,
								spw2_in			=>	spw2_in,
								
								spw3_en_0_h		=>	spw3_en_0_h,
								spw3_en_1_h		=>	spw3_en_1_h,
								spw3_en_2_h		=>	spw3_en_2_h,
								spw3_en_3_h		=>	spw3_en_3_h,
								spw3_en_4_h		=>	spw3_en_4_h,
								spw3_in			=>	spw3_in,
								
								spw4_en_0_h		=>	spw4_en_0_h,
								spw4_en_1_h		=>	spw4_en_1_h,
								spw4_en_2_h		=>	spw4_en_2_h,
								spw4_en_3_h		=>	spw4_en_3_h,
								spw4_en_4_h		=>	spw4_en_4_h,
								spw4_in			=>	spw4_in,
								
								spw5_en_0_h		=>	spw5_en_0_h,
								spw5_en_1_h		=>	spw5_en_1_h,
								spw5_en_2_h		=>	spw5_en_2_h,
								spw5_en_3_h		=>	spw5_en_3_h,
								spw5_en_4_h		=>	spw5_en_4_h,
								spw5_in			=>	spw5_in,
								
								rfint_ctrl_sh_h	=>	rfint_ctrl_sh_h,
								
								rfint_en_h		=>	rfint_en_h,
								
								sbpg_ctrl_uphdnl=>	uph_dnl,
								
								cnt5_tc_4		=>	tc_4,
								cnt5_tc_31		=>	tc_31,
								
								ofmap_0			=>	ofmap_0,
								ofmap_1			=>	ofmap_1,
								ofmap_2			=>	ofmap_2,
								ofmap_3			=>	ofmap_3,
								ofmap_4			=>	ofmap_4,
								ofmap_5			=>	ofmap_5
							);
	
	fsm	:	conv_unit_fsm	port map(
								reset			=>	reset,
								clk				=>	clk,
								start			=>	start,
								done			=>	done,
								
								tc_4			=>	tc_4,
								tc_31			=>	tc_31,
								uph_dnl			=>	uph_dnl,
								
								cnt5_en_h		=>	cnt5_en_h,
								
								sbpg_ctrl_inc	=>	sbpg_ctrl_inc,
								sbpg_tgl_en_h	=>	sbpg_tgl_en,
								
								rf_ctrl_inc_h	=>	rf_ctrl_inc_h,
								
								spw0_en_0_h		=>	spw0_en_0_h,
								spw0_en_1_h		=>	spw0_en_1_h,
								spw0_en_2_h		=>	spw0_en_2_h,
								spw0_en_3_h		=>	spw0_en_3_h,
								spw0_en_4_h		=>	spw0_en_4_h,
								
								spw1_en_0_h		=>	spw1_en_0_h,
								spw1_en_1_h		=>	spw1_en_1_h,
								spw1_en_2_h		=>	spw1_en_2_h,
								spw1_en_3_h		=>	spw1_en_3_h,
								spw1_en_4_h		=>	spw1_en_4_h,
								
								spw2_en_0_h		=>	spw2_en_0_h,
								spw2_en_1_h		=>	spw2_en_1_h,
								spw2_en_2_h		=>	spw2_en_2_h,
								spw2_en_3_h		=>	spw2_en_3_h,
								spw2_en_4_h		=>	spw2_en_4_h,
								
								spw3_en_0_h		=>	spw3_en_0_h,
								spw3_en_1_h		=>	spw3_en_1_h,
								spw3_en_2_h		=>	spw3_en_2_h,
								spw3_en_3_h		=>	spw3_en_3_h,
								spw3_en_4_h		=>	spw3_en_4_h,
								
								spw4_en_0_h		=>	spw4_en_0_h,
								spw4_en_1_h		=>	spw4_en_1_h,
								spw4_en_2_h		=>	spw4_en_2_h,
								spw4_en_3_h		=>	spw4_en_3_h,
								spw4_en_4_h		=>	spw4_en_4_h,
								
								spw5_en_0_h		=>	spw5_en_0_h,
								spw5_en_1_h		=>	spw5_en_1_h,
								spw5_en_2_h		=>	spw5_en_2_h,
								spw5_en_3_h		=>	spw5_en_3_h,
								spw5_en_4_h		=>	spw5_en_4_h,
								
								rfint_ctrl_sh_h	=>	rfint_ctrl_sh_h,
								
								rfint_en_h		=>	rfint_en_h,
								
								rst_reg_l		=>	rst_reg_l
							);
	
end structure;