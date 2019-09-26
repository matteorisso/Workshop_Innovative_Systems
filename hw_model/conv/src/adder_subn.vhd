library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_subn is
generic( N : natural:=4 );
port(
		a 			: in signed(N-1 downto 0);
		b 			: in signed(N-1 downto 0);
		add_subn	: in std_logic; 
		res 		: out signed(N-1 downto 0);
		c_out		: out std_logic);
end entity;

architecture structure of adder_subn is

signal notb : signed(N-1 downto 0);
signal cprop: std_logic_vector(N downto 0);

begin

faGen:for i in 0 to N-1 generate
	notb(i) <= b(i) xor add_subn; 
	fai: entity work.fa port map (a => a(i), b => notb(i), c_in => cprop(i), sum => res(i), c_out => cprop(i+1));
end generate; 
c_out 	<= cprop(N);
cprop(0)	<= add_subn;
 
end architecture;  

	
		