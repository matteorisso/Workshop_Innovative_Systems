library ieee;
use ieee.std_logic_1164.all;
use work.fixed_pkg.all;

entity tanh is
generic ( 	qi : natural:= 8; qf : natural:= 8 );	
			
port(
	  ck, 
	  rstn, 
	  en:	in std_logic;
     A : in sfixed(qi-1 downto -qf);
     O : out sfixed(qi-1 downto -qf)
	 
     );
end entity;

architecture behavioral of tanh is
 
--signals
signal s1, s2: sfixed(qi-1 downto -qf);

--components
component comp3 is
generic ( 	qi : natural:= 8; qf : natural:= 8 );

port (  
      A : in sfixed(qi-1 downto -qf);  
      O : out sfixed(qi-1 downto -qf)
      ); 
end component;

component regn_tanh is
generic ( 	qi : natural:= 8; qf : natural:= 8 );

port(
		d 	:	in sfixed(qi-1 downto -qf);
		ck, 
		rstn, 
		en	:	in std_logic;
		q  :  out sfixed(qi-1 downto -qf)
		);
end component;

--port map
begin 
															 
comparator:  comp3 generic map ( qi => qi, qf => qf ) port map (A=>s1, O=>s2);															 

rg1: 	regn_tanh generic map ( qi => qi, qf => qf ) port map (ck=>ck, rstn=>rstn, en=>en, d=>A, q=>s1); 	
				
rg2: 	regn_tanh generic map ( qi => qi, qf => qf ) port map (ck=>ck, rstn=>rstn, en=>en, d=>s2, q=>O); 												  
															 
															 
end architecture;