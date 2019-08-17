library ieee ;
  use ieee.std_logic_1164.all ;
  use ieee.numeric_std.all ;
  use ieee.math_real.all ; -- for UNIFORM, TRUNC


entity sk_add_tb is

end entity ;

architecture test of sk_add_tb is

 component add_sk16 is
 
 generic ( n : integer );

    port ( 
           a,b : in  signed(15 downto 0);
           ci  : in  std_logic;
           s   : out signed(15 downto 0);
           co  : out std_logic
	     );
 end component add_sk16;

  signal a_tb     : signed(15 downto 0);
  signal b_tb     : signed(15 downto 0);
  signal ci_tb    : std_logic;
  signal s_tb     : signed(15 downto 0);
  signal co_tb    : std_logic;

begin

  DUT : add_sk16 
  
    generic map ( n => 16)

  port map    (
                a   => a_tb, 
                b   => b_tb, 
                ci  => ci_tb, 
                s   => s_tb, 
                co  => co_tb
              ); 

random: process
  variable seed1, seed2: positive;

  variable rand_1: real;
  variable rand_2: real;

  variable int_rand_1: integer;
  variable int_rand_2: integer;

  variable sum: signed(15 downto 0);

begin
  ci_tb   <= '0';
  a_tb    <= to_signed(0, a_tb'LENGTH);
  b_tb    <= to_signed(0, b_tb'LENGTH);
  wait for 5 ns;


  for i in 1 to 5 loop
    -- Random number generation
    UNIFORM(seed1, seed2, rand_1);
    UNIFORM(seed1, seed2, rand_2);

    int_rand_1 := INTEGER(TRUNC(rand_1*65536.0 - 32769.0)); -- 2^16 and (2^16)/2 + 1 
    int_rand_2 := INTEGER(TRUNC(rand_2*65536.0 - 32769.0));

    a_tb    <= to_signed(int_rand_1, a_tb'LENGTH);
    b_tb    <= to_signed(int_rand_2, b_tb'LENGTH);

    -- Reference architecture
    sum     := a_tb + b_tb;

    -- Assert
    assert (s_tb = sum) report "There is a bug." severity warning;  -- nothing is written if the sum is correct 
    wait for 5 ns;
  end loop;

  wait;

end process;


end architecture ;
