-- 3 bit width's counter.
-- It is used to switch from even adressing
-- to odd adressing every 7 ifmap.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity counter3b is

	port(
		en_clk	: in	std_logic;
		clk		: in 	std_logic;
		en_h	: in 	std_logic;
		rst_l 	: in 	std_logic;
		tc_6	: out	std_logic
	);
	
end counter3b;

architecture structure of counter3b is

	signal d_out	:	std_logic_vector(2	downto	0);

begin
	
	cnt_process : process(clk, en_clk)
	begin
		if clk'event and clk = '1' and en_clk = '1' then
			if rst_l = '0' then
				d_out <= "000";
				tc_6  <= '0';
			elsif en_h = '1' then
				if d_out = "110" then
					d_out <= "000";
				else
					d_out	<= std_logic_vector(unsigned(d_out)+1);
				end if;
			end if;
		end if;	
		tc_6	<=	d_out(2) and d_out(1) and (not d_out(0));
	end process;
	
	
	
end structure;