library ieee ;
  use ieee.std_logic_1164.all ;
  use ieee.numeric_std.all ;
  use ieee.math_real.all ; -- for UNIFORM, TRUNC


entity rca_tb is
end entity ; -- rca_tb

architecture arch of rca_tb is

  component RCA is 
    generic (
              N_BIT : integer
            );
    port    ( 
              A     : in  signed(N_BIT-1 downto 0);
              B     : in  signed(N_BIT-1 downto 0);
              Ci    : in  std_logic;
              S     : out signed(N_BIT-1 downto 0);
              Co    : out std_logic
            );
  end component RCA; 

  signal A_TB     : signed(31 downto 0);
  signal B_TB     : signed(31 downto 0);
  signal Ci_TB    : std_logic;
  signal S_TB     : signed(31 downto 0);
  signal Co_TB    : std_logic;

begin

  DUT : RCA 
  generic map (
                N_BIT => 32
              )
  port map    (
                A   => A_TB, 
                B   => B_TB, 
                Ci  => Ci_TB, 
                S   => S_TB, 
                Co  => Co_TB
              ); 

random: process
  variable seed1, seed2: positive;

  variable rand_1: real;
  variable rand_2: real;

  variable int_rand_1: integer;
  variable int_rand_2: integer;

  variable sum: signed(31 downto 0);

begin
  Ci_TB   <= '0';
  A_TB    <= to_signed(0, A_TB'LENGTH);
  B_TB    <= to_signed(0, B_TB'LENGTH);
  wait for 5 ns;


  for I in 1 to 5 loop
    -- Random number generation
    UNIFORM(seed1, seed2, rand_1);
    UNIFORM(seed1, seed2, rand_2);

    int_rand_1 := INTEGER(TRUNC(rand_1*4294967296.0 - 2147483649.0));
    int_rand_2 := INTEGER(TRUNC(rand_2*4294967296.0 - 2147483649.0));

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
