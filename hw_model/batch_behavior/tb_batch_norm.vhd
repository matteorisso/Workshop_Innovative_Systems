library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	
	use work.param.all;

entity tb_batch_norm is

end tb_batch_norm;

architecture test of tb_batch_norm is

component batch_norm is
	port(
		clk			:	in	std_logic;
		reset		:	in	std_logic;
		ld_coeff_h	:	in	std_logic;
		act_ready_h	:	in	std_logic;
		act			:	in 	std_logic_vector((N+G-1)	downto 0);
		coeff		:	in	std_logic_vector(15	downto 0);
		res			: 	out std_logic_vector((N-1) 	downto 0)
	);
end component;

signal	tb_reset		:	std_logic;
signal	tb_ld_coeff_h	:	std_logic;
signal	tb_act_ready_h	:	std_logic;
signal	tb_clk			:	std_logic;
signal	tb_act			:	std_logic_vector((N+G-1)	downto 0);
signal	tb_coeff		:	std_logic_vector(15			downto 0);
signal	tb_res			:	std_logic_vector((N-1) 		downto 0);

begin

	dut : batch_norm
		port map(
			reset		=>	tb_reset,
			ld_coeff_h	=>	tb_ld_coeff_h,
			act_ready_h	=>	tb_act_ready_h,
			clk			=>	tb_clk,
			act			=>	tb_act,
			coeff		=>	tb_coeff,
			res			=>	tb_res
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
		--a&b
		tb_coeff		<=	"00010110"&"00010111"; --A_1[0]&B_1[0]
		tb_ld_coeff_h	<=	'0';
		wait for 4 ns;
		tb_act_ready_h	<=	'1';
		wait for 2 ns;
		--1st act
		wait for 0.1 ns;
		tb_act			<=	"00000000000"; --C1[0,0,0]
		wait for 2 ns;
		--2nd act
		tb_act			<=	"00000100000"; --C1[14,14,0]
		wait for 2 ns;
		--3rd act
		tb_act			<=	"11111101000"; --C1[27,13,0]
		wait for 2 ns;
		--4th act
		tb_act			<=	"00001001000"; --C1[22,12,0]
		wait for 2 ns;
		--5th act
		tb_act			<=	"11111010000"; --C1[10,8,0]
		wait for 2 ns;
		tb_act			<=	"11111101010"; --C1[10,8,0]
		tb_act_ready_h	<=	'0';
		wait for 2 ns;
		
		-- wait for 10 ns;
		-- tb_act_ready_h	<=	'0';
		-- wait for 2 ns;
		-- tb_ld_coeff_h	<=	'1';
		-- wait for 2 ns;
		-- tb_ld_coeff_h	<=	'0';
		-- wait for 6 ns;
		-- tb_act_ready_h	<=	'1';
		-- wait for 2 ns;
		-- tb_act_ready_h	<=	'0';
		wait;
	end process;
	
end test;








