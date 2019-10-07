-- Interface's circuit between zero_mask and
-- max_func.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity max_intf is

	port(
		d_in_0 	: in 	std_logic_vector(6 downto 0);
		d_in_1 	: in 	std_logic_vector(6 downto 0);
		d_in_2 	: in 	std_logic_vector(6 downto 0);
		d_in_3 	: in 	std_logic_vector(6 downto 0);
		d_in_4 	: in 	std_logic_vector(6 downto 0);
		d_in_5 	: in 	std_logic_vector(6 downto 0);
		d_in_6 	: in 	std_logic_vector(6 downto 0);
		d_in_7 	: in 	std_logic_vector(6 downto 0);
		d_in_8 	: in 	std_logic_vector(6 downto 0);
		d_in_9 	: in 	std_logic_vector(6 downto 0);
		
		sel		: in	std_logic_vector(3 downto 0);
		
		d_out 	: out 	std_logic_vector(6 downto 0)
	);
	
end max_intf;

architecture structure of max_intf is

begin
	
	d_out	<=	d_in_0 when sel = "0000" else 
				d_in_1 when sel = "0001" else 
				d_in_2 when sel = "0010" else 
				d_in_3 when sel = "0011" else
				d_in_4 when sel = "0100" else 
				d_in_5 when sel = "0101" else 
				d_in_6 when sel = "0110" else 
				d_in_7 when sel = "0111" else
				d_in_8 when sel = "1000" else 
				d_in_9 when sel = "1001";
end structure;