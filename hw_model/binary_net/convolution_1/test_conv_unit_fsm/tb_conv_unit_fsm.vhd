library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity tb_conv_unit_fsm is

end tb_conv_unit_fsm;

architecture test of tb_conv_unit_fsm is

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

	signal tb_reset				:		std_logic;
	signal tb_clk				:		std_logic;
	signal tb_start				:		std_logic;
	signal tb_done				:		std_logic;
	
	signal tb_tc_4				:		std_logic;
	signal tb_tc_31				:		std_logic;
	signal tb_uph_dnl			:		std_logic;
	
	signal tb_cnt5_en_h			:		std_logic;
	
	signal tb_sbpg_ctrl_inc		:		std_logic;
	
	signal tb_rf_ctrl_inc_h		:		std_logic;
	
	signal tb_spw0_en_0_h		: 	 	std_logic;
	signal tb_spw0_en_1_h		: 	 	std_logic;
	signal tb_spw0_en_2_h		: 	 	std_logic;
	signal tb_spw0_en_3_h		: 	 	std_logic;
	signal tb_spw0_en_4_h		: 	 	std_logic;
	
	signal tb_spw1_en_0_h		: 	 	std_logic;
	signal tb_spw1_en_1_h		: 	 	std_logic;
	signal tb_spw1_en_2_h		: 	 	std_logic;
	signal tb_spw1_en_3_h		: 	 	std_logic;
	signal tb_spw1_en_4_h		: 	 	std_logic;
	
	signal tb_spw2_en_0_h		: 	 	std_logic;
	signal tb_spw2_en_1_h		: 	 	std_logic;
	signal tb_spw2_en_2_h		: 	 	std_logic;
	signal tb_spw2_en_3_h		: 	 	std_logic;
	signal tb_spw2_en_4_h		: 	 	std_logic;
	
	signal tb_spw3_en_0_h		: 	 	std_logic;
	signal tb_spw3_en_1_h		: 	 	std_logic;
	signal tb_spw3_en_2_h		: 	 	std_logic;
	signal tb_spw3_en_3_h		: 	 	std_logic;
	signal tb_spw3_en_4_h		: 	 	std_logic;
	
	signal tb_spw4_en_0_h		: 	 	std_logic;
	signal tb_spw4_en_1_h		: 	 	std_logic;
	signal tb_spw4_en_2_h		: 	 	std_logic;
	signal tb_spw4_en_3_h		: 	 	std_logic;
	signal tb_spw4_en_4_h		: 	 	std_logic;
	
	signal tb_spw5_en_0_h		: 	 	std_logic;
	signal tb_spw5_en_1_h		: 	 	std_logic;
	signal tb_spw5_en_2_h		: 	 	std_logic;
	signal tb_spw5_en_3_h		: 	 	std_logic;
	signal tb_spw5_en_4_h		: 	 	std_logic;
	
	signal tb_rfint_ctrl_sh_h	:		std_logic;
	
	signal tb_rfint_en_h		:		std_logic;
	
	signal tb_rst_reg_l			:		std_logic;

begin

	dut : conv_unit_fsm
		port map(
			reset			=>	tb_reset,
			clk				=>	tb_clk,
			start			=>	tb_start,
			done			=>	tb_done,
			
			tc_4			=>	tb_tc_4,
			tc_31			=>	tb_tc_31,
			uph_dnl			=>	tb_uph_dnl,
			
			cnt5_en_h		=>	tb_cnt5_en_h,
			
			sbpg_ctrl_inc	=>	tb_sbpg_ctrl_inc,
			
			rf_ctrl_inc_h	=>	tb_rf_ctrl_inc_h,
			
			spw0_en_0_h		=>	tb_spw0_en_0_h,
			spw0_en_1_h		=>	tb_spw0_en_1_h,
			spw0_en_2_h		=>	tb_spw0_en_2_h,
			spw0_en_3_h		=>	tb_spw0_en_3_h,
			spw0_en_4_h		=>	tb_spw0_en_4_h,
			
			spw1_en_0_h		=>	tb_spw1_en_0_h,
			spw1_en_1_h		=>	tb_spw1_en_1_h,
			spw1_en_2_h		=>	tb_spw1_en_2_h,
			spw1_en_3_h		=>	tb_spw1_en_3_h,
			spw1_en_4_h		=>	tb_spw1_en_4_h,
			
			spw2_en_0_h		=>	tb_spw2_en_0_h,
			spw2_en_1_h		=>	tb_spw2_en_1_h,
			spw2_en_2_h		=>	tb_spw2_en_2_h,
			spw2_en_3_h		=>	tb_spw2_en_3_h,
			spw2_en_4_h		=>	tb_spw2_en_4_h,
			
			spw3_en_0_h		=>	tb_spw3_en_0_h,
			spw3_en_1_h		=>	tb_spw3_en_1_h,
			spw3_en_2_h		=>	tb_spw3_en_2_h,
			spw3_en_3_h		=>	tb_spw3_en_3_h,
			spw3_en_4_h		=>	tb_spw3_en_4_h,
			
			spw4_en_0_h		=>	tb_spw4_en_0_h,
			spw4_en_1_h		=>	tb_spw4_en_1_h,
			spw4_en_2_h		=>	tb_spw4_en_2_h,
			spw4_en_3_h		=>	tb_spw4_en_3_h,
			spw4_en_4_h		=>	tb_spw4_en_4_h,
			
			spw5_en_0_h		=>	tb_spw5_en_0_h,
			spw5_en_1_h		=>	tb_spw5_en_1_h,
			spw5_en_2_h		=>	tb_spw5_en_2_h,
			spw5_en_3_h		=>	tb_spw5_en_3_h,
			spw5_en_4_h		=>	tb_spw5_en_4_h,
			
			rfint_ctrl_sh_h	=>	tb_rfint_ctrl_sh_h,
			
			rfint_en_h		=>	tb_rfint_en_h,
			
			rst_reg_l		=>	tb_rst_reg_l
		);
	
	process -- clock generation at 500mhz.
	begin
		tb_clk <= '1';
		wait for 1 ns;
		tb_clk <= '0';
		wait for 1 ns;
	end process;
	
	process -- reset generation 
	begin
		tb_reset <= '0';
		wait for 4 ns;
		tb_reset <= '1';
		wait;
	end process;
	
	process 
	begin
		tb_start	<=	'0';
		tb_done		<=	'0';
		tb_tc_4		<=	'0';
		tb_tc_31	<=	'0';
		tb_uph_dnl	<=	'0';
		
		wait for 6 ns;
		
		tb_start	<=	'1';
		
		wait for 2 ns;
		
		tb_start	<=	'0';
		
		wait for 18 ns;
		
		tb_tc_4		<=	'0';
		
		wait for 8 ns;
		
		tb_tc_4		<=	'1';
		
		wait for 2 ns;
		
		tb_tc_4		<=	'0';
		
		wait for 52 ns;
		
		tb_tc_31	<=	'1';
		tb_uph_dnl	<=	'1';
		
		wait for 2 ns;
		
		tb_tc_31	<=	'0';
		
		wait for 8 ns;
		
		tb_tc_4		<=	'1';
		
		wait for 2 ns;
		
		tb_tc_4		<=	'0';
		
		wait for 52 ns;
		
		tb_tc_31	<=	'1';
		tb_uph_dnl	<=	'0';
		
		wait for 2 ns;
		
		tb_tc_31	<=	'0';
		
		wait for 8 ns;
		
		tb_tc_4		<=	'1';
		
		wait for 2 ns;
		
		tb_tc_4		<=	'0';
		tb_done		<=	'1';
		
		wait for 52 ns;
		
		tb_tc_31	<=	'1';
		tb_uph_dnl	<=	'0';
		
		wait;
	end process;
	
end test;








