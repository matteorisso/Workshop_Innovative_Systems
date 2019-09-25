library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param.all;

entity pe_block is
port(
		ck 			: in std_logic;
		rst			: in std_logic;
		sync_clr 	: in std_logic;
		en 			: in std_logic;
		i_kernel	: in std_logic; 
		i_data 		: in  PEBlockData;
		o_data 		: out PEBlockDataRes);
end entity;

architecture rtl of pe_block is

signal int_i_data : peBlockData;

begin

peRowGen: for i in 0 to W-1 generate 
	
	int_i_data(i) <= i_data(i);
	
	peColGen: for j in 0 to W-1 generate peij: 
	
		entity work.pe port map (
			ck 			=> ck, 
			rst 		=> rst,
			sync_clr	=> sync_clr,
			en 			=> en, 
			k 			=> i_kernel, 
			i_data 		=> int_i_data(i)(W*N-1 -j*N downto (W*N - N*(j+1))), 
			o_data 		=> o_data(i)(W*(N+G)-1 -j*(N+G) downto (W*(N+G) - (N+G)*(j+1)))
		);
	end generate;
end generate;

end architecture;
