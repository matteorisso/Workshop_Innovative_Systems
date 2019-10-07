library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity tb_conv_unit is

end tb_conv_unit;

architecture test of tb_conv_unit is

	component conv_unit is
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
			coeff_0	:	in	std_logic_vector(5	downto	0);
			coeff_1	:	in	std_logic_vector(5	downto	0);
			coeff_2	:	in	std_logic_vector(5	downto	0);
			coeff_3	:	in	std_logic_vector(5	downto	0);
			coeff_4 :	in	std_logic_vector(5	downto	0);
			coeff_5	:	in	std_logic_vector(5	downto	0);
		
			bn_out_0: 	out std_logic;
			bn_out_1: 	out std_logic;
			bn_out_2: 	out	std_logic;
			bn_out_3: 	out	std_logic;
			bn_out_4: 	out std_logic;
			bn_out_5: 	out std_logic
		);
	end component;

	signal tb_reset		:	std_logic;
	signal tb_clk		:	std_logic;
	signal tb_start		:	std_logic;
	signal tb_done		:	std_logic;
	signal tb_en_clk	:	std_logic;
	
	signal tb_rf_in		:	std_logic_vector(0	to		83);
	signal tb_spw0_in	:	std_logic_vector(4	downto	0);
	signal tb_spw1_in	:	std_logic_vector(4	downto	0);
	signal tb_spw2_in	:	std_logic_vector(4	downto	0);
	signal tb_spw3_in	:	std_logic_vector(4	downto	0);
	signal tb_spw4_in	:	std_logic_vector(4	downto	0);
	signal tb_spw5_in	:	std_logic_vector(4	downto	0);
	
	signal tb_sign_a_0	:	std_logic;
	signal tb_sign_a_1	:	std_logic;
	signal tb_sign_a_2	:	std_logic;
	signal tb_sign_a_3	:	std_logic;
	signal tb_sign_a_4	:	std_logic;
	signal tb_sign_a_5	:	std_logic;
	signal tb_sign_b_0	:	std_logic;
	signal tb_sign_b_1	:	std_logic;
	signal tb_sign_b_2	:	std_logic;
	signal tb_sign_b_3	:	std_logic;
	signal tb_sign_b_4	:	std_logic;
	signal tb_sign_b_5	:	std_logic;
	signal tb_coeff_0	:	std_logic_vector(5	downto	0);
	signal tb_coeff_1	:	std_logic_vector(5	downto	0);
	signal tb_coeff_2	:	std_logic_vector(5	downto	0);
	signal tb_coeff_3	:	std_logic_vector(5	downto	0);
	signal tb_coeff_4 	:	std_logic_vector(5	downto	0);
	signal tb_coeff_5	:	std_logic_vector(5	downto	0);
	
	signal tb_bn_out_0	:	std_logic;
	signal tb_bn_out_1	:	std_logic;
	signal tb_bn_out_2	:	std_logic;
	signal tb_bn_out_3	:	std_logic;
	signal tb_bn_out_4	:	std_logic;
	signal tb_bn_out_5	:	std_logic;

begin

	dut : conv_unit
		port map(
			reset	=>	tb_reset,
			clk		=>	tb_clk,
			start	=>	tb_start,
			done	=>	tb_done,
			en_clk	=>	tb_en_clk,
			
			rf_in	=>	tb_rf_in,
			spw0_in	=>	tb_spw0_in,
			spw1_in	=>	tb_spw1_in,
			spw2_in	=>	tb_spw2_in,
			spw3_in	=>	tb_spw3_in,
			spw4_in	=>	tb_spw4_in,
			spw5_in	=>	tb_spw5_in,
			
			sign_a_0=>	tb_sign_a_0,
			sign_a_1=>	tb_sign_a_1,
			sign_a_2=>	tb_sign_a_2,
			sign_a_3=>	tb_sign_a_3,
			sign_a_4=>	tb_sign_a_4,
			sign_a_5=>	tb_sign_a_5,
			sign_b_0=>	tb_sign_b_0,
			sign_b_1=>	tb_sign_b_1,
			sign_b_2=>	tb_sign_b_2,
			sign_b_3=>	tb_sign_b_3,
			sign_b_4=>	tb_sign_b_4,
			sign_b_5=>	tb_sign_b_5,
			coeff_0	=>	tb_coeff_0,
			coeff_1	=>	tb_coeff_1,
			coeff_2	=>	tb_coeff_2,
			coeff_3	=>	tb_coeff_3,
			coeff_4	=>	tb_coeff_4,
			coeff_5	=>	tb_coeff_5,
			
			bn_out_0=>	tb_bn_out_0,
			bn_out_1=>	tb_bn_out_1,
			bn_out_2=>	tb_bn_out_2,
			bn_out_3=>	tb_bn_out_3,
			bn_out_4=>	tb_bn_out_4,
			bn_out_5=>	tb_bn_out_5
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
		tb_rf_in	<=	(others	=> '1');
		tb_spw0_in	<=	(others	=> '1');
		tb_spw1_in	<=	(others	=> '1');
		tb_spw2_in	<=	(others	=> '1');
		tb_spw3_in	<=	(others	=> '1');
		tb_spw4_in	<=	(others	=> '1');
		tb_spw5_in	<=	(others	=> '1');
		
		wait for 6 ns;
		
		tb_start	<=	'1';
		
		wait for 2 ns;
		
		tb_start	<=	'0';
		
		wait for 1 ns;
		
	-- kernel 0
	--	01000 
	--	10000
	--	11100
	--	11111
	--	11110
	
	-- kernel 1
	-- 10000
	-- 10001
	-- 10011
	-- 00001
	-- 00011
	
	
	-- kernel 2
	-- 11001
	-- 10001
	-- 00000
	-- 00000
	-- 00001

	
	-- kernel 3
	-- 10010
	-- 00001
	-- 00000
	-- 00001
	-- 11111

	
	-- kernel 4
	-- 10000
	-- 11111
	-- 11111
	-- 10111
	-- 00001

	
	-- kernel 5
	-- 11111
	-- 11101
	-- 00001
	-- 00000
	-- 00000
	
		--load I5+I0 and row 0 of each filters.
		tb_rf_in(52	to		83)	<=	(others	=> '0'); --I0
		--tb_rf_in(52	to		83)	<=	"10101010111111000001100110000100";
		tb_rf_in(20	to		51)	<=	(others	=> '0'); --I5
		tb_rf_in(0	to		19)	<=	(others	=> '0'); 
		tb_spw0_in				<=	"01000";
		tb_spw1_in				<=	"10000";
		tb_spw2_in				<=	"11001";
		tb_spw3_in				<=	"10010";
		tb_spw4_in				<=	"10000";
		tb_spw5_in				<=	"11111";
		
		tb_sign_a_0				<=	'1';
		tb_sign_b_0				<=	'0';
		tb_coeff_0				<=	"000001";
		
		wait for 2 ns;
		--load I6+I1 and row 1 of each filters.
		tb_rf_in(52	to		83)	<=	(others	=> '0'); --I1
		tb_rf_in(20	to		51)	<=	(others	=> '0'); --I6
		tb_rf_in(0	to		19)	<=	(others	=> '0'); 
		tb_spw0_in				<=	"10000";
		tb_spw1_in				<=	"10001";
		tb_spw2_in				<=	"10001";
		tb_spw3_in				<=	"00001";
		tb_spw4_in				<=	"11111";
		tb_spw5_in				<=	"11101";
		
		tb_sign_a_1				<=	'1';
		tb_sign_b_1				<=	'1';
		tb_coeff_1				<=	"000000";
		
		wait for 2 ns;
		--load I7+I2 and row 2 of each filters.
		tb_rf_in(52	to		83)	<=	(others	=> '0'); --I2
		tb_rf_in(20	to		51)	<=	(others	=> '0'); --I7
		tb_rf_in(0	to		19)	<=	(others	=> '0'); 
		tb_spw0_in				<=	"11100";
		tb_spw1_in				<=	"10011";
		tb_spw2_in				<=	"00000";
		tb_spw3_in				<=	"00000";
		tb_spw4_in				<=	"11111";
		tb_spw5_in				<=	"00001";
		
		tb_sign_a_2				<=	'1';
		tb_sign_b_2				<=	'1';
		tb_coeff_2				<=	"111011";
		
		wait for 2 ns;
		--load I8+I3 and row 3 of each filters.
		tb_rf_in(52	to		83)	<=	(others	=> '0'); --I3
		tb_rf_in(20	to		51)	<=	(others	=> '0'); --I8
		tb_rf_in(0	to		19)	<=	(others	=> '0'); 
		tb_spw0_in				<=	"11111";
		tb_spw1_in				<=	"00001";
		tb_spw2_in				<=	"00000";
		tb_spw3_in				<=	"00001";
		tb_spw4_in				<=	"10111";
		tb_spw5_in				<=	"00000";
		
		tb_sign_a_3				<=	'1';
		tb_sign_b_3				<=	'1';
		tb_coeff_3				<=	"111101";
		
		wait for 2 ns;
		--load I9+I4 and row 4 of each filters.
		tb_rf_in(52	to		83)	<=	(others	=> '0'); --I4
		tb_rf_in(20	to		51)	<=	"00000000111111000000000000000000"; --I9
		tb_rf_in(0	to		19)	<=	(others	=> '0'); 
		tb_spw0_in				<=	"11110";
		tb_spw1_in				<=	"00011";
		tb_spw2_in				<=	"00001";
		tb_spw3_in				<=	"11111";
		tb_spw4_in				<=	"00001";
		tb_spw5_in				<=	"00000";
		
		tb_sign_a_4				<=	'1';
		tb_sign_b_4				<=	'0';
		tb_coeff_4				<=	"000001";
		
		wait for 2 ns;
		tb_sign_a_5				<=	'1';
		tb_sign_b_5				<=	'1';
		tb_coeff_5				<=	"000000";
		
		wait for 382 ns;
		--load I15+I10.
		tb_rf_in(52	to		83)	<=	"00000000111111111111111100000000"; --I10
		tb_rf_in(20	to		51)	<=	"00000000000000000001111000000000"; --I15
		tb_rf_in(0	to		19)	<=	(others	=> '0'); 
		
		wait for 56 ns;
		--load I16+I11.
		tb_rf_in(52	to		83)	<=	"00000000111111111111111100000000"; --I11
		tb_rf_in(20	to		51)	<=	"00000000000000000011110000000000"; --I16
		tb_rf_in(0	to		19)	<=	(others	=> '0'); 
		
		
		wait;
	end process;
	
end test;








