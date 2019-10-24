library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param.all;

entity zero_skip is  
 
     port( 
		  i_data 	  : in  signed(W-1 downto 0);
		  en          : out std_logic

		);
		
end entity; 

architecture beh of zero_skip is

begin

zero_skip_process: process(i_data)

begin
				
	if ( std_logic_vector(i_data) = "0000") then   
	
		en <= '0';
				
	else 
	    en <= '1';
	
	end if;
				
end process; 

end architecture; 