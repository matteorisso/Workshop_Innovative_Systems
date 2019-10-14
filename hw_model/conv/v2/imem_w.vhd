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
	even_odd_n		: in  std_logic;
	sel				: in	unsigned(clog2W-1 downto 0);
	sel2				: in 	std_logic; 
	i_data 			: in 	signed(N*(K-1)-1 downto 0);	
	o_data_conv 	: out signed(2*N*(K-1)-1 downto 0);
	o_data_pool		: out MemDataOut
	);
end entity; 

architecture rtl of imem_w is

component imem
port(
	ck 				: in 	std_logic;
	rst 				: in 	std_logic; 
	even_rd_addr	: in 	unsigned(clog2m-1 downto 0);
	even_wr_addr 	: in 	unsigned(clog2m-1 downto 0);
	odd_rd_addr		: in 	unsigned(clog2m-1 downto 0);
	odd_wr_addr 	: in 	unsigned(clog2m-1 downto 0);
	i_data 			: in 	signed(N*(K-1)-1 downto 0);
	o_data_even 	: out MemDataOut;
	o_data_odd		: out MemDataOut
	);
end component;

component imem_fifo_if
port(	
	i_data_even  	: in 	MemDataOut;
	i_data_odd   	: in	MemDataOut;
	sel			   : in 	unsigned(1 downto 0);
	even_odd_n		: in  std_logic;
	o_data 		   : out	signed(2*N*(K-1)-1 downto 0)
	);
end component;

component imem_bank_if
port(	
	i_data_even	: in 	MemDataOut;
	i_data_odd	: in	MemDataOut;
	sel			: in 	std_logic;
	o_data 		: out MemDataOut
	);
end component;

signal int_i_data_even 	: MemDataOut;
signal int_i_data_odd	: MemDataOut; 
 
begin

imem_inst: 
imem port map (
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

imem_if_conv:
imem_fifo_if port map (
	i_data_even	=> int_i_data_even,
	i_data_odd	=> int_i_data_odd,
	even_odd_n	=> even_odd_n,
	sel			=> sel,
	o_data 		=> o_data_conv
	);
	
imem_if_pool:
imem_bank_if port map (
	i_data_even	=> int_i_data_even,
	i_data_odd	=> int_i_data_odd,
	sel			=> sel2,
	o_data 		=> o_data_pool
	);

end architecture; 