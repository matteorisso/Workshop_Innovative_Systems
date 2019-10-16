-- Circuit demanded to the generation of the
-- control signals of the multiplexers present
-- in the rf_interface.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity rfint_mux_controller is

	port(
		en_clk	: in	std_logic;
		clk		: in 	std_logic;
		en_h	: in 	std_logic;
		rst_l 	: in 	std_logic;
		d_out 	: inout std_logic_vector(14 downto 0)
	);
	
end rfint_mux_controller;

architecture structure of rfint_mux_controller is
	
begin
	
	sipo_process : process(clk, en_clk)
	begin
		if clk'event and clk = '1' and en_clk = '1' then
			if rst_l = '0' then
				d_out <= "000100010110001";
			elsif en_h = '1' then
				d_out(2		downto	0) 	<= d_out(14	downto	12);
				d_out(5		downto	3) 	<= d_out(2	downto	0);
				d_out(8		downto	6) 	<= d_out(5	downto	3);
				d_out(11	downto	9)	<= d_out(8	downto	6);
				d_out(14	downto	12)	<= d_out(11	downto	9);
			end if;
		end if;
	end process;

end structure;