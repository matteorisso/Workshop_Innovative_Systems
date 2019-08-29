library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all ; -- for uniform, trunc

use work.dadda_func.all;

entity tb_dadda is

end tb_dadda;

architecture test of tb_dadda is

component dadda is
	port(
		a	:	in 	std_logic_vector(7 	downto 0);
		b 	:	in 	std_logic_vector(7 	downto 0);
		res	: 	out std_logic_vector(15	downto 0)
	);
end component;

signal tb_a 		: std_logic_vector(7	downto 0);
signal tb_b 		: std_logic_vector(7	downto 0);
signal tb_res 		: std_logic_vector(15 	downto 0);

signal tb_a_s 		: signed(7	downto 0);
signal tb_b_s 		: signed(7	downto 0);

begin

	dut : dadda
		port map(
			a 	=> tb_a,
			b 	=> tb_b,
			res	=> tb_res
		);
	
	random: process
	
	  variable	seed1		:	positive;
	  variable	seed2		:	positive;

	  variable	rand_1		: 	real;
	  variable 	rand_2		: 	real;

	  variable	int_rand_1	: 	integer;
	  variable 	int_rand_2	: 	integer;

	  variable	prod		: 	signed(15 downto 0);

	begin
	
	  tb_a    <= std_logic_vector(to_signed(0, tb_a_s'length));
	  tb_b    <= std_logic_vector(to_signed(0, tb_b_s'length));
	  wait for 5 ns;


	  for i in 1 to 5 loop
		-- random number generation
		uniform(seed1, seed2, rand_1);
		uniform(seed1, seed2, rand_2);

		int_rand_1	:= integer(trunc(rand_1*256.0 - 129.0)); -- 2^16 and (2^16)/2 + 1 
		int_rand_2 	:= integer(trunc(rand_2*256.0 - 129.0));

		tb_a    	<= std_logic_vector(to_signed(int_rand_1, tb_a_s'length));
		tb_b    	<= std_logic_vector(to_signed(int_rand_2, tb_b_s'length));

		-- reference architecture
		prod	:= signed(tb_a) * signed(tb_b);

		-- assert
		assert (tb_res = std_logic_vector(prod)) report "there is a bug." severity warning;  -- nothing is written if the sum is correct 
		wait for 5 ns;
	  end loop;

	  wait;

	end process;
	
	-- process 
	-- begin
		-- tb_a <= "11000110";
		-- tb_b <= "00100010";
		-- wait for 1 ns;
		-- tb_a <= "11000110";
		-- tb_b <= "00000000";
		-- wait for 1 ns;
		-- tb_a <= "00000000";
		-- tb_b <= "00000000";
		-- wait for 1 ns;
		-- tb_a <= "11000110";
		-- tb_b <= "11111111";
		-- wait for 1 ns;
		-- tb_a <= "11111111";
		-- tb_b <= "11111111";
		-- wait for 1 ns;
		-- tb_a <= "00000001";
		-- tb_b <= "00000001";
		-- wait for 1 ns;
		-- tb_a <= "11000110";
		-- tb_b <= "11000110";
		-- wait for 1 ns;
		-- tb_a <= "00100010";
		-- tb_b <= "00100010";
		-- wait for 1 ns;
		-- tb_a <= "11111110";
		-- tb_b <= "11111110";
		-- wait for 1 ns;
		-- tb_a <= "10010000";
		-- tb_b <= "10010000";
		-- wait;
	-- end process;
	
end test;








