library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity kmem_w is
port( 
	ck 		: in 	std_logic;
	rst		: in 	std_logic;
	cs 		: in 	std_logic; 
	rd			: in 	std_logic;
	wr			: in 	std_logic;
	rd_addr	: in 	unsigned(clog2m-1 downto 0);
	wr_addr 	: in 	unsigned(clog2m-1 downto 0);
	i_data	: in 	signed(N_WEIGHT*K-1 downto 0); 
	o_data 	: out signed(N_WEIGHT*K-1 downto 0)
	); 
end entity;

architecture rtl of kmem_w is 

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

begin

weight_mem: 
dual_port_rf generic map (N => N_WEIGHT*K)port map (
	ck 		=> ck,
	rst 		=> rst,
	cs 		=> cs,
	rd 		=> rd,
	wr	 		=> wr,
	rd_addr 	=>	rd_addr,
	wr_addr 	=>	wr_addr,
	i_data  	=> i_data,
	o_data 	=> o_data
	);

end architecture; 