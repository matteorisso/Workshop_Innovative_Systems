library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity imem_fifo_if is
port(	
	i_data_even  	: in 	MemDataOut;
	i_data_odd   	: in	MemDataOut;
	sel			   : in 	unsigned(1 downto 0);
	even_odd_n		: in 	std_logic;
	o_data 		   : out	signed(2*N*(K-1)-1 downto 0)
	);
end entity;

architecture rtl of imem_fifo_if is

signal int_o_data_even 	: signed(N*(K-1)-1 downto 0);
signal int_o_data_odd	: signed(N*(K-1)-1 downto 0);

begin

o_data <= int_o_data_even & int_o_data_odd 
	when even_odd_n = '0' else int_o_data_odd & int_o_data_even;

mux4to1_even:
process(i_data_even,sel)
begin
case(sel) is
when "01" =>
	int_o_data_even <= i_data_even(1);
when "10" =>
	int_o_data_even <= i_data_even(2);
when "11" =>
	int_o_data_even <= i_data_even(3);
when others => 
	int_o_data_even <= i_data_even(0);
end case;
end process; 

mux4to1_odd:
process(i_data_odd,sel)
begin
case(sel) is
when "01" =>
	int_o_data_odd <= i_data_odd(1);
when "10" =>
	int_o_data_odd <= i_data_odd(2);
when "11" =>
	int_o_data_odd <= i_data_odd(3);
when others => 
	int_o_data_odd <= i_data_odd(0);
end case;
end process; 

end architecture;

