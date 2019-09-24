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

component fa
port(
		a 		: in std_logic; 
		b 		: in std_logic;
		c_in 	: in std_logic;
		sum 	: out std_logic;
		c_out : out std_logic);
end component;

signal notb : signed(N-1 downto 0);
signal cprop: std_logic_vector(N downto 0);

begin

faGen:for i in 0 to N-1 generate
	notb(i) <= b(i) xor add_subn; 
	fai:fa port map (a => a(i), b => notb(i), c_in => cprop(i), sum => res(i), c_out => cprop(i+1));
end generate; 
c_out 	<= cprop(N);
cprop(0)	<= add_subn;
 
end architecture;  

	
		