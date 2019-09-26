library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all ;

entity ff is
	
	port(	
		  d 		:	in  std_logic;
		  ck 		:	in  std_logic; 
		  rst 	    :	in  std_logic;
		  q  		:   out std_logic
		  
		);

end entity;

architecture behavior of ff is
begin

	process(ck)
	begin
			
		if (rising_edge(ck)) then
		
				if (rst  = '1') then
			    q <= '0';
		
		        else
			    q  <= d;
				
				end if;
			
		end if;
		
	end process;

end architecture behavior; 
