library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity core_v2 is
port(
		ck 	 		: in std_logic;
		rst	 		: in std_logic; 
		ld 	 		: in std_logic; 
		en				: in std_logic;
		ckg_rmask	: in std_logic_vector(0 to W-1);
		ckg_cmask	: in std_logic_vector(0 to W-1);
		sync_clr		: in std_logic;
		rd_ptr 		: in unsigned(2 downto 0);
		wr_ptr 		: in unsigned(1 downto 0);
		i_kernel 	: in std_logic_vector(1 downto 0);
	   i_data 		: in  RFRowData;
		o_data 		: out PEBlockDataRes);
end entity;

architecture rtl of core_v2 is
component pe_array
end component; 
component h_fifo 
end component; 
begin

end architecture; 