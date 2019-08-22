library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity add_sk16 is

generic ( n : integer );

port ( 
       a,b : in  signed(15 downto 0);
       ci  : in  std_logic;
       s   : out signed(15 downto 0);
       co  : out std_logic
	  );
end add_sk16;


architecture structural of add_sk16 is

component pg_gen

generic ( n : integer );

port (
       a,b : in  signed(n-1 downto 0);
       ci  : in  std_logic;
       g,p : out signed(n-1 downto 0)
	  );
end component;

--for all : pg_gen
--use entity arithmetik.pg_gen(pg_gen);

component ppa_sk_adder

generic (n : integer; m : integer );

port (
       g,p: in  signed(n-1 downto 0);
       ci : in  std_logic;
       s  : out signed(n-1 downto 0);
       co : out std_logic;
       c  : out signed(n-1 downto 0)	  
	  );
end component;

--for all : ppa_sk_adder
--use entity arithmetik.ppa_sk_adder(ppa_sk_adder);

signal g,p,bb,ss,c : signed(n-1 downto 0);

begin

bb <= b;

preprocessing: pg_gen

generic map(16)

port map(a,bb,ci,g,p);

sk: ppa_sk_adder

generic map (16,4)

port map (g,p,ci,ss,co,c);

s <= ss;

end structural;
