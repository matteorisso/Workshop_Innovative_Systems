library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;
use ieee.math_real.all ; -- for UNIFORM, TRUNC

entity p4_tb is
end entity ; -- p4_tb

architecture arch of p4_tb is

component P4Adder is
	
	Generic (	nBits : integer;
				step  : integer
			);

   	Port 	( 	A 		: in  	signed (nBits-1 downto 0);
          		B 		: in  	signed (nBits-1 downto 0);
          		cin 	: in  	STD_LOGIC;
          		S 		: out 	signed (nBits-1 downto 0)
			);
end component P4Adder;

  signal A_TB     : signed(16-1 downto 0);
  signal B_TB     : signed(16-1 downto 0);
  signal Ci_TB    : std_logic;
  signal S_TB     : signed(16-1 downto 0);

begin

  DUT : P4Adder
  generic map (
                nBits => 16,
				step => 4
              )  

  port map    (
                A      => A_TB, 
                B      => B_TB, 
                cin => Ci_TB, 
                S    => S_TB
              ); 

random: process
  variable seed1, seed2: positive;

  variable rand_1: real;
  variable rand_2: real;

  variable int_rand_1: integer;
  variable int_rand_2: integer;

  variable sum: signed(16-1 downto 0);

begin
  Ci_TB   <= '0';
  A_TB    <= to_signed(0, A_TB'LENGTH);
  B_TB    <= to_signed(0, B_TB'LENGTH);
  wait for 5 ns;


  for I in 1 to 10 loop
    -- Random number generation
    UNIFORM(seed1, seed2, rand_1);
    UNIFORM(seed1, seed2, rand_2);

    int_rand_1 := INTEGER(TRUNC(rand_1*65536.0 - 32769.0));
    int_rand_2 := INTEGER(TRUNC(rand_2*65536.0 - 32769.0));

    A_TB    <= to_signed(int_rand_1, A_TB'LENGTH);
    B_TB    <= to_signed(int_rand_2, B_TB'LENGTH);

    -- Reference architecture
    sum     := A_TB + B_TB;

    -- Assert
    assert (S_TB = sum) report "There is a bug." severity warning;
    wait for 5 ns;
  end loop;

  wait;

end process;


end architecture ; -- arch
