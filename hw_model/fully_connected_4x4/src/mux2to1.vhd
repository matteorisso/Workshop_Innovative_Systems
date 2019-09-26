library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity mux2to1 is

	generic( n : natural );
	
    port ( 
	      sel : in  std_logic;
          a   : in  signed (n-1 downto 0);
          b   : in  signed (n-1 downto 0);
          o   : out signed (n-1 downto 0)
		  
		  );
		  
end entity;

architecture behavioral of mux2to1 is

begin

    o <= a when (sel = '1') else b;
	
end behavioral;