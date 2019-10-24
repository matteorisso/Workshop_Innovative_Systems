library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param.all;

entity cgu_fc is 
   
port( 
		  layer_fc    : in   std_logic_vector(1 downto 0); 	
		  cnt2        : in   unsigned(cnt_b2-1 downto 0); 
		  ckg_rmask   : out  std_logic_vector(0 to W-1);		   
		  ckg_cmask   : out  std_logic_vector(0 to W-1)		   
    ); 
end entity; 

architecture beh of cgu_fc is

begin

p_cgu : process(layer_fc, cnt2)
begin

if layer_fc = "00" and cnt2 = "0111" then

 	ckg_cmask	 <= (others => '0');
 	ckg_rmask	 <= "0011";

elsif layer_fc = "01" and cnt2 = "0101" then

 	ckg_cmask	 <= (others => '0');
 	ckg_rmask	 <= "0111";
	
elsif layer_fc = "10" then

 	ckg_cmask	 <= (others => '0');
 	ckg_rmask	 <= "0001";	
	
elsif layer_fc = "11" then                     -- when layer_fc is 11 there is the possibility to turn down all the PE array

 	ckg_cmask	 <= (others => '1');
 	ckg_rmask	 <= (others => '1');	
	
else 

 	ckg_cmask	 <= (others => '0');
 	ckg_rmask	 <= (others => '0');	
	 
end if; 
end process;  

end architecture; 