library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity imem_fifo_if is
port(	
	i_data_even  	: in 	int_mem_t;
	i_data_odd   	: in	int_mem_t;
	sel			        : in 	unsigned(1 downto 0);
	o_data 		     : out signed(2*N*W-1 downto 0)
	);
end entity;

architecture rtl of imem_fifo_if is

signal int_o_data_even 	: signed(N*W-1 downto 0);
signal int_o_data_odd	: signed(N*W-1 downto 0);

begin
o_data <= int_o_data_even & int_o_data_odd; -- when tileh_lsb = '0' else int_o_data_odd&int_o_data_even

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

