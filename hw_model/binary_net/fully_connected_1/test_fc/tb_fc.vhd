library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity tb_fc is

end tb_fc;

architecture test of tb_fc is

	component fully_connected is
		port(
			en_clk		: 	in	std_logic;
			reset		:	in	std_logic;
			clk			:	in	std_logic;
			start		:	in	std_logic;
			done		:	in	std_logic;
			
			sign_a 		: 	in 	std_logic;
			sign_b		: 	in 	std_logic;
			coefficient	: 	in 	std_logic_vector(9 		downto 0);
			
			act_in 		:	in	std_logic_vector(119 	downto 0);
			weights		: 	in	std_logic_vector(119	downto 0);
			act_out		: 	out std_logic
		);
	end component;

	signal tb_reset		:	std_logic;
	signal tb_clk		:	std_logic;
	signal tb_start		:	std_logic;
	signal tb_done		:	std_logic;
	signal tb_en_clk	:	std_logic;
	
	signal tb_sign_a	:	std_logic;
	signal tb_sign_b	:	std_logic;
	
	signal tb_coeff		:	std_logic_vector(9		downto 0);
	signal tb_act_in	:	std_logic_vector(119	downto 0);
	signal tb_weights	:	std_logic_vector(119	downto 0);
	signal tb_act_out	:	std_logic;

begin

	dut : fully_connected
		port map(
			reset		=>	tb_reset,
			clk			=>	tb_clk,
			start		=>	tb_start,
			done		=>	tb_done,
			en_clk		=>	tb_en_clk,
			
			sign_a 		=>	tb_sign_a,
			sign_b		=>	tb_sign_b,
			coefficient	=>	tb_coeff,
			
			act_in 		=>	tb_act_in,
			weights		=>	tb_weights,
			act_out		=>	tb_act_out
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
		tb_en_clk	<=	'1';
		
		
		wait for 6 ns;
		
		tb_start	<=	'1';
		
		wait for 2 ns;
		
		tb_start	<=	'0';
		tb_act_in	<= "010000011111111111000011001111111010000101101001100101101101100101100010101000001101101011110111100011101011101100101111";
	
		wait for 2 ns;
		
		tb_weights	<= "110101110010101000000001100010111001110110010100011101011011011000001111001110010101111100001100001101110110101101011101";--W[0]
		
		wait for 2 ns;
		
		tb_weights	<= "101110001000000100010110110011011111011100111100010101010111011110110100001010011110011100001010110101010010101001001010";--W[1]
		
		wait for 2 ns;
		
		tb_weights	<= "111011011111110010101010110000000100111100001110000101100001010000001011111111101111010010111110101010111001011001001011";--W[2]
		
		wait for 2 ns;
		
		tb_weights	<= "011100010000010001010001000110011010000100011100100000111001001000111101001111111110011101100110101111001110110011000011";--W[3]
		tb_coeff	<= "0001111010";--C[0]
		
		wait for 2 ns;
		
		tb_weights	<= "011100010000010001010001000110011010000100011100100000111001001000111101001111111110011101100110101111001110110011000011";-- segnaposto
		tb_coeff	<= "0001110110";--C[1]
		tb_sign_a	<= '1';--A[0]
		tb_sign_b	<= '0';--B[0]
		
		wait for 2 ns;
		
		tb_weights	<= "011100010000010001010001000110011010000100011100100000111001001000111101001111111110011101100110101111001110110011000011";-- segnaposto
		tb_coeff	<= "0001111000";--C[2]
		tb_sign_a	<= '1';--A[1]
		tb_sign_b	<= '1';--B[1]
		
		wait for 2 ns;
		
		tb_weights	<= "011100010000010001010001000110011010000100011100100000111001001000111101001111111110011101100110101111001110110011000011";-- segnaposto
		tb_coeff	<= "0001111000";--C[3]
		tb_sign_a	<= '1';--A[2]
		tb_sign_b	<= '1';--B[2]
		
		wait for 2 ns;
		
		tb_weights	<= "011100010000010001010001000110011010000100011100100000111001001000111101001111111110011101100110101111001110110011000011";-- segnaposto
		tb_coeff	<= "0001111000";--segnaposto
		tb_sign_a	<= '1';--A[3]
		tb_sign_b	<= '1';--B[3]
		
		wait;
	end process;
	
end test;








