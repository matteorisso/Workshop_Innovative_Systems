library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity tb_conv_pool_intf is

end tb_conv_pool_intf;

architecture test of tb_conv_pool_intf is

	component conv_pool_intf is
		port(
			d_in 		: 	in 	std_logic_vector(63 downto 0);
			en_clk		: 	in	std_logic;
			clk			: 	in 	std_logic;
			reset		:	in	std_logic;
			start		:	in	std_logic;
			load		:	in	std_logic;
			done		:	in	std_logic;
			
			d_out 		: 	out std_logic_vector(31 downto 0);
			pointer		: 	out std_logic_vector(9 	downto 0)
		);
	end component;

	signal tb_reset		:	std_logic;
	signal tb_clk		:	std_logic;
	signal tb_start		:	std_logic;
	signal tb_load		:	std_logic;
	signal tb_done		:	std_logic;
	signal tb_en_clk	:	std_logic;
	
	signal tb_d_in		:	std_logic_vector(63	downto	0);
	
	signal tb_pointer	:	std_logic_vector(9 	downto 0);
	signal tb_d_out		:	std_logic_vector(31	downto	0);

begin

	dut : conv_pool_intf
		port map(
			reset	=>	tb_reset,
			clk		=>	tb_clk,
			start	=>	tb_start,
			done	=>	tb_done,
			en_clk	=>	tb_en_clk,
			load =>  tb_load,
			d_in	=>	tb_d_in,
			pointer	=>	tb_pointer,
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
		tb_load		<=	'1';
		tb_d_in	<=	(others	=> '1');
		
		wait for 6 ns;
		
		tb_start	<=	'1';
		
		wait for 4 ns;
		
		tb_start	<=	'0';
		tb_d_in(63	downto	48)	<=	"0000000000000000"; --r0
		tb_d_in(47	downto	32)	<=	"0000000000000000"; --r1
		tb_d_in(31	downto	16)	<=	"0000000000000000"; --r2
		tb_d_in(15	downto	0)	<=	"0000000000000000"; --r3
	
		wait for 4 ns;
		
		tb_d_in(63	downto	48)	<=	"0000000000000000"; --r4
		tb_d_in(47	downto	32)	<=	"0000000000000000"; --r5
		tb_d_in(31	downto	16)	<=	"0000000000000000"; --r6
		tb_d_in(15	downto	0)	<=	"0000000000000000"; --r7
		
		wait for 4 ns;
		
		tb_d_in(63	downto	48)	<=	"0000000000000000"; --r8
		tb_d_in(47	downto	32)	<=	"0000000000000000"; --r9
		tb_d_in(31	downto	16)	<=	"0000000000000000"; --r10
		tb_d_in(15	downto	0)	<=	"0000000000000000"; --r11
		
		wait for 4 ns;
		
		tb_d_in(63	downto	48)	<=	"0000000000000000"; --r12
		tb_d_in(47	downto	32)	<=	"0000000000000000"; --r13
		tb_d_in(31	downto	16)	<=	"0000000000000000"; --r14
		tb_d_in(15	downto	0)	<=	"0000000000000000"; --r15
		
		wait for 4 ns;
		
		tb_d_in(63	downto	48)	<=	"0000000000000000"; --r16
		tb_d_in(47	downto	32)	<=	"0000000000000000"; --r17
		tb_d_in(31	downto	16)	<=	"0000000000000000"; --r18
		tb_d_in(15	downto	0)	<=	"0000000000000000"; --r19
		
		wait for 4 ns;
		
		tb_d_in(63	downto	48)	<=	"0000000000000000"; --r20
		tb_d_in(47	downto	32)	<=	"0000000000000000"; --r21
		tb_d_in(31	downto	16)	<=	"0000000000000000"; --r22
		tb_d_in(15	downto	0)	<=	"0000000000000000"; --r23
		
		wait for 4 ns;
		
		tb_d_in(63	downto	48)	<=	"0000000000000000"; --r24
		tb_d_in(47	downto	32)	<=	"0000000000000000"; --r25
		tb_d_in(31	downto	16)	<=	"0000000000000000"; --r26
		tb_d_in(15	downto	0)	<=	"0000000000000000"; --r27
		
		wait for 8 ns;
		
		tb_d_in(63	downto	48)	<=	"0000000000000000"; --r0
		tb_d_in(47	downto	32)	<=	"0000000000000000"; --r1
		tb_d_in(31	downto	16)	<=	"0000000000000000"; --r2
		tb_d_in(15	downto	0)	<=	"0000000000000000"; --r3
		
		wait for 4 ns;
		
		tb_d_in(63	downto	48)	<=	"0000000000000000"; --r0
		tb_d_in(47	downto	32)	<=	"0011011101110111"; --r1
		tb_d_in(31	downto	16)	<=	"0111011101110111"; --r2
		tb_d_in(15	downto	0)	<=	"0111011100110000"; --r3
		
		wait for 4 ns;
		
		tb_d_in(63	downto	48)	<=	"0011000000000000"; --r0
		tb_d_in(47	downto	32)	<=	"0000000000000000"; --r1
		tb_d_in(31	downto	16)	<=	"0000000000000000"; --r2
		tb_d_in(15	downto	0)	<=	"0000000000000000"; --r3
		
		wait for 4 ns;
		
		tb_d_in(63	downto	48)	<=	"0000000000000000"; --r0
		tb_d_in(47	downto	32)	<=	"0000000000000000"; --r1
		tb_d_in(31	downto	16)	<=	"0000000000000000"; --r2
		tb_d_in(15	downto	0)	<=	"0000000000000000"; --r3
		
		wait for 4 ns;
		
		tb_d_in(63	downto	48)	<=	"0000000000000000"; --r0
		tb_d_in(47	downto	32)	<=	"0000000000000000"; --r1
		tb_d_in(31	downto	16)	<=	"0000000000000000"; --r2
		tb_d_in(15	downto	0)	<=	"0000000000000000"; --r3
		
		wait for 4 ns;
		
		tb_d_in(63	downto	48)	<=	"0000000000000000"; --r0
		tb_d_in(47	downto	32)	<=	"0000000000000000"; --r1
		tb_d_in(31	downto	16)	<=	"0000000000000000"; --r2
		tb_d_in(15	downto	0)	<=	"0000000000000000"; --r3
		
		wait for 4 ns;
		
		tb_d_in(63	downto	48)	<=	"0000000000000000"; --r0
		tb_d_in(47	downto	32)	<=	"0000000000000000"; --r1
		tb_d_in(31	downto	16)	<=	"0000000000000000"; --r2
		tb_d_in(15	downto	0)	<=	"0000000000000000"; --r3
		
		--wait for 8 ns;
		
		--tb_done	<=	'1';
		
		wait;
	end process;
	
end test;








