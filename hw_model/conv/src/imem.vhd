library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity imem is 
port(
	ck 				: in std_logic;
	rst 				: in std_logic; 
	even_rd_addr	: in unsigned(clog2X-1 downto 0);
	even_wr_addr 	: in unsigned(clog2X-1 downto 0);
	odd_rd_addr	: in unsigned(clog2X-1 downto 0);
	odd_wr_addr 	: in unsigned(clog2X-1 downto 0);
	i_data 			: in signed(N*W-1 downto 0);
	o_data_even 	: out int_mem_t;
	o_data_odd		: out int_mem_t
	);
end entity;

architecture rtl of imem is 

type int_cs_t 	is array (0 to W-1) of std_logic;
type int_rd_t 	is array (0 to W-1) of std_logic;
type int_wr_t 	is array (0 to W-1) of std_logic;

signal cs 				: int_cs_t;
signal rd 				: int_rd_t;
signal wr 				: int_wr_t; 

signal int_mem_even	: int_mem_t; 
signal int_mem_odd	: int_mem_t;

begin

o_data_even <= int_mem_even;
o_data_odd	<= int_mem_odd;

even_bin:
for i in 0 to W-1 generate rfi:
	entity work.dual_port_rf port map (
		ck 		=> ck,
		rst		=> rst,
		cs 		=> cs(i),
		rd 		=> rd(i),
		wr 		=> wr(i),
		rd_addr 	=> even_rd_addr,
		wr_addr 	=> even_wr_addr,
		i_data 	=> i_data,
		o_data 	=> int_mem_even(i)
	);
end generate;

odd_bin:
for i in 0 to W-1 generate rfi:
	entity work.dual_port_rf port map (
		ck 		=> ck,
		rst		=> rst,
		cs 		=> cs(i),
		rd 		=> rd(i),
		wr 		=> wr(i),
		rd_addr 	=> odd_rd_addr,
		wr_addr 	=> odd_wr_addr,
		i_data 	=> i_data,
		o_data 	=> int_mem_odd(i)
	);
end generate;

end architecture;

--constant X : natural := 48; -- NB LINES
--type int_mem_t is array (0 to W*X-1) of signed(N*W-1 downto 0);
--type int_cs_t 	is array (0 to W*X-1) of std_logic; 
--
--signal int_mem_even 	: int_mem_t;
--signal int_mem_odd	: int_mem_t;
--signal int_cs 			: int_cs_t;
--
--begin
--
--even_bin: 
--for i in 0 to W-1 generate rfi: 
--	for j in 0 to X-1 generate regi:
--		entity work.regn generic map (N=> N*W) port map (
--			ck 	=> ck,
--			rst 	=> rst,
--			en  	=> int_cs(i+j),
--			d 		=> i_data,
--			q	 	=> int_mem_even(i+j)
--		);
--	end generate;
--end generate;
--
--odd_bin: 
--for i in 0 to W-1 generate rfi: 
--	for j in 0 to X-1 generate regi:
--		entity work.regn generic map (N=> N*W) port map (
--			ck 	=> ck,
--			rst 	=> rst,
--			en  	=> int_cs(i+j),
--			d 		=> i_data,
--			q	 	=> int_mem_odd(i+j)
--		);
--	end generate;
--end generate;
