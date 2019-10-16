library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity imem_w is 
port(
	ck 				: in  std_logic;
	rst 				: in 	std_logic; 
	even_rd_addr	: in 	unsigned(clog2m-1 downto 0);
	even_wr_addr	: in 	unsigned(clog2m-1 downto 0);
	odd_rd_addr 	: in 	unsigned(clog2m-1 downto 0);
	odd_wr_addr 	: in 	unsigned(clog2m-1 downto 0);
	sel				: in	unsigned(clog2W-1 downto 0);
	sel2				: in 	std_logic; 
	i_data 			: in 	RFWord;	
	o_data 			: out FIFORowData;
	o_data2			: out MemDataOut
	);
end entity; 

architecture rtl of imem_w is

signal int_i_data_even 	: MemDataOut;
signal int_i_data_odd	: MemDataOut; 
 
begin

imem: 
entity work.imem port map (
	ck 		 		=> ck,
	rst 		 		=> rst, 
	even_rd_addr	=> even_rd_addr,
	even_wr_addr	=> even_wr_addr,
	odd_rd_addr	 	=> odd_rd_addr,
	odd_wr_addr		=> odd_wr_addr,
	i_data 		 	=> i_data,
	o_data_even		=> int_i_data_even,
	o_data_odd		=> int_i_data_odd
	);

imem_if:
entity work.imem_fifo_if port map (
	i_data_even	=> int_i_data_even,
	i_data_odd	=> int_i_data_odd,
	sel			=> sel,
	o_data 		=> o_data
	);
	
imem_if_2:
entity work.imem_bank_if port map (
	i_data_even	=> int_i_data_even,
	i_data_odd	=> int_i_data_odd,
	sel			=> sel2,
	o_data 		=> o_data2
	);

end architecture; 