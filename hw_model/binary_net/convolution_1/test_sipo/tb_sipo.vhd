library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	
entity tb_sipo_reg is

end tb_sipo_reg;

architecture test of tb_sipo_reg is

	component sipo_reg is
		port(
			en_clk	: in	std_logic;
			clk		: in 	std_logic;
			en_h	: in 	std_logic;
			rst_l 	: in 	std_logic;
			d_in 	: in 	std_logic;
			d_out 	: out 	std_logic_vector(4 downto 0)
		);
	end component;


	signal	tb_en_clk		:	std_logic;
	signal	tb_clk			:	std_logic;
	signal	tb_en_h			:  	std_logic;
	signal	tb_rst_l		:  	std_logic;
	signal	tb_d_in			:  	std_logic;
	signal	tb_d_out 		:  	std_logic_vector(4 downto 0);

begin

	dut : sipo_reg
		port map(
			en_clk	=>	tb_en_clk,
			clk		=>	tb_clk,
			en_h	=>	tb_en_h,
			rst_l	=>	tb_rst_l,
			d_in 	=>	tb_d_in,
			d_out	=>	tb_d_out
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
		wait for 2 ns;
		tb_rst_l <= '1';
		wait;
	end process;
	
	process 
	begin
		
		tb_en_clk	<= '1';
		tb_en_h		<= '1';
		wait for 2 ns;
		tb_d_in		<= '1';
		wait for 2 ns;
		tb_d_in		<= '1';
		wait for 2 ns;
		tb_d_in		<= '1';
		wait for 2 ns;
		tb_d_in		<= '1';
		wait for 2 ns;
		tb_d_in		<= '1';
		wait for 2 ns;
		tb_d_in		<= '0';
	
	
		wait;
	end process;
	
end test;