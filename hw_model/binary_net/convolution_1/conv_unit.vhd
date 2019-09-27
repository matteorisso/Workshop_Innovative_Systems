-- 

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
		
		sign_a_0:	in	std_logic;
		sign_a_1:	in	std_logic;
		sign_a_2:	in	std_logic;
		sign_a_3:	in	std_logic;
		sign_a_4:	in	std_logic;
		sign_a_5:	in	std_logic;
		sign_b_0:	in	std_logic;
		sign_b_1:	in	std_logic;
		sign_b_2:	in	std_logic;
		sign_b_3:	in	std_logic;
		sign_b_4:	in	std_logic;
		sign_b_5:	in	std_logic;
		coeff_0	:	in	std_logic_vector(9	downto	0);
		coeff_1	:	in	std_logic_vector(9	downto	0);
		coeff_2	:	in	std_logic_vector(9	downto	0);
		coeff_3	:	in	std_logic_vector(9	downto	0);
		coeff_4 :	in	std_logic_vector(9	downto	0);
		coeff_5	:	in	std_logic_vector(9	downto	0);
	
		bn_out_0: 	out std_logic;
		bn_out_1: 	out std_logic;
		bn_out_2: 	out	std_logic;
		bn_out_3: 	out	std_logic;
		bn_out_4: 	out std_logic;
		bn_out_5: 	out std_logic
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
			
			en_reg0_ab_h	:	in	std_logic;
			en_reg0_coeff_h	:	in	std_logic;
			en_reg1_ab_h	:	in	std_logic;
			en_reg1_coeff_h	:	in	std_logic;
			en_reg2_ab_h	:	in	std_logic;
			en_reg2_coeff_h	:	in	std_logic;
			en_reg3_ab_h	:	in	std_logic;
			en_reg3_coeff_h	:	in	std_logic;
			en_reg4_ab_h	:	in	std_logic;
			en_reg4_coeff_h	:	in	std_logic;
			en_reg5_ab_h	:	in	std_logic;
			en_reg5_coeff_h	:	in	std_logic;
			sign_a_0		:	in	std_logic;
			sign_a_1		:	in	std_logic;
			sign_a_2		:	in	std_logic;
			sign_a_3		:	in	std_logic;
			sign_a_4		:	in	std_logic;
			sign_a_5		:	in	std_logic;
			sign_b_0		:	in	std_logic;
			sign_b_1		:	in	std_logic;
			sign_b_2		:	in	std_logic;
			sign_b_3		:	in	std_logic;
			sign_b_4		:	in	std_logic;
			sign_b_5		:	in	std_logic;
			coeff_0			:	in	std_logic_vector(9	downto	0);
			coeff_1			:	in	std_logic_vector(9	downto	0);
			coeff_2			:	in	std_logic_vector(9	downto	0);
			coeff_3			:	in	std_logic_vector(9	downto	0);
			coeff_4			:	in	std_logic_vector(9	downto	0);
			coeff_5			:	in	std_logic_vector(9	downto	0);
			
			sbpg_ctrl_uphdnl:	out	std_logic;
			
			cnt5_tc_4		:	out	std_logic;
			cnt5_tc_31		:	out	std_logic;
			
			bn_out_0		: 	out std_logic;
			bn_out_1		: 	out std_logic;
			bn_out_2		: 	out	std_logic;
			bn_out_3		: 	out	std_logic;
			bn_out_4		: 	out std_logic;
			bn_out_5		: 	out std_logic
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
			
			en_reg0_ab_h	:	out		std_logic;
			en_reg0_coeff_h	:	out		std_logic;
			en_reg1_ab_h	:	out		std_logic;
			en_reg1_coeff_h	:	out		std_logic;
			en_reg2_ab_h	:	out		std_logic;
			en_reg2_coeff_h	:	out		std_logic;
			en_reg3_ab_h	:	out		std_logic;
			en_reg3_coeff_h	:	out		std_logic;
			en_reg4_ab_h	:	out		std_logic;
			en_reg4_coeff_h	:	out		std_logic;
			en_reg5_ab_h	:	out		std_logic;
			en_reg5_coeff_h	:	out		std_logic;
			
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
	
	signal	en_reg0_ab_h	:	std_logic;
	signal	en_reg0_coeff_h	:	std_logic;
	signal	en_reg1_ab_h	:	std_logic;
	signal	en_reg1_coeff_h	:	std_logic;
	signal	en_reg2_ab_h	:	std_logic;
	signal	en_reg2_coeff_h	:	std_logic;
	signal	en_reg3_ab_h	:	std_logic;
	signal	en_reg3_coeff_h	:	std_logic;
	signal	en_reg4_ab_h	:	std_logic;
	signal	en_reg4_coeff_h	:	std_logic;
	signal	en_reg5_ab_h	:	std_logic;
	signal	en_reg5_coeff_h	:	std_logic;
	
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
								
								en_reg0_ab_h	=>	en_reg0_ab_h,
								en_reg0_coeff_h	=>	en_reg0_coeff_h,
								en_reg1_ab_h	=>	en_reg1_ab_h,
								en_reg1_coeff_h	=>	en_reg1_coeff_h,
								en_reg2_ab_h	=>	en_reg2_ab_h,
								en_reg2_coeff_h	=>	en_reg2_coeff_h,
								en_reg3_ab_h	=>	en_reg3_ab_h,
								en_reg3_coeff_h	=>	en_reg3_coeff_h,
								en_reg4_ab_h	=>	en_reg4_ab_h,
								en_reg4_coeff_h	=>	en_reg4_coeff_h,
								en_reg5_ab_h	=>	en_reg5_ab_h,
								en_reg5_coeff_h	=>	en_reg5_coeff_h,
								sign_a_0		=>	sign_a_0,
								sign_a_1		=>	sign_a_1,
								sign_a_2		=>	sign_a_2,
								sign_a_3		=>	sign_a_3,
								sign_a_4		=>	sign_a_4,
								sign_a_5		=>	sign_a_5,
								sign_b_0		=>	sign_b_0,
								sign_b_1		=>	sign_b_1,
								sign_b_2		=>	sign_b_2,
								sign_b_3		=>	sign_b_3,
								sign_b_4		=>	sign_b_4,
								sign_b_5		=>	sign_b_5,
								coeff_0			=>	coeff_0,
								coeff_1			=>	coeff_1,
								coeff_2			=>	coeff_2,
								coeff_3			=>	coeff_3,
								coeff_4			=>	coeff_4,
								coeff_5			=>	coeff_5,
								
								cnt5_tc_4		=>	tc_4,
								cnt5_tc_31		=>	tc_31,
								
								bn_out_0		=>	bn_out_0,
								bn_out_1		=>	bn_out_1,
								bn_out_2		=>	bn_out_2,
								bn_out_3		=>	bn_out_3,
								bn_out_4		=>	bn_out_4,
								bn_out_5		=>	bn_out_5
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
								
								en_reg0_ab_h	=>	en_reg0_ab_h,
								en_reg0_coeff_h	=>	en_reg0_coeff_h,
								en_reg1_ab_h	=>	en_reg1_ab_h,
								en_reg1_coeff_h	=>	en_reg1_coeff_h,
								en_reg2_ab_h	=>	en_reg2_ab_h,
								en_reg2_coeff_h	=>	en_reg2_coeff_h,
								en_reg3_ab_h	=>	en_reg3_ab_h,
								en_reg3_coeff_h	=>	en_reg3_coeff_h,
								en_reg4_ab_h	=>	en_reg4_ab_h,
								en_reg4_coeff_h	=>	en_reg4_coeff_h,
								en_reg5_ab_h	=>	en_reg5_ab_h,
								en_reg5_coeff_h	=>	en_reg5_coeff_h,
								
								rfint_ctrl_sh_h	=>	rfint_ctrl_sh_h,
								
								rfint_en_h		=>	rfint_en_h,
								
								rst_reg_l		=>	rst_reg_l
							);
	
end structure;