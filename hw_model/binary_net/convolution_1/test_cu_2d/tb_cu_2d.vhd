library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	
entity tb_cu_2d is

end tb_cu_2d;

architecture test of tb_cu_2d is

	component cu_2d is
		port(
			ifmap_0		: in 	std_logic_vector(4 downto 0);
			ifmap_1		: in 	std_logic_vector(4 downto 0);
			ifmap_2		: in 	std_logic_vector(4 downto 0);
			ifmap_3		: in 	std_logic_vector(4 downto 0);
			ifmap_4 	: in 	std_logic_vector(4 downto 0);
			weights_0	: in 	std_logic_vector(4 downto 0);
			weights_1	: in 	std_logic_vector(4 downto 0);
			weights_2	: in 	std_logic_vector(4 downto 0);
			weights_3	: in 	std_logic_vector(4 downto 0);
			weights_4	: in 	std_logic_vector(4 downto 0);
			ofmap 		: out 	std_logic_vector(5 downto 0)
		);
	end component;


	signal	tb_ifmap_0		:	std_logic_vector(4 downto 0);
	signal	tb_ifmap_1		:	std_logic_vector(4 downto 0);
	signal	tb_ifmap_2		:  	std_logic_vector(4 downto 0);
	signal	tb_ifmap_3		:  	std_logic_vector(4 downto 0);
	signal	tb_ifmap_4 		:  	std_logic_vector(4 downto 0);
	signal	tb_weights_0	:  	std_logic_vector(4 downto 0);
	signal	tb_weights_1	:  	std_logic_vector(4 downto 0);
	signal	tb_weights_2	:  	std_logic_vector(4 downto 0);
	signal	tb_weights_3	:  	std_logic_vector(4 downto 0);
	signal	tb_weights_4	:  	std_logic_vector(4 downto 0);
	signal	tb_ofmap 		:  	std_logic_vector(5 downto 0);

begin

	dut : cu_2d
		port map(
			ifmap_0		=>	tb_ifmap_0,
			ifmap_1		=>	tb_ifmap_1,
			ifmap_2		=>	tb_ifmap_2,
			ifmap_3		=>	tb_ifmap_3,
			ifmap_4 	=>	tb_ifmap_4,
			weights_0	=>	tb_weights_0,
			weights_1	=>	tb_weights_1,
			weights_2	=>	tb_weights_2,
			weights_3	=>	tb_weights_3,
			weights_4	=>	tb_weights_4,
			ofmap 		=>	tb_ofmap
		);
	
	
	process 
	begin
		
		-- convolutional window row : (0-4; column : 0-4).
		-- expected result 24.
		tb_ifmap_0		<=	"00000";
		tb_ifmap_1		<=	"00000";
		tb_ifmap_2		<=	"00000";
		tb_ifmap_3		<=	"00000";
		tb_ifmap_4 		<=	"00000";
		tb_weights_0	<=	"01111";
		tb_weights_1	<=	"11111";
		tb_weights_2	<=	"01111";
		tb_weights_3	<=	"00000";
		tb_weights_4	<=	"00000";
		
		wait for 1 ns;
		
		-- convolutional window row : (9-13; column : 7-11).
		-- expected result 48.
		tb_ifmap_0		<=	"01111";
		tb_ifmap_1		<=	"01111";
		tb_ifmap_2		<=	"01111";
		tb_ifmap_3		<=	"00000";
		tb_ifmap_4 		<=	"00000";
		tb_weights_0	<=	"01111";
		tb_weights_1	<=	"11111";
		tb_weights_2	<=	"01111";
		tb_weights_3	<=	"00000";
		tb_weights_4	<=	"00000";
		
		
		
	
		wait;
	end process;
	
end test;