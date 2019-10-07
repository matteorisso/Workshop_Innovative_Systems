library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param.all;

entity data_buffer is
port(
		ck 	 	: in 	std_logic; 
		rst	 	: in 	std_logic; 
		en 	 	: in 	std_logic_vector(0 to W-1);
		rd_ptr 	: in 	unsigned(2 downto 0);
		i_data 	: in  	RFRowData; 
		o_data 	: out 	PEBlockData);
end entity;

architecture rtl_v1 of data_buffer is

signal ss: RFBlockData; 

begin

reg:entity work.regfile port map (
	ck 		=> ck,
	rst 	=> rst, 
	en 		=> en, 
	i_data	=> i_data, 
	o_data 	=> ss);
					
tap: for i in 0 to W-1 generate mux: 
	entity work.mux5to1	port map (
		i_data 	=> ss(i), 
		sel 		=> rd_ptr, 
		o_data 	=> o_data(i));
		
end generate; 

end architecture; 
