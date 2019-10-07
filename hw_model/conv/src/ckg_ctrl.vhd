library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity ckg_ctrl is 
port (
	ck						: in  std_logic;
	rst 					: in  std_logic; 
	last_tilev_data	: in	unsigned(clog2v-1 downto 0);
	last_tileh_data	: in	unsigned(clog2v-1 downto 0);
	arv_lt_ckg			: in	unsigned(clog2v-1 downto 0);
	last_tilev			: out std_logic; 
	last_tileh			: out std_logic);
end entity; 

architecture beh of ckg_ctrl is 

signal int_last_tilev_data : unsigned(clog2v-1 downto 0);
signal int_last_tileh_data : unsigned(clog2v-1 downto 0);

signal int_arv_lt_ckg		: unsigned(clog2v-1 downto 0);
signal int_last_tilev		: std_logic;
signal int_last_tileh		: std_logic;

begin

int_last_tilev_data 	<= last_tilev_data;
int_last_tileh_data 	<= last_tileh_data;
int_arv_lt_ckg			<= arv_lt_ckg;

last_tilev 				<= int_last_tilev;
last_tileh				<= int_last_tileh;

tilev_cmp: 
entity work.cmp generic map(N => clog2v) port map (
	ck 		=> ck, 
	rst 		=> rst, 
	arv		=> int_arv_lt_ckg,
	i_data	=>	int_last_tilev_data,
	tc 		=> int_last_tilev);
	
tileh_cmp: 
entity work.cmp generic map (N => clog2v) port map (
	ck 		=> ck, 
	rst 		=> rst, 
	arv		=> int_arv_lt_ckg,
	i_data	=> int_last_tileh_data,
	tc 		=> int_last_tileh);
	
end architecture; 