library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.fixed_pkg.all;


entity cmp1 is
generic ( 	qi : natural:= 8; qf : natural:= 8 );

  port (  
	  A : in sfixed(qi-1 downto -qf); 
	  aeqb, altb, agtb  : out std_logic
   );
end entity;

architecture behavioral of cmp1 is

signal B: sfixed(qi-1 downto -qf);

begin

  B <= "0000000100000000";
  
  aeqb <= '1' when (A = B) else '0';
  altb <= '1' when (A < B) else '0';
  agtb <= '1' when (A > B) else '0';

end architecture;
