library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all ;
 
entity Carry_Look_Ahead is

generic ( n: integer := 16 );

Port ( 
       A    : in signed (n-1 downto 0);
       B    : in signed (n-1 downto 0);
       Cin  : in std_logic;
       S    : out signed (n-1 downto 0);
       Cout : out std_logic
	  );
	  
end Carry_Look_Ahead;
 
architecture Behavioral of Carry_Look_Ahead is
 
component Partial_Full_Adder

Port ( 
       A    : in std_logic;
       B    : in std_logic;
       Cin  : in std_logic;
       S    : out std_logic;
       P    : out std_logic;
       G    : out std_logic
	  );
end component;
 
signal c      : signed(n downto 0);
signal p,g    : signed(n-1 downto 0);

begin

c(0) <= Cin;
Cout <= c(n);


  PFA_0_N_BIT_2: 
  for i in 1 to n-1 generate
    PFAI : Partial_Full_Adder 
    port map  (
                A    => A(i-1), 
                B    => B(i-1), 
                Cin  => c(i-1), 
                S    => S(i-1), 
				P    => p(i-1),
				G    => g(i-1)
              ); 
  end generate;

    PFA_N_BIT_1 : Partial_Full_Adder 
    port map  (
                A    => A(n-1), 
                B    => B(n-1), 
                Cin  => c(n-1), 
                S    => S(n-1), 
				P    => p(n-1),
				G    => g(n-1)				
              ); 
			  
carry:  for i in 1 to n-1 generate
  
c(i)   <= g(i-1) or (p(i-1) and c(i-1));
  
 end generate carry;
 
end Behavioral;

