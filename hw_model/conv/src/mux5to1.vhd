library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param.all;

entity mux5to1 is
port(
	i_data	: in 	RFRowData;
	sel 	: in 	unsigned(2 downto 0); 
    o_data 	: out 	PERowData);
end entity;

architecture dataflow of mux5to1 is
begin

process(i_data,sel)
begin
case( sel ) is 
	when "001"  => o_data <= i_data(WL-1*N-1 downto WL-1*N -N*W);   
	when "010"  => o_data <= i_data(WL-2*N-1 downto WL-2*N -N*W); 
	when "011"  => o_data <= i_data(WL-3*N-1 downto WL-3*N -N*W); 
	when "100"  => o_data <= i_data(WL-4*N-1 downto WL-4*N -N*W); 
	when others => o_data <= i_data(WL-1 downto WL-0*N -N*W);
end case;
end process; 

end architecture; 