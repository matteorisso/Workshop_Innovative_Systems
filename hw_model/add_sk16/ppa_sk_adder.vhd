library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity ppa_sk_adder is

generic ( n: integer; m: integer );

port (
       g,p: in  signed(n-1 downto 0);
       ci : in  std_logic;
       s  : out signed(n-1 downto 0);
       co : out std_logic;
       c  : out signed(n-1 downto 0)	  
	  );
end ppa_sk_adder;


architecture structural of ppa_sk_adder is

component ppa_sk

generic ( n: integer; m: integer );

port (
       g0,p0 : in signed(n-1 downto 0);
       gm    : out signed(n-1 downto 0)
	  );
end component;


component ppshl

generic (n : integer);

port (
       gi : in signed(n-1 downto 0);
       ci : in std_logic;
       go : out signed(n-1 downto 0);
       co : out std_logic
	  );
end component;


component ppsum

generic (n : integer);

port (
       g,p : in signed(n-1 downto 0);
       s   : out signed(n-1 downto 0)
	  );
end component;


signal gm,gs : signed(n-1 downto 0);

begin

sklansky : ppa_sk

generic map (16,4)

port map (g,p,gm);

c <= gm;

shl : ppshl

generic map (16)

port map (gm,ci,gs,co);

sum : ppsum

generic map (16)

port map (gs,p,s);

end structural;

