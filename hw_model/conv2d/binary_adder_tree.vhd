library ieee;
use ieee.std_logic_1164.all;
use work.fixed_pkg.all;

entity binary_adder_tree is
generic ( qi : natural := 8; qf : natural := 8);
port(
		ck, rstn	: in std_logic;
		a, b, c, d, e 
					: in  sfixed(qi-1 downto -qf);
		result	: out sfixed(qi-1 downto -qf));
end entity;

architecture behavior of binary_adder_tree is

-- account bit growth in sfixed +operator overloading
signal sum1,sum2,sum3,sum4 : sfixed( qi downto -qf ) ;

begin
	
process (ck)
begin
pipeline:
	if (rising_edge(ck)) then
		if rstn = '0' then

			sum1 <= (others =>'0');
			sum2 <= (others =>'0');
			sum3 <= (others =>'0');
			sum4 <= (others =>'0');
		else
		
			sum1 <= a + b;
			sum2 <= c + d;
			sum3 <= sum1(qi-1 downto -qf) + sum2(qi-1 downto -qf);
			sum4 <= sum3(qi-1 downto -qf) + e;
		end if;
	end if;
end process;

result <= sum4(qi-1 downto -qf);
	
end architecture behavior;




architecture structure of binary_adder_tree is


component adder
generic ( 	qi : natural:= 8;qf : natural:= 8 );
port (
			
			a, b 	: in 	sfixed(qi-1 downto -qf);
		--	cin 	: in  std_logic;
			res	: out sfixed(qi-1 downto -qf)
		--	;cout : out std_logic
			);
end component;


component regn
generic ( qi : natural:= 1; qf : natural:= 15 ) ;	
port (
			d 	:	in sfixed(qi-1 downto -qf);
			ck, 
			rstn, 
			en	:	in std_logic;

			q  :  out sfixed(qi-1 downto -qf));
end component; 

signal dsum1, dsum2, dsum3, dsum4 : sfixed( qi-1 downto -qf ) ;
signal qsum1, qsum2, qsum3			 : sfixed( qi-1 downto -qf ) ;

begin

s0_0: adder generic map ( qi => qi, qf => qf ) port map (a,b,dsum1);
s0_1: adder generic map ( qi => qi, qf => qf ) port map (c,d,dsum2);
s1_0: adder generic map ( qi => qi, qf => qf ) port map (qsum1,qsum2,dsum3);
s1_1: adder generic map ( qi => qi, qf => qf ) port map (qsum3,e,dsum4);

r0_0: regn generic map ( qi => qi, qf => qf ) port map (dsum1, ck, rstn, '1', qsum1);
r0_1: regn generic map ( qi => qi, qf => qf ) port map (dsum2, ck, rstn, '1', qsum2);
r1_0: regn generic map ( qi => qi, qf => qf ) port map (dsum3, ck, rstn, '1', qsum3);
r1_1: regn generic map ( qi => qi, qf => qf ) port map (dsum4, ck, rstn, '1', result);
end architecture; 
