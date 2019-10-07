library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity tb_softmax is

end tb_softmax;

architecture test of tb_softmax is

	component softmax is
		port(
			reset	:	in	std_logic;
			clk		:	in	std_logic;
			start	:	in	std_logic;
			en_clk	: 	in	std_logic;
			d_in_0 	: 	in 	std_logic_vector(7 downto 0);
			d_in_1 	: 	in 	std_logic_vector(7 downto 0);
			d_in_2 	: 	in 	std_logic_vector(7 downto 0);
			d_in_3 	: 	in 	std_logic_vector(7 downto 0);
			d_in_4 	: 	in 	std_logic_vector(7 downto 0);
			d_in_5 	: 	in 	std_logic_vector(7 downto 0);
			d_in_6 	: 	in 	std_logic_vector(7 downto 0);
			d_in_7 	: 	in 	std_logic_vector(7 downto 0);
			d_in_8 	: 	in 	std_logic_vector(7 downto 0);
			d_in_9 	: 	in 	std_logic_vector(7 downto 0);
			two_pow	: 	out std_logic_vector(7 downto 0)
		);
	end component;

	signal tb_reset		:	std_logic;
	signal tb_clk		:	std_logic;
	signal tb_start		:	std_logic;
	signal tb_en_clk	:	std_logic;
	
	signal tb_d_in_0	:	std_logic_vector(7	downto	0);
	signal tb_d_in_1	:	std_logic_vector(7	downto	0);
	signal tb_d_in_2	:	std_logic_vector(7	downto	0);
	signal tb_d_in_3	:	std_logic_vector(7	downto	0);
	signal tb_d_in_4	:	std_logic_vector(7	downto	0);
	signal tb_d_in_5	:	std_logic_vector(7	downto	0);
	signal tb_d_in_6	:	std_logic_vector(7	downto	0);
	signal tb_d_in_7	:	std_logic_vector(7	downto	0);
	signal tb_d_in_8	:	std_logic_vector(7	downto	0);
	signal tb_d_in_9	:	std_logic_vector(7	downto	0);
	
	signal tb_two_pow	: 	std_logic_vector(7 	downto 	0);
	
begin

	dut : softmax
		port map(
			reset	=>	tb_reset,
			clk		=>	tb_clk,
			start	=>	tb_start,
			en_clk	=>	tb_en_clk,
			d_in_0 	=>	tb_d_in_0,
			d_in_1 	=>	tb_d_in_1,
			d_in_2 	=>	tb_d_in_2,
			d_in_3 	=>	tb_d_in_3,
			d_in_4  =>	tb_d_in_4,
			d_in_5 	=>	tb_d_in_5,
			d_in_6  =>	tb_d_in_6,
			d_in_7 	=>	tb_d_in_7,
			d_in_8 	=>	tb_d_in_8,
			d_in_9 	=>	tb_d_in_9,
			two_pow	=>	tb_two_pow
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
		tb_en_clk	<=	'1';

		wait for 6 ns;
		
		tb_start	<=	'1';
		tb_d_in_0	<=	"00000110";
		tb_d_in_1	<=	"11110000";
		tb_d_in_2	<=	"11111000";
		tb_d_in_3	<=	"00000000";
		tb_d_in_4	<=	"11110100";
		tb_d_in_5	<=	"11110010";
		tb_d_in_6	<=	"11101000";
		tb_d_in_7	<=	"00110110";
		tb_d_in_8	<=	"11110100";
		tb_d_in_9	<=	"00010010";
		
		
		wait for 2 ns;
		
		tb_start	<=	'0';
		
		
		
		wait;
	end process;
	
end test;








