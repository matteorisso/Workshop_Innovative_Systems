library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity imem_bank_if is
port(	
	i_data_even	: in 	MemDataOut;
	i_data_odd	: in	MemDataOut;
	sel			: in 	std_logic;
	o_data 		: out MemDataOut
	);
end entity;

architecture rtl of imem_bank_if is

begin
mux_array:
for i in 0 to W-1 generate mux:
	o_data(i) <= i_data_odd(i) when sel = '1' else i_data_even(i); 
end generate; 

end architecture;