-- 2 bit Serial In - Parallel Out register.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity sipo_reg is

	port(
		en_clk	: in	std_logic;
		clk		: in 	std_logic;
		en_h	: in 	std_logic;
		rst_l 	: in 	std_logic;
		d_in 	: in 	std_logic;
		d_out 	: out 	std_logic_vector(1 downto 0)
	);
	
end sipo_reg;

architecture structure of sipo_reg is
	
	signal tmp	:	std_logic_vector(1	downto	0);
	
begin
	
	sipo_process : process(clk, en_clk)
	begin
		if clk'event and clk = '1' and en_clk = '1' then
			if rst_l = '0' then
				tmp <= (others => '1');
			elsif en_h = '1' then
				tmp(0) <= d_in;
				tmp(1) <= tmp(0);
			end if;
		end if;
	end process;
	
	d_out	<=	tmp;
	
end structure;