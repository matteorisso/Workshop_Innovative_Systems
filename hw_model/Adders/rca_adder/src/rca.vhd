library ieee; 
  use ieee.std_logic_1164.all; 
  use ieee.numeric_std.all ;


entity RCA is 
  generic (
            N_BIT : integer := 32
          );
  port    (	
                A     :	in	signed(N_BIT-1 downto 0);
        		B     :	in	signed(N_BIT-1 downto 0);
        		Ci    :	in	std_logic;
        		S     :	out	signed(N_BIT-1 downto 0);
        		Co    :	out	std_logic
          );
end RCA; 

architecture STRUCTURAL of RCA is

  signal STMP : signed(N_BIT-1 downto 0);
  signal CTMP : signed(N_BIT downto 0);

  component FA 
  port  ( 
          A     :	in	std_logic;
          B     :	in	std_logic;
          Ci    :	in	std_logic;
          S     :	out	std_logic;
          Co    :	out	std_logic
        );
  end component; 

begin

  CTMP(0) <= Ci;
  S       <= STMP;
  Co      <= CTMP(N_BIT);
  
  FA_0_N_BIT_2: 
  for I in 1 to N_BIT-1 generate
    FAI : FA 
    port map  (
                A   => A(I-1), 
                B   => B(I-1), 
                Ci  => CTMP(I-1), 
                S   => STMP(I-1), 
                Co  => CTMP(I)
              ); 
  end generate;

    FA_N_BIT_1 : FA 
    port map  (
                A   => A(N_BIT-1), 
                B   => B(N_BIT-1), 
                Ci  => CTMP(N_BIT-1), 
                S   => STMP(N_BIT-1), 
                Co  => CTMP(N_BIT)
              ); 

end STRUCTURAL;