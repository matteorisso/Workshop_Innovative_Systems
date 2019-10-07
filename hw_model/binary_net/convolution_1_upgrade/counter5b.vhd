-- 5 bit width's counter.
-- It is used to select bit from then
-- activations register file, the counter
-- is used to drive the 32to1 mux.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity counter5b is

	port(
		en_clk	: in	std_logic;
		clk		: in 	std_logic;
		en_h	: in 	std_logic;
		rst_l 	: in 	std_logic;
		d_out 	: inout std_logic_vector(4 downto 0);
		tc_4	: out	std_logic;
		tc_31	: out	std_logic
	);
	
end counter5b;

architecture structure of counter5b is

begin
	
	cnt_process : process(clk, en_clk)
	begin
		if clk'event and clk = '1' and en_clk = '1' then
			if rst_l = '0' then
				d_out <= "11111";
				tc_4  <= '0';
				tc_31 <= '0';
			elsif en_h = '1' then
				d_out	<= std_logic_vector(unsigned(d_out)-1);
			end if;
		end if;	
		tc_31	<=	(not d_out(4)) and (not d_out(3)) and (not d_out(2)) and (not d_out(1)) and ( not d_out(0));
		tc_4	<=	d_out(4) and d_out(3) and (not d_out(2)) and d_out(1) and d_out(0);
	end process;
	
	
	
end structure;