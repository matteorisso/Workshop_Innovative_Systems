library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity urom is
port(
	task 				: in 	layer_t;
	arv_hmode 		: out unsigned(clog2K-1 downto 0);
	arv_vmode 		: out unsigned(clog2K-1 downto 0);
	arv_wr	 		: out unsigned(clog2W-1 downto 0);
	arv_tilev 		: out unsigned(clog2v downto 0);
	arv_tileh 		: out unsigned(clog2h downto 0);
	arv_tilec	 	: out unsigned(clog2c downto 0);
	ckg_lt_mask		: out std_logic_vector(3 downto 0);
	ckg_mask 		: out std_logic_vector(3 downto 0)
	);
end entity;

architecture structure of urom is

begin

globals_table: 
process(task)
begin
-- TODO
-- MERGE: hmode,vmode arv
-- MERGE: tilev,tileh arv

case(task) is
when C2 => 
	-- K SIZE
	arv_hmode 		<= to_unsigned(K-1,clog2K);
	arv_vmode		<= to_unsigned(K-1,clog2K);
	-- PE BLOCK SIZE
	arv_wr 			<= to_unsigned(W-1,clog2W);
	-- IMG SIZE/PE BLOCK SIZE
	arv_tilev		<= to_unsigned(C2_NB_TILEV,clog2v+1);
	arv_tileh 		<= to_unsigned(C2_NB_TILEH,clog2h+1);
	-- IMG BATCH SIZE
	arv_tilec 		<= to_unsigned(C2_NB_TILEC,clog2c+1);
	-- MOD OP. CKGATING
	ckg_lt_mask	<= "0011";
	ckg_mask		<= "0000";

when others => 
	-- K SIZE
	arv_hmode 		<= to_unsigned(K-1,clog2K);
	arv_vmode		<= to_unsigned(K-1,clog2K);
	-- PE BLOCK SIZE
	arv_wr 			<= to_unsigned(W-1,clog2W);
	-- IMG SIZE/PE BLOCK SIZE
	arv_tilev		<= to_unsigned(C1_NB_TILEV,clog2v+1);	-- C1_NB_TILEV-1, clog2v
	arv_tileh 		<= to_unsigned(C1_NB_TILEH,clog2h+1);	-- C1_NB_TILEH-1 "
	-- IMG BATCH SIZE
	arv_tilec 		<= to_unsigned(C1_NB_TILEC,clog2c+1);	-- C1_NB_TILEC-1 "
	-- MOD OP. CKGATING
	ckg_lt_mask	<= "0000";
	ckg_mask		<= "0000";
	
end case;
end process;
end architecture; 