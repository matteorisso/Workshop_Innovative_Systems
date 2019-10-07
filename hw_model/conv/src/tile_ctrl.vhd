library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

-- TODO : cnt after tilec to process multiple input fmaps kernel address is tilec(N) + new cnt(K) (N sets for K ifmaps)
-- NB channel partial res at tc_tilec

entity tile_ctrl is 
port(
		ck  					: in 	std_logic;
		rst 					: in 	std_logic;
		int_en_wr_ptr 		: in 	std_logic;
		int_tc_wr 			: in 	std_logic;
		arv_tilev			: in 	unsigned(clog2v downto 0);
		arv_tileh			: in	unsigned(clog2h downto 0);
		arv_tilec			: in 	unsigned(clog2c downto 0); 
		tilev_ptr			: out unsigned(clog2v downto 0);
		tileh_ptr			: out unsigned(clog2v downto 0);
		s_tc_tilev			: out std_logic; 
		s_tc_tileh			: out std_logic;
		s_tc_tilec			: out std_logic;
		en_tileh_ptr 		: out std_logic
		);		
end entity;

architecture rtl of tile_ctrl is 

signal int_en_tilev_ptr : std_logic;
signal int_en_tileh_ptr : std_logic;
signal int_en_tilec_ptr : std_logic;

signal int_tc_tilev 		: std_logic;
signal int_tc_tileh 		: std_logic;
signal int_tc_tilec 		: std_logic;

signal int_tilev_ptr 	: unsigned(clog2v downto 0);  
signal int_tileh_ptr 	: unsigned(clog2h downto 0);  
signal int_tilec_ptr 	: unsigned(clog2c downto 0); 

signal int_arv_tilev 	: unsigned(clog2v downto 0);
signal int_arv_tileh 	: unsigned(clog2h downto 0);
signal int_arv_tilec 	: unsigned(clog2c downto 0);

begin

-------------------------------------------------

int_en_tilev_ptr 	<= int_tc_wr 		and int_en_wr_ptr; 
int_en_tileh_ptr 	<= int_tc_tilev 	and int_en_tilev_ptr;
int_en_tilec_ptr	<= int_tc_tileh 	and int_en_tileh_ptr;
	
int_arv_tilev		<= arv_tilev;
int_arv_tileh		<= arv_tileh;
int_arv_tilec		<= arv_tilec;

tilev_ptr			<= int_tilev_ptr;
tileh_ptr			<= int_tileh_ptr;

s_tc_tilev 			<= int_tc_tilev;	
s_tc_tileh			<= int_tc_tileh;
s_tc_tilec 			<= int_tc_tilec; 

en_tileh_ptr		<= int_en_tileh_ptr;

tilev_cnt:
entity work.countern generic map (N => clog2v+1) port map (
	ck 	=> ck, 
	rst 	=> rst, 
	en 	=> int_en_tilev_ptr, 
	arv 	=> int_arv_tilev,
	q 		=> int_tilev_ptr,
	tc 	=> int_tc_tilev);

tileh_cnt: 
entity work.countern generic map (N => clog2h+1) port map (
	ck 	=> ck, 
	rst 	=> rst, 
	en	 	=> int_en_tileh_ptr, 
	arv	=> int_arv_tileh, 
	q 		=> int_tileh_ptr,
	tc		=> int_tc_tileh);
										
tilec_cnt: 
entity work.countern generic map (N => clog2c+1) port map (
	ck 	=> ck, 
	rst 	=> rst, 
	en 	=> int_en_tilec_ptr, 
	arv 	=> int_arv_tilec,
	q	 	=> int_tilec_ptr,
	tc 	=> int_tc_tilec);
	
---------------------------------------------------
	
end architecture;
