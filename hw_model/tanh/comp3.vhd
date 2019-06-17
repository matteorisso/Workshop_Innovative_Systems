library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.fixed_pkg.all;


entity comp3 is
generic ( 	qi : natural:= 8; qf : natural:= 8 );

 port (  
        A : in sfixed(qi-1 downto -qf);  
        O : out sfixed(qi-1 downto -qf)
       ); 
end entity;

architecture behavioral of comp3 is

--signals
signal s1, s2, s3: std_logic;

--components

component cmp1 is
generic ( 	qi : natural:= 8; qf : natural:= 8 );

  port (  
	  A : in sfixed(qi-1 downto -qf); 
	  aeqb, altb, agtb  : out std_logic
   );
end component;

component comp2 is
generic ( 	qi : natural:= 8; qf : natural:= 8 );	
			
port (  
        A : in sfixed(qi-1 downto -qf); 
        aeqb, altb, agtb  : in std_logic;  
        O : out sfixed(qi-1 downto -qf)
       );   
end component;
        
--port map
begin 
 
comparator1:  cmp1 generic map ( qi => qi, qf => qf ) port map (A=>A, aeqb=>s1, altb=>s2, agtb=>s3); 
															 
comparator2:  comp2 generic map ( qi => qi, qf => qf ) port map (A=>A, aeqb=>s1, altb=>s2, agtb=>s3, O=>O);	

end architecture;