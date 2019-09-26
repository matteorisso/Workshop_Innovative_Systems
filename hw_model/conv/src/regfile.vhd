library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param.all;

entity regfile is
port( 
		ck		: in std_logic; 
		rst 	: in std_logic; 
		en 		: in std_logic_vector(0 to W-1);
		i_data	: in  RFRowData;
		o_data	: out RFBlockData);
end entity;

architecture structure of regfile is

begin

rGen: for i in 0 to W-1 generate regi: 
	
	entity work.regn 	generic map (N => WL) port map (
		ck 	=> ck, 
		rst => rst, 
		en 	=> en(i), 
		d 	=> i_data, 
		q 	=> o_data(i)
	);
end generate;
	
end architecture; 