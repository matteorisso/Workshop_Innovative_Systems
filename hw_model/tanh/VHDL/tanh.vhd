library ieee;
use ieee.std_logic_1164.all;
use work.fixed_pkg.all;
use work.param.all;

entity tanh is
generic ( 	qi : natural:= 8;
				qf : natural:= 8 );				
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
signal s1, s2, s3, s4: sfixed(qi-1 downto -qf);

--components
component sub is
generic ( 	qi : natural:= 8; qf : natural:= 8 );

  port (
        A,B : in sfixed(qi-1 downto -qf);    
        Y :   out sfixed(qi-1 downto -qf);
		  cout : out std_logic
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
      O : out sfixed(qi-1 downto -qf)
      ); 
end component;

component regn_tanh1 is
generic ( 	qi : natural:= 8; qf : natural:= 8 );

port(
		d 	:	in sfixed(qi-1 downto -qf);
		ck, 
		rstn, 
		en	:	in std_logic;
		q  :  out sfixed(qi-1 downto -qf)
		);
end component;

component regn_tanh2 is
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
 
LUT:  RALU generic map ( qi => qi, qf => qf )
												port map ( 
															 AD=>s1, 
															 OT=>s2); 
															 
comparator:  comp generic map ( qi => qi, qf => qf )
												port map ( 
															 A=>s1, 
															 O=>s3);															 

subtractor: sub generic map ( qi => qi, qf => qf )
												port map ( 
															 A=>s2,
															 B=>s3, 
															 Y=>s4);

rg1: 	regn_tanh1 generic map ( qi => qi, qf => qf )
												port map ( 
                                              ck=>ck, 
	                                           rstn=>rstn, 
	                                           en=>en,
                                              d=>A,
                                              q=>s1); 	
				
rg2: 	regn_tanh1 generic map ( qi => qi, qf => qf )
												port map ( 
                                              ck=>ck, 
	                                           rstn=>rstn, 
	                                           en=>en,
                                              d=>s4,
                                              q=>O); 					
															 
															 
end architecture;