library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity mux5to1 is
port(
	i_data	: in 	FIFORowData;
	sel 		: in 	unsigned(2 downto 0); 
   o_data 	: out PERowData
	 );
end entity;

architecture dataflow of mux5to1 is
begin

process(i_data,sel)
begin
case( sel ) is 
	when "001"  => o_data <= i_data(N_REG_FIFO-1*N-1 downto N_REG_FIFO-1*N -N*W);   
	when "010"  => o_data <= i_data(N_REG_FIFO-2*N-1 downto N_REG_FIFO-2*N -N*W); 
	when "011"  => o_data <= i_data(N_REG_FIFO-3*N-1 downto N_REG_FIFO-3*N -N*W); 
	when "100"  => o_data <= i_data(N_REG_FIFO-4*N-1 downto N_REG_FIFO-4*N -N*W); 
	when others => o_data <= i_data(N_REG_FIFO-1 downto N_REG_FIFO-0*N -N*W);
end case;
end process; 

end architecture; 