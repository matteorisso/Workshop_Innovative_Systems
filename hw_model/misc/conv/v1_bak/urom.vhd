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
	arv_tilev 		: out unsigned(clog2v-1 downto 0);
	arv_tileh		: out unsigned(clog2h-1 downto 0);
	arv_tileb 		: out unsigned(clog2b-1 downto 0);
	arv_tilec	 	: out unsigned(clog2c-1 downto 0);
	arv_ckg			: out unsigned(clog2W-1 downto 0);
	ckg_mask 		: out std_logic_vector(0 to W-1);
	ckg_mask_lt		: out std_logic_vector(0 to W-1)
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
	arv_tilev		<= to_unsigned(C2_NB_TILEV-1,clog2v);
	arv_tileh		<= to_unsigned(C2_NB_TILEH-1,clog2v);
	-- BATCH SIZE
	arv_tileb		<= to_unsigned(C2_NB_TILEB-1,clog2b);
	-- OUTPUT BATCH SIZE
	arv_tilec 		<= to_unsigned(C2_NB_TILEC-1,clog2c);
	-- MOD OP. CKGATING
	arv_ckg			<= to_unsigned(1, clog2W);
	ckg_mask			<= "0000";
	ckg_mask_lt		<= "0011";

when others => 
	-- K SIZE
	arv_hmode 		<= to_unsigned(K-1,clog2K);
	arv_vmode		<= to_unsigned(K-1,clog2K);
	-- PE BLOCK SIZE
	arv_wr 			<= to_unsigned(W-1,clog2W);
	-- IMG SIZE/PE BLOCK SIZE
	arv_tilev		<= to_unsigned(C1_NB_TILEV-1,clog2v);	
	arv_tileh		<= to_unsigned(C2_NB_TILEH-1,clog2v);
	-- BATCH SIZE
	arv_tileb		<= to_unsigned(C2_NB_TILEB-1,clog2b);
	-- OUTPUT BATCH SIZE
	arv_tilec 		<= to_unsigned(C1_NB_TILEC-1,clog2c);	
	-- MOD OP. CKGATING
	arv_ckg			<= to_unsigned(W-1, clog2W);
	ckg_mask			<= "0000";
	ckg_mask_lt		<= "0000";
	
end case;
end process;
end architecture; 