library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity mux_c2 is                                         
 
    port ( 
	       sel : in  std_logic_vector(1 downto 0);
           o   : out unsigned (3 downto 0)
		   
		  );
		  
end mux_c2;

architecture beh of mux_c2 is

begin

p_mux_c2: process(sel)
begin

  case sel is
  
    when "00"      =>  o <= "1000";
    when "01"      =>  o <= "0110";
    when "10"      =>  o <= "0010";
    when others    =>  o <= "0000";
	
  end case;
end process;
	
end beh;