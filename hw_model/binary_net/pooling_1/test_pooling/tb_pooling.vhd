library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity tb_pooling is

end tb_pooling;

architecture test of tb_pooling is

	component pooling is
		port(
			reset		:	in	std_logic;
			clk			:	in	std_logic;
			start		:	in	std_logic;
			done		:	in	std_logic;
			en_clk		:	in	std_logic;
			
			d_in		:	in	std_logic_vector(83 downto	0);
			
			d_out 		:  	out	std_logic_vector(6	downto 	0)
		);
	end component;

	signal tb_reset		:	std_logic;
	signal tb_clk		:	std_logic;
	signal tb_start		:	std_logic;
	signal tb_done		:	std_logic;
	signal tb_en_clk	:	std_logic;
	
	signal tb_d_in		:	std_logic_vector(0	to		83);
	
	signal tb_d_out		:	std_logic_vector(6	downto	0);

begin

	dut : pooling
		port map(
			reset	=>	tb_reset,
			clk		=>	tb_clk,
			start	=>	tb_start,
			done	=>	tb_done,
			en_clk	=>	tb_en_clk,
			
			d_in	=>	tb_d_in,
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
		tb_d_in	<=	(others	=> '1');
		
		wait for 6 ns;
		
		tb_start	<=	'1';
		
		wait for 2 ns;
		
		tb_start	<=	'0';
		
		wait for 1 ns;
		tb_d_in(56	to		83)	<=	"0000000000000000000000000000"; --I0
		tb_d_in(28	to		55)	<=	"0000000000000000000000000000"; --I1
		tb_d_in(0	to		27)	<=	"0000000000000000000111110000"; --I10
	
		wait for 2 ns;
		tb_d_in(56	to		83)	<=	"0000000000000000000000000000"; --I2
		tb_d_in(28	to		55)	<=	"0000000000000000000000000000"; --I3
		tb_d_in(0	to		27)	<=	"0000000000000000000111110000"; --I11
		
		wait for 2 ns;
		tb_d_in(56	to		83)	<=	"0000000000000000000000000000"; --I4
		tb_d_in(28	to		55)	<=	"0000001111111100000000000000"; --I5
		tb_d_in(0	to		27)	<=	"0000000000000000001111100000"; --I12
		
		wait for 2 ns;
		tb_d_in(56	to		83)	<=	"0000011111111111111111110000"; --I6
		tb_d_in(28	to		55)	<=	"0000001111111111111111110000"; --I7
		tb_d_in(0	to		27)	<=	"0000000000000000001111100000"; --I13
		
		wait for 2 ns;
		tb_d_in(56	to		83)	<=	"0000000011111111111111110000"; --I8
		tb_d_in(28	to		55)	<=	"0000000000001111111111110000"; --I9
		tb_d_in(0	to		27)	<=	(others	=> '0'); --xx
		
		
		wait for 384 ns;
		--load I15+I10.
		tb_d_in(52	to		83)	<=	"00000000111111111111111100000000"; --I10
		tb_d_in(20	to		51)	<=	"00000000000000000001111000000000"; --I15
		tb_d_in(0	to		19)	<=	(others	=> '0'); 
		
		
		wait;
	end process;
	
end test;








