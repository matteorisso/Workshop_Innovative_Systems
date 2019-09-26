library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all ;

entity add_sub is

generic( n : natural); 

port ( 
       sign   : in  std_logic;
       a, b   : in  signed (n-1 downto 0);
       res    : out signed (n-1 downto 0)
--     c_out  : out std_logic
	   
	  );	  
end entity;


architecture structural of add_sub is

component fa

port  (	
        a   :	in	std_logic;
        b   :	in	std_logic;
        ci  :	in	std_logic;
        co  :	out	std_logic;
        sum :	out	std_logic		
		
        );	
end component;

-- Define a signal for internal carry bits
signal c      : signed (n downto 0);
signal b_comp : signed (n-1 downto 0);

begin
    -- add/subtract select to carry input (weights(k-1) = 1 for subtract)
    c(0) <= sign;

    adders: for i in 0 to n-1 generate
	
    --invert b for subtract function (b(i) xor 1,)
    --do not invert b for add function (b(i) xor 0)
    b_comp(i) <= b(i) xor sign;
 
    adder: fa port map ( a(i), b_comp(i), c(i), c(i+1), res(i) );

    end generate;

    -- c_out <= c(n);

end structural;