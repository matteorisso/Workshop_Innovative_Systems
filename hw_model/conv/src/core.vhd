library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param.all;

entity core is
port(
		ck 	 	: in std_logic;
		rst	 	: in std_logic; 
		ld 	 	: in std_logic; 
		en			: in std_logic;
		ckg_rmask: in std_logic_vector(0 to W-1);
		ckg_cmask: in std_logic_vector(0 to W-1);
		sync_clr	: in std_logic;
		rd_ptr 	: in unsigned(2 downto 0);
		wr_ptr 	: in unsigned(1 downto 0);
		i_kernel : in std_logic_vector(1 downto 0);
	   i_data 	: in  RFRowData;
		o_data 	: out PEBlockDataRes);
end entity;

architecture rtl of core is 

signal ss				: PEBlockData;
signal int_ckg_cmask : std_logic_vector(0 to W-1);
signal int_ckg_rmask : std_logic_vector(0 to W-1);

begin

DATA_BUFFER: 
entity work.sync_fifo  
				port map (
							ck 	 => ck, 
							rst 	 => rst, 
							ld  	 => ld,
							rd_ptr => rd_ptr, 
							wr_ptr => wr_ptr, 
							i_data => i_data, 
							o_data => ss);
PE_BLOCK:
entity work.pe_block 
				port map (
							ck 		=> ck, 
							rst 		=> rst, 
							sync_clr => sync_clr,
							en			=> en,
							ckg_rmask=> ckg_rmask,
							ckg_cmask=> ckg_cmask,
							i_kernel => i_kernel, 
							i_data 	=> ss, 
							o_data 	=> o_data);				

---- ckg problem : pad memory with last value fetched ( reduce sw activity for redundant data )
-- pipeline ? 

--CKG_ROW: 
--entity work.regn generic map (N => W) port map (
--	d 		=> ckg_rmask,      
--	ck 	=> ck,
--	rst 	=> rst,
--	en 	=> en
--	q 		=> int_ckg_rmask);
--	
--CKG_COL:
--entity work.regn generic map (N => W) port map (
--	d 		=> ckg_cmask;      
--	ck 	=> ck,
--	rst 	=> rst,
--	en 	=> en
--	q 		=> int_ckg_cmask);
	
end architecture; 




