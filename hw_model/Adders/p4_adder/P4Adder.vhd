library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all ;

entity P4Adder is
	
	Generic (	nBits 	: 		integer := 16;
				step 	: 		integer := 4
			);

   	Port 	( 	A 		: in  	signed (nBits-1 downto 0);
          		B 		: in  	signed (nBits-1 downto 0);
          		cin 	: in  	STD_LOGIC;
          		S 		: out 	signed (nBits-1 downto 0)
			);
end P4Adder;

architecture Structural of P4Adder is

	signal carries : signed(nBits/step-1 downto 0);
	signal tmp : signed(nBits/step downto 0);
	
	component sparseTree is
  
		generic (	nBits : integer := 16; 
					step 	: integer := 4	
				);
				
		port 	( 	A 		: in signed(nBits-1 downto 0);
					B 		: in signed(nBits-1 downto 0);
					cin 	: in std_logic;
					cout 	: out signed(nBits/step-1 downto 0)
				);
		  
	end component;
	
	component carrySelect is
  
		generic (	nBits : integer := 16;
					step : integer := 4
				);
		port 	(  	A : in signed(nBits-1 downto 0);
					B : in signed(nBits-1 downto 0);
					cIn : in signed(nBits/step downto 0);
					S : out signed(nBits-1 downto 0)
				);
	end component;

begin

  	tmp <= carries & cin; 

  	-- I put together the sparse tree and the carry select
	
	m_carrySelect : carrySelect 	generic map (	nBits => nBits,
													step => step
												)
									port map 	( 	A => A,
													B => B,
													cIn => tmp,
													S => S
												);
	
	m_sparseTree : sparseTree 		generic map (	nBits => nBits,
													step => step
												)
									port map 	( 	A => A,
													B => B,
													cin => cin,
													cout => carries
												);

end architecture;