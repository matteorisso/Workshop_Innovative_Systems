library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param.all;

entity PEBF is
port(
		ck 	 	: in std_logic;
		rst	 	: in std_logic; 
		ld 	 	: in std_logic; 
		pe_en		: in std_logic;
		pe_rst	: in std_logic;
		rd_ptr 	: in unsigned(2 downto 0);
		wr_ptr 	: in unsigned(1 downto 0);
		i_kernel : in std_logic;
	   i_data 	: in  RFRowData;
		o_data 	: out PEBlockDataRes);
end entity;

architecture rtl of PEBF is 

signal int_qfifo: PEBlockData;
signal int_pe_rst: std_logic; 

begin

int_pe_rst <= pe_rst;

DATA_BUFFER: 
entity work.FIFO  generic map (W => W, WL => WL, N => N)
				port map (
							ck 	 => ck, 
							rst 	 => rst, 
							ld  	 => ld,
							rd_ptr => rd_ptr, 
							wr_ptr => wr_ptr, 
							i_data => i_data, 
							o_data => int_qfifo);
PE_BLOCK:
entity work.PEBlock 	generic map (W => W, N => N) 
				port map (
							ck 		=> ck, 
							rst 		=> pe_rst, 
							en			=> pe_en,
							i_kernel => i_kernel, 
							i_data 	=> int_qfifo, 
							o_data 	=> o_data);				

end architecture; 