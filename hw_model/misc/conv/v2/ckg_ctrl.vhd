library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity ckg_ctrl is 
port (
	ck 			: in 	std_logic;
	rst 			: in 	std_logic; 
	ckg_rsel 	: in 	std_logic; 
	ckg_csel		: in 	std_logic; 
	ckg_mask		: in 	std_logic_vector(0 to W-1);
	ckg_mask_lt : in 	std_logic_vector(0 to W-1);
	ckg_rmask	: out std_logic_vector(0 to W-1);
	ckg_cmask	: out std_logic_vector(0 to W-1)
	);
end entity;

architecture beh of ckg_ctrl is

begin

ckg_rmask 			<= ckg_mask_lt when  ckg_rsel = '1' else ckg_mask;
ckg_cmask 			<= ckg_mask_lt when  ckg_csel = '1' else ckg_mask;

end architecture;