library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tanh is
port(
     A : in std_logic_vector (7 downto -8);
     O : out std_logic_vector (7 downto -8)
     );
end entity;

architecture behavioral of tanh is
 
--signals
signal s1, s2 : std_logic_vector(7 downto -8);

--components
component sub is
  port (A,B : IN std_logic_vector (7 downto -8);    
        Y :   OUT std_logic_vector (7 downto -8)
        );
end component;

component RALU is
    port (
        AD : in std_logic_vector(7 downto -8);
        OT : out std_logic_vector(7 downto -8);
end component;

component comp is
port (  A : in std_logic_vector (7 downto -8);  
        O : out std_logic_vector(7 downto -8);
       ); 
end component;

--port map
begin 
  
LUT: RALU port map(AD=>A, OT=>s1);

comparator: comp port map(A=>A, O=>s2);

subtractor: sub port map(A=>sl, B=>s2, Y=>O);
  
end architecture;