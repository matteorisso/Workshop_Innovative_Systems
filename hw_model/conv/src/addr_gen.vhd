library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param.all;

entity addr_gen is 
port(
		ck  				: in std_logic;
		rst 				: in std_logic;
		int_en_wr_ptr 	: in std_logic;
		int_tc_wr 		: in std_logic;
		arv_tilev		: in unsigned(clog2v-1 downto 0);
		arv_tileh		: in unsigned(clog2h-1 downto 0);
		arv_tilec		: in unsigned(clog2c-1 downto 0);
		TC_TILEV			: out std_logic; 
		TC_TILEH			: out std_logic;
		TC_TILEC			: out std_logic; 
		MSB_ADDR 		: out unsigned(clog2MSBaddr-1 downto 0));
end entity;

architecture rtl of addr_gen is 

signal int_en_tilev_ptr : std_logic;
signal int_en_tileh_ptr : std_logic;
signal int_en_tilec_ptr : std_logic;
 
signal int_tc_tilev : std_logic;
signal int_tc_tileh : std_logic;
signal int_tc_tilec : std_logic;

signal int_tilev_ptr : unsigned(clog2v-1 downto 0);  
signal int_tileh_ptr : unsigned(clog2h-1 downto 0);  
signal int_tilec_ptr : unsigned(clog2c-1 downto 0); 

signal int_arv_tilev : unsigned(clog2v-1 downto 0);
signal int_arv_tileh : unsigned(clog2h-1 downto 0);
signal int_arv_tilec : unsigned(clog2c-1 downto 0);

constant NB_TILEV : natural := C1_NB_TILEV;
constant NB_TILEH : natural := C1_NB_TILEH;
constant NB_TILEC : natural := C1_NB_TILEC;

begin

int_en_tilev_ptr <= int_tc_wr 	and int_en_wr_ptr; 
int_en_tileh_ptr <= int_tc_tilev and int_en_tilev_ptr;
int_en_tilec_ptr <= int_tc_tileh and int_en_tileh_ptr;

int_arv_tilev <= arv_tilev;
int_arv_tileh <= arv_tileh;
int_arv_tilec <= arv_tilec;
	
TC_TILEV <= int_tc_tilev;
TC_TILEH <= int_tc_tileh;
TC_TILEC <= int_tc_tilec; 

MSB_ADDR <= int_tilec_ptr & int_tileh_ptr & int_tilev_ptr;

tilev_cnt:
entity work.countern generic map (N => clog2v)
		port map (
					ck 	=> ck, 
					rst 	=> rst, 
					en 	=> int_en_tilev_ptr, 
					arv 	=> int_arv_tilev,
					q 		=> int_tilev_ptr,
					tc 	=> int_tc_tilev);
tileh_cnt: 
entity work.countern generic map (N => clog2h)
		port map (
					ck 	=> ck, 
					rst 	=> rst, 
					en	 	=> int_en_tileh_ptr, 
					arv	=> int_arv_tileh, 
					q 		=> int_tileh_ptr,
					tc		=> int_tc_tileh);
										
tilec_cnt: 
entity work.countern generic map (N => clog2c)
		port map (
					ck 	=> ck, 
					rst 	=> rst, 
					en 	=> int_en_tilec_ptr, 
					arv 	=> int_arv_tilec,
					q	 	=> int_tilec_ptr,
					tc 	=> int_tc_tilec);

end architecture;