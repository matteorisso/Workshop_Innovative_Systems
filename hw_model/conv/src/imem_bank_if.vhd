library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity imem_bank_if is
port(	
	i_data_even	: in 	int_mem_t;
	i_data_odd	: in	int_mem_t;
	sel			: in 	std_logic;
	o_data 		: out int_mem_t
	);
end entity;

architecture rtl of imem_bank_if is

begin
mux_array:
for i in 0 to W-1 generate mux:
	o_data(i) <= i_data_odd(i) when sel = '1' else i_data_even(i); 
end generate; 

end architecture;