library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all ; -- for uniform, trunc

use work.wallace_func.all;

entity tb_wallace is

end tb_wallace;

architecture test of tb_wallace is

component wallace is
	port(
		a_in	:	in 	std_logic_vector(12	downto 0);
		b_in 	:	in 	std_logic_vector(12	downto 0);
		result	: 	out std_logic_vector(25	downto 0)
	);
end component;

signal tb_a 		: std_logic_vector(12	downto 0);
signal tb_b 		: std_logic_vector(12	downto 0);
signal tb_res 		: std_logic_vector(25 	downto 0);


signal tb_a_s 		: signed(12	downto 0);
signal tb_b_s 		: signed(12	downto 0);

signal	tb_prod		: 	signed(25 downto 0);

begin

	dut : wallace
		port map(
			a_in 	=> tb_a,
			b_in 	=> tb_b,
			result	=> tb_res
		);
	
	
	random: process
	
	  variable	seed1		:	positive;
	  variable	seed2		:	positive;

	  variable	rand_1		: 	real;
	  variable 	rand_2		: 	real;

	  variable	int_rand_1	: 	integer;
	  variable 	int_rand_2	: 	integer;

	  variable	prod		: 	signed(25 downto 0);

	begin
	
	  tb_a  	<= std_logic_vector(to_signed(0, tb_a_s'length));
	  tb_b  	<= std_logic_vector(to_signed(0, tb_b_s'length));
	  wait for 1 ns;


	  for i in 1 to 500 loop
		-- random number generation
		uniform(seed1, seed2, rand_1);
		uniform(seed1, seed2, rand_2);

		int_rand_1	:= integer(trunc(rand_1*8192.0 - 4097.0));
		int_rand_2 	:= integer(trunc(rand_2*8192.0 - 4097.0));

		tb_a    	<= std_logic_vector(to_signed(int_rand_1, tb_a_s'length));
		tb_b    	<= std_logic_vector(to_signed(int_rand_2, tb_b_s'length));
		
		-- reference architecture
		prod	:= signed(tb_a) * signed(tb_b);
		
		tb_prod <= prod;

		-- assert
		assert (tb_res = std_logic_vector(prod)) report "there is a bug." severity warning;  -- nothing is written if the sum is correct 
		
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








