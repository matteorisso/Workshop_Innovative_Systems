library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity ckg_ctrl is 
port (
	ck 			: in 	std_logic;
	rst 			: in 	std_logic; 
	tc_hmode		: in 	std_logic;
	tc_tilev 	: in 	std_logic;
	tc_tileh		: in 	std_logic; 
	ckg_mask		: in 	std_logic_vector(0 to W-1);
	ckg_mask_lt : in 	std_logic_vector(0 to W-1);
	ckg_rmask	: out std_logic_vector(0 to W-1);
	ckg_cmask	: out std_logic_vector(0 to W-1)
	);
end entity;

architecture beh of ckg_ctrl is

signal int_en_ckg_r : std_logic;
signal int_en_ckg_c : std_logic;

begin

ckg_sel_gen: 
process(ck,rst)
begin
if rst = '1' then
	int_en_ckg_r 	<= '0';	
	int_en_ckg_c  	<= '0';
elsif rising_edge(ck) and tc_hmode = '1' then
	int_en_ckg_r 	<= tc_tilev;	
	int_en_ckg_c  	<= tc_tileh;
end if;
end process;

ckg_rmask 			<= ckg_mask_lt when  int_en_ckg_r = '1' else ckg_mask;
ckg_cmask 			<= ckg_mask_lt when  int_en_ckg_c = '1' else ckg_mask;


end architecture;