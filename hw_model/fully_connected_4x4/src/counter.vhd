library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity counter is

generic( n : natural ); 

   port(
   
 	    clk   : in  std_logic;
 	    rst   : in  std_logic;
		en    : in  std_logic;
 	    cnt   : out std_logic_vector(n-1 downto 0)		
		);
		
end entity;
 
architecture beh of counter is

   signal tmp: std_logic_vector(n-1 downto 0);
   
begin   

  process(clk, rst)
  
    begin
	
      if rst = '1' then
	  
         tmp <= (others=>'0');
		 
      elsif(rising_edge(clk)) then
	  
         if en ='1' then
			
               tmp <= tmp + 1;
			   
         end if;
      end if;
	  
   end process;
   
   cnt <= tmp;
   
end beh;