library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param.all;

entity PEBlock is
generic(W: natural:= W; N : natural:= N );
port(
		ck 	: in std_logic;
		rst	: in std_logic;
		en 	: in std_logic;
		i_kernel : in std_logic; 
		i_data 	: in  PEBlockData;
		o_data 	: out PEBlockDataRes);
end entity;

architecture structure of PEBlock is

component PE
generic( N : natural:= 4;  G : natural:= 7); 
port(
	ck : in std_logic;
	rst: in std_logic; 
	en	: in std_logic;
	k  : in std_logic;
	i_data: in 	signed(N-1 downto 0);
	o_data: out signed(N-1+G downto 0));
end component;

signal int_i_data : peBlockData;
begin

peRowGen: 
for i in 0 to W-1 generate
	int_i_data(i) <= i_data(i);
	
	peColGen: 
	for j in 0 to W-1 generate
						peij: PE generic map (N => N, G => G) port map (
										ck 		=> ck, 
										rst 		=> rst, 
										en 		=> en, 
										k 			=> i_kernel, 
										i_data 	=> int_i_data(i)(W*N-1 -j*N downto (W*N - N*(j+1))), 
										o_data 	=> o_data(i)(W*(N+G)-1 -j*(N+G) downto (W*(N+G) - (N+G)*(j+1))));
	end generate;
end generate;

end architecture;
