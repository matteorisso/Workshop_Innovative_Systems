library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity imem_w is 
port(
	ck 				: in  std_logic;
	rst 				: in 	std_logic; 
	even_rd_addr	: in 	unsigned(clog2X-1 downto 0);
	even_wr_addr	: in 	unsigned(clog2X-1 downto 0);
	odd_rd_addr 	: in 	unsigned(clog2X-1 downto 0);
	odd_wr_addr 	: in 	unsigned(clog2X-1 downto 0);
	sel				: in	unsigned(clog2W-1 downto 0);
	sel2				: in 	std_logic; 
	i_data 			: in 	signed(N*W-1 downto 0);	
	o_data 			: out signed(2*N*W-1 downto 0);
	o_data2			: out int_mem_t
	);
end entity; 

architecture rtl of imem_w is

component imem
  port(
	ck 		: in std_logic;
	rst 	       	: in std_logic; 
	even_rd_addr	: in unsigned(clog2X-1 downto 0);
	even_wr_addr 	: in unsigned(clog2X-1 downto 0);
	odd_rd_addr	: in unsigned(clog2X-1 downto 0);
	odd_wr_addr 	: in unsigned(clog2X-1 downto 0);
	i_data 	        : in signed(N*W-1 downto 0);
	o_data_even 	: out int_mem_t;
	o_data_odd     	: out int_mem_t
	);
end component;

component imem_fifo_if
  port(	
	i_data_even  	: in 	int_mem_t;
	i_data_odd   	: in	int_mem_t;
	sel             : in 	unsigned(1 downto 0);
	o_data 	        : out signed(2*N*W-1 downto 0)
	);
end component;

component imem_bank_if
  port(	
	i_data_even	: in 	int_mem_t;
	i_data_odd	: in	int_mem_t;
	sel	       	: in 	std_logic;
	o_data 		: out int_mem_t
	);
end component;

signal int_i_data_even 	: int_mem_t;
signal int_i_data_odd	: int_mem_t; 
 
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

imem_if_inst:
imem_fifo_if port map (
	i_data_even	=> int_i_data_even,
	i_data_odd	=> int_i_data_odd,
	sel			=> sel,
	o_data 		=> o_data
	);
	
imem_if_inst2:
imem_bank_if port map (
	i_data_even	=> int_i_data_even,
	i_data_odd	=> int_i_data_odd,
	sel			=> sel2,
	o_data 		=> o_data2
	);

end architecture; 
