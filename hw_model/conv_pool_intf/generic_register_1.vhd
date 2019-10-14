-- Generic register with clk-gating capability by means of signal en_clk. 
-- When en_clk = '0' the clk is gated.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity generic_register_1 is

	generic(n : integer := 8);
	
	port(
		en_clk	: in	std_logic;
		clk		: in 	std_logic;
		en_h	: in 	std_logic;
		rst_l 	: in 	std_logic;
		d_in 	: in 	std_logic_vector((n-1) downto 0);
		d_out 	: out 	std_logic_vector((n-1) downto 0)
	);
	
end generic_register_1;

architecture behavior of generic_register_1 is
begin

	reg_process : process(clk, en_clk)
	begin
		if clk'event and clk = '1' and en_clk = '1' then
			if rst_l = '0' then
				d_out((n-1) downto 1) <= ((n-1) downto 1 => '0');
				d_out(0) 			  <= '1';
			elsif en_h = '1' then
				d_out <= d_in;
			end if;
		end if;
	end process;

end behavior;