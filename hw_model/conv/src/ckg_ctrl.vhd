library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity ckg_ctrl is 
port (
	ck 			: in 	std_logic;
	rst 			: in 	std_logic; 
	ck_en			: in 	std_logic;
	ckg_rsel 	: in 	std_logic;
	ckg_csel		: in 	std_logic; 
	ckg_mask		: in 	std_logic_vector(0 to W-1);
	ckg_mask_lt : in 	std_logic_vector(0 to W-1);
	ckg_rmask	: out std_logic_vector(0 to W-1);
	ckg_cmask	: out std_logic_vector(0 to W-1);
	s_ckg			: out std_logic
	);
end entity;

architecture beh of ckg_ctrl is

signal int_en_ckg_r : std_logic;
signal int_en_ckg_c : std_logic;

begin

s_ckg					<= int_en_ckg_r;
ckg_rmask 			<= ckg_mask_lt when  int_en_ckg_r = '1' else ckg_mask;
ckg_cmask 			<= ckg_mask_lt when  int_en_ckg_c = '1' else ckg_mask;

ckg_sel_gen: 
process(ck,rst,ck_en)
begin
if rst = '1' then
	int_en_ckg_r 	<= '0';	
	int_en_ckg_c  	<= '0';
elsif rising_edge(ck) and ck_en = '1' then
	int_en_ckg_r 	<= ckg_rsel;	
	int_en_ckg_c  	<= ckg_csel;
end if;
end process;



end architecture;