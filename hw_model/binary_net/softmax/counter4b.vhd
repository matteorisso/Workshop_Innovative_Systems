-- 4 bit width's counter.
-- It is used to select input from then
-- max_intf.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity counter4b is

	port(
		en_clk	: in	std_logic;
		clk		: in 	std_logic;
		en_h	: in 	std_logic;
		rst_l 	: in 	std_logic;
		d_out 	: inout std_logic_vector(3 downto 0);
		tc_9	: out	std_logic
	);
	
end counter4b;

architecture structure of counter4b is

begin
	
	cnt_process : process(clk, en_clk)
	begin
		if clk'event and clk = '1' and en_clk = '1' then
			if rst_l = '0' then
				d_out <= "0000";
			elsif en_h = '1' then
				if d_out = "1001" then
					d_out <= (others => '0');
				else
					d_out <= std_logic_vector(unsigned(d_out)+1);
				end if;
			end if;
		end if;	
		tc_9 <=	d_out(3) and (not d_out(2)) and (not d_out(1)) and d_out(0);
	end process;
	
	
	
end structure;