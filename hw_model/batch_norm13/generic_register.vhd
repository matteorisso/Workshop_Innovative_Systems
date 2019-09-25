library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity generic_register is

	generic(n : integer := 8);
	port(
		clk		: in 	std_logic;
		en_h	: in 	std_logic;
		rst_l 	: in 	std_logic;
		d_in 	: in 	std_logic_vector((n-1) downto 0);
		d_out 	: out 	std_logic_vector((n-1) downto 0)
	);

end generic_register;

architecture behavior of generic_register is

begin

	reg_process : process(clk)
	begin
		if clk'event and clk = '1' then
			if rst_l = '0' then
				d_out <= (others => '0');
			elsif en_h = '1' then
				d_out <= d_in;
			end if;
		end if;
	end process;

end behavior;