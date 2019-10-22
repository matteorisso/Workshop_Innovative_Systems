library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity mux_c is                                         
 
    port ( 
	       sel : in  std_logic_vector(1 downto 0);
           o   : out unsigned (8 downto 0)
		   
		  );
		  
end mux_c;

architecture beh of mux_c is

begin

p_mux_c: process(sel)
begin

  case sel is
  
    when "00"      =>  o <= "110010000";
    when "01"      =>  o <= "001111000";
    when "10"      =>  o <= "001010100";
    when others    =>  o <= "000000000";
	
  end case;
end process;
	
end beh;