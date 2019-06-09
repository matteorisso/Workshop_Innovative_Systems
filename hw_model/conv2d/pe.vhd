library ieee;
use ieee.std_logic_1164.all;
use work.fixed_pkg.all; 

entity pe is
generic ( 	qi : natural:= 8; qf : natural:= 8 );
port (	
			ck, rstn : in 	std_logic; 	
			im, k  	: in  sfixed( qi-1 downto -qf );
			psum	 	: out sfixed( qi-1 downto -qf ));
			
end entity;

architecture mac of pe is


component multiplier
generic (	qi : natural:= 8; qf : natural:= 8 );
port (
			a, b 	: in 	sfixed(qi-1 downto -qf);
			res	: out sfixed(2*qi-1 downto -2*qf));
end component;

component adder
generic ( 	qi : natural:= 8; qf : natural:= 8 );
port (
			a, b 	: in 	sfixed(qi-1 downto -qf);
		--	cin 	: in  std_logic;
			res	: out sfixed(qi-1 downto -qf)
		--	;cout : out std_logic
			);
end component; 

component regn
generic (qi : natural:= 1; qf : natural:= 15);	
port(
		d 	:	in sfixed(qi-1 downto -qf);
		ck, 
		rstn, 
		en	:	in std_logic;
		q  :  out sfixed(qi-1 downto -qf));
end component;

signal rstn_acc : std_logic; 

-- fractional scaling Q1.X 
-- mpy result in Q1.(2*X)
-- bit-growth : approx floor( log2( k 2**(qi-1) ) : k = #ops
-- 2 bit gain 

constant nqi  : natural := 1; 
constant nqf  : natural := psum'length-1; 
constant bitg : natural := 2; 

signal mpy_a, mpy_b : sfixed(nqi-1 downto -nqf) ; 		
signal mpy_tmp 	  : sfixed(nqi downto -2*nqf ) ;		
signal mpy_res		  : sfixed( nqi+bitg -1 downto -2*nqf ) ;
 	
signal d_acc    : sfixed( nqi+bitg -1 downto -2*nqf ) ; 	
signal q_acc    : sfixed( nqi+bitg -1 downto -2*nqf ) ; 	

begin

mul 	: multiplier	generic map ( qi => nqi, 	   qf => nqf   ) port map (mpy_a, mpy_b, mpy_tmp);
add	: adder			generic map ( qi => nqi+bitg, qf => 2*nqf ) port map (mpy_res, q_acc, d_acc);
acc	: regn			generic map ( qi => nqi+bitg, qf => 2*nqf ) port map (d_acc, ck, rstn, '1', q_acc);

-- *//* memo --
-- adder tree pipe(output freeze to avoid switching @acc sampling during inner loop)

mpy_a 	<= im ; 

mpy_b 	<= k ;					

mpy_res 	<= mpy_tmp(mpy_tmp'high) & mpy_tmp ;						

-- *//* generic scaling ? 

psum 		<= q_acc( nqi+bitg-1 downto -(nqf-nqi-bitg+1) ); 	 

--round-off noise ?

-- *//*round
--of_in  <= resize(q_acc, qi-1, -qf) ; 
-- *//* generic scaling  :
--mpy_a 	 <= resize(a, nqi-1, -nqf); 	
--mpy_b 	 <= resize(b, nqi-1, -nqf); 	
--mpy_res <= resize(mpy_tmp, nqi+bitg-1, -2*nqf);


end architecture mac; 