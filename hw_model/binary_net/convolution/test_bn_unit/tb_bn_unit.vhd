library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	
entity tb_bn_unit is

end tb_bn_unit;

architecture test of tb_bn_unit is

	component bn_unit is
		port(
			en_clk		: 	in	std_logic;
			clk			:	in	std_logic;
			rst_l		:	in	std_logic;
			en_h		:	in	std_logic;
			sign_a 		: 	in 	std_logic;
			sign_b		: 	in 	std_logic;
			conv_out	: 	in 	std_logic_vector(9 downto 0);
			coefficient	: 	in 	std_logic_vector(9 downto 0);
			bn_out 		: 	out std_logic
		);
	end component;


	signal	tb_en_clk		:	std_logic;
	signal	tb_clk			:	std_logic;
	signal	tb_en_h			:  	std_logic;
	signal	tb_rst_l		:  	std_logic;
	signal	tb_sign_a		:	std_logic;
	signal	tb_sign_b		:  	std_logic;
	signal	tb_bn_out		:  	std_logic;
	signal	tb_conv_out		:  	std_logic_vector(9 downto 0);
	signal	tb_coefficient	:  	std_logic_vector(9 downto 0);

begin

	dut : bn_unit
		port map(
			en_clk		=>	tb_en_clk,
			clk			=>	tb_clk,
			rst_l		=>	tb_rst_l,
			en_h		=>	tb_en_h,
			sign_a 		=>	tb_sign_a,
			sign_b		=>	tb_sign_b,
			conv_out	=>	tb_conv_out,
			coefficient	=>	tb_coefficient,
			bn_out 		=>	tb_bn_out
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
		
		tb_en_clk		<= '1';
		tb_en_h			<= '1';
		
		tb_sign_a		<= '1';
		tb_sign_b		<= '0';
		
		wait for 2 ns;
		
		tb_conv_out		<=	"0000011000"; --24
		tb_coefficient	<=	"0000011010"; --25+1
		
		wait for 2 ns;
		
		tb_conv_out		<=	"0000011010"; --26
		tb_coefficient	<=	"0000011010"; --25+1
		
		wait;
	end process;
	
end test;