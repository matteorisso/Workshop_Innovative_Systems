library IEEE;
use IEEE.std_logic_1164.ALL;
 
entity Partial_Full_Adder is

Port ( 
       A   : in std_logic;
       B   : in std_logic;
       Cin : in std_logic;
       S   : out std_logic;
       P   : out std_logic;
       G   : out std_logic
	  );
	  
end Partial_Full_Adder;
 
architecture Behavioral of Partial_Full_Adder is
 
begin
 
S <= A xor B xor Cin;
P <= A xor B;
G <= A and B;
 
end Behavioral;
