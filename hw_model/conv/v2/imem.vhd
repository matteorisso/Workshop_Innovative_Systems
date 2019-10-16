library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity imem is 
port(
	ck 				: in 	std_logic;
	rst 				: in 	std_logic; 
	even_rd_addr	: in 	unsigned(clog2m-1 downto 0);
	even_wr_addr 	: in 	unsigned(clog2m-1 downto 0);
	odd_rd_addr		: in 	unsigned(clog2m-1 downto 0);
	odd_wr_addr 	: in 	unsigned(clog2m-1 downto 0);
	i_data 			: in 	signed(N*(K-1)-1 downto 0);
	o_data_even 	: out MemDataOut;
	o_data_odd		: out MemDataOut
	);
end entity;

architecture rtl of imem is 

component dual_port_rf
generic ( N : natural := N );
port( 
	ck 		: in 	std_logic;
	rst		: in 	std_logic;
	cs 		: in 	std_logic; 
	rd			: in 	std_logic;
	wr			: in 	std_logic;
	rd_addr	: in 	unsigned(clog2m-1 downto 0);
	wr_addr 	: in 	unsigned(clog2m-1 downto 0);
	i_data	: in 	signed(N-1 downto 0); 
	o_data 	: out signed(N-1 downto 0)
	); 
end component; 

--tmp
--------------------------------------------------
type int_cs_t 	is array (0 to W-1) of std_logic;
type int_rd_t 	is array (0 to W-1) of std_logic;
type int_wr_t 	is array (0 to W-1) of std_logic;

signal cs 	: int_cs_t;
signal rd	: int_rd_t;
signal wr 	: int_wr_t; 
--------------------------------------------------

signal int_mem_even	: MemDataOut; 
signal int_mem_odd	: MemDataOut;

begin

o_data_even <= int_mem_even;
o_data_odd	<= int_mem_odd;

even_bin:
for i in 0 to W-1 generate rfi:
	dual_port_rf generic map ( N => N*(K-1) ) port map (
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
	dual_port_rf generic map ( N => N*(K-1) ) port map (
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

