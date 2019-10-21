library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.globals.all;

entity top_level_dp is
port(
	);
end entity;

architecture rtl of top_level_dp is

begin

	dp_inst:
	entity work.datapath port map (
		);
		
	imem_inst: 
	entity work.imem_w port map (
		);
	
	kmem_inst:
	entity work.kmem_w port map (
		);
end architecture; 