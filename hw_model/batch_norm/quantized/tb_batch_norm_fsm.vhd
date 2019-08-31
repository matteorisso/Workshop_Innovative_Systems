library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity tb_batch_norm_fsm is

end tb_batch_norm_fsm;

architecture test of tb_batch_norm_fsm is

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

signal	tb_reset		:	std_logic;
signal	tb_ld_coeff_h	:	std_logic;
signal	tb_act_ready_h	:	std_logic;
signal	tb_clk			:	std_logic;
signal	tb_en_reg_a_h	:	std_logic;
signal	tb_en_reg_act_h	:	std_logic;
signal	tb_en_reg_b_h	:	std_logic;
signal	tb_en_reg_mul_h	:	std_logic;
signal	tb_en_reg_sum_h	:	std_logic;
signal	tb_rst_reg_l	:	std_logic;
signal	tb_en_mul		:	std_logic;
signal	tb_en_sum		:	std_logic;

begin

	dut : batch_norm_fsm
		port map(
			reset		=>	tb_reset,
			ld_coeff_h	=>	tb_ld_coeff_h,
			act_ready_h	=>	tb_act_ready_h,
			clk			=>	tb_clk,
			en_reg_a_h	=>	tb_en_reg_a_h,
			en_reg_act_h=>	tb_en_reg_act_h,
			en_reg_b_h	=>	tb_en_reg_b_h,
			en_reg_mul_h=>	tb_en_reg_mul_h,
			en_reg_sum_h=>	tb_en_reg_sum_h,
			rst_reg_l	=>	tb_rst_reg_l,
			en_mul		=>	tb_en_mul,
			en_sum		=>	tb_en_sum
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
		tb_reset <= '1';
		wait for 4 ns;
		tb_reset <= '0';
		wait;
	end process;
	
	process 
	begin
		tb_ld_coeff_h	<=	'0';
		tb_act_ready_h	<=	'0';
		wait for 6 ns;
		tb_ld_coeff_h	<=	'1';
		wait for 2 ns;
		tb_ld_coeff_h	<=	'0';
		wait for 6 ns;
		tb_act_ready_h	<=	'1';
		wait for 10 ns;
		tb_act_ready_h	<=	'0';
		wait for 10 ns;
		tb_ld_coeff_h	<=	'1';
		wait for 2 ns;
		tb_ld_coeff_h	<=	'0';
		wait for 6 ns;
		tb_act_ready_h	<=	'1';
		wait for 2 ns;
		tb_act_ready_h	<=	'0';
		wait;
	end process;
	
end test;








