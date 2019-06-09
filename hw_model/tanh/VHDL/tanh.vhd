library ieee;
use ieee.std_logic_1164.all;
use work.fixed_pkg.all;

entity tanh is
generic ( 	qi : natural:= 8;
				qf : natural:= 8 );				
port(

     A : in sfixed(qi-1 downto -qf);
     O : out sfixed(qi-1 downto -qf)
     );
end entity;

architecture behavioral of tanh is
 
--signals
signal s1, s2 : sfixed(qi-1 downto -qf);

--components
component sub is
generic ( 	qi : natural:= 8; qf : natural:= 8 );

  port (
        A,B : in sfixed(qi-1 downto -qf);    
        Y :   out sfixed(qi-1 downto -qf)
        );
end component;

component RALU is
generic ( 	qi : natural:= 8; qf : natural:= 8 );

    port (
          AD : in sfixed(qi-1 downto -qf);
          OT : out sfixed(qi-1 downto -qf)
			 );
end component;

component comp is
generic ( 	qi : natural:= 8; qf : natural:= 8 );

port (  
      A : in sfixed(qi-1 downto -qf);  
      O : out sfixed(qi-1 downto -qf);
       ); 
end component;

--port map
begin 
  
LUT: RALU port map(AD=>A, OT=>s1);

comparator: comp port map(A=>A, O=>s2);

subtractor: sub port map(A=>sl, B=>s2, Y=>O);
  
end architecture;