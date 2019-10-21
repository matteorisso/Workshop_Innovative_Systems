library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity imem_bank_if is
	port(	
		i_data_even	: in 	mem_data_t;
		i_data_odd	: in	mem_data_t;
		even_odd_n	: in 	std_logic;
		o_data 		: out mem_data_t
		);
end entity;

architecture rtl of imem_bank_if is

begin

	mux_array:
	for i in 0 to W-1 generate mux:
		o_data(i) <= i_data_odd(i) when even_odd_n = '1' else i_data_even(i); 
	end generate; 

end architecture;