library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all ; -- for uniform, trunc

entity tb_batch_norm_pe is

end tb_batch_norm_pe;

architecture test of tb_batch_norm_pe is

component batch_norm_pe is
	port(
		clk		:	in	std_logic;
		en_h	:	in	std_logic;
		rst_l	:	in	std_logic;
		act		:	in 	std_logic_vector(7 	downto 0);
		a		:	in	std_logic_vector(7 	downto 0);
		b 		:	in 	std_logic_vector(7 	downto 0);
		res		: 	out std_logic_vector(16 downto 0)
		);
end component;

signal tb_clk		:	std_logic;
signal tb_en_h		:	std_logic;
signal tb_rst_l		:	std_logic;

signal tb_act 		:	std_logic_vector(7	downto 0);
signal tb_a 		: 	std_logic_vector(7	downto 0);
signal tb_b 		: 	std_logic_vector(7	downto 0);
signal tb_res 		: 	std_logic_vector(16 downto 0);

signal tb_a_s 		: 	signed(7 downto 0);
signal tb_b_s 		: 	signed(7 downto 0);

begin

	dut : batch_norm_pe
		port map(
			clk		=>	tb_clk,
			en_h	=>	tb_en_h,
			rst_l	=>	tb_rst_l,
			act		=>	tb_act,
			a 		=> 	tb_a,
			b 		=> 	tb_b,
			res		=> 	tb_res
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
		tb_rst_l <= '0';
		wait for 4 ns;
		tb_rst_l <= '1';
		wait;
	end process;
	
	
	
	process 
	begin
	  tb_en_h <= '1';
		tb_a 	<= "00010001";
		tb_b 	<= "01111111";
		tb_act	<= "10101100";
		wait;
	end process;
	
end test;








