library ieee;
use ieee.std_logic_1164.all;

use work.fixed_pkg.all; 


entity pe is 
generic( qi : natural:= 8; qf : natural:=8 );
port(
		ck 			: in std_logic; 
		rstn		: in std_logic; 
		ld_v 		: in std_logic;
		ld_h 		: in std_logic; 
		sel			: in std_logic;
		weight		: in sfixed(qi-1 downto -qf);
		pe_right 	: in sfixed(qi-1 downto -qf);
		pe_bottom	: in sfixed(qi-1 downto -qf);
		pe_top		: out sfixed(qi-1 downto -qf);
		pe_left		: out sfixed(qi-1 downto -qf);
		omap		: out sfixed(qi-1 downto -qf));
		
end entity; 




architecture structure of pe is




component adder
generic ( qi : natural:= 8; qf : natural:= 8 );
port (
			a, b 	: in 	sfixed(qi-1 downto -qf);
		--	cin 	: in  std_logic;
			res	: out sfixed(qi-1 downto -qf);
			cout : out std_logic);
end component; 

component multiplier
generic ( qi : natural:= 8; qf : natural:= 8 );
port (
			a, b 	: in 	sfixed(qi-1 downto -qf);
			res	: out sfixed(2*qi-1 downto -2*qf));
end component;

component regn
generic ( qi : natural:= 1; qf : natural:= 15 ) ;	
port(
		d 	:	in sfixed(qi-1 downto -qf);
		ck, 
		rstn, 
		en	:	in std_logic;
		q  :  out sfixed(qi-1 downto -qf));
end component; 


signal d_reg : sfixed(qi-1 downto -qf);
signal q_reg : sfixed(qi-1 downto -qf);

-- fractional scaling Q1.X
constant nqi : natural := 1; 
constant nqf : natural := pe_right'length-1; 

signal mpy_a	: sfixed(nqi-1 downto -nqf) ;
signal mpy_b 	: sfixed(nqi-1 downto -nqf) ; 		
signal mpy_tmp 	: sfixed(nqi downto -2*nqf) ;		
 	
-- bit-growth + chopping mpy_res (2*nqf to nqf)
-- NB: truncation yields negative bias error

constant bitg : natural := 2; 

signal mpy_res : sfixed( nqi+bitg -1 downto -nqf ) ;
signal d_acc   : sfixed( nqi+bitg -1 downto -nqf ) ; 	
signal q_acc   : sfixed( nqi+bitg -1 downto -nqf ) ; 	

begin

with sel select d_reg <= pe_right when '0', pe_bottom when others; 

regh	: regn			generic map ( qi => nqi, qf => nqf ) port map (d_reg, ck, rstn, ld_h, q_reg);
regv	: regn			generic map ( qi => nqi, qf => nqf ) port map (d_reg, ck, rstn, ld_v, pe_top);

mpy_a 	<= 	q_reg; 
mpy_b 	<= 	weight; 
mpy_res <=		mpy_tmp( mpy_tmp'high ) & 	
				mpy_tmp( mpy_tmp'high downto - nqf ) ;


mul : multiplier	generic map ( qi => nqi, 	  qf => nqf ) port map (mpy_a, mpy_b, mpy_tmp);
add	: adder			generic map ( qi => nqi+bitg, qf => nqf ) port map (mpy_res, q_acc, d_acc);
acc	: regn			generic map ( qi => nqi+bitg, qf => nqf ) port map (d_acc, ck, rstn, '1', q_acc);



pe_left	<= q_reg; 
omap 	<= q_acc(nqi+bitg-1 downto -(nqf-bitg)) ;  

end architecture; 

