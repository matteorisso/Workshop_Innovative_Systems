library ieee;
use ieee.std_logic_1164.all;
use work.fixed_pkg.all;

entity binary_adder_tree is
generic ( qi : natural := 8; qf : natural := 8);
port(
		ck 		: in std_logic;
		rstn		: in std_logic;
		a			: in  sfixed(qi-1 downto -qf);
		b			: in  sfixed(qi-1 downto -qf);
		c			: in  sfixed(qi-1 downto -qf);
		d			: in  sfixed(qi-1 downto -qf);
		e			: in  sfixed(qi-1 downto -qf);
		result	: out sfixed(qi-1 downto -qf));
		
end entity;

architecture behavior of binary_adder_tree is

-- bit growth in sfixed +operator overloading
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
			;cout : out std_logic
			);
end component;


component regn
generic ( qi : natural:= 1; qf : natural:= 15 ) ;	
port (
			d 		:	in sfixed(qi-1 downto -qf);
			ck 	:	in std_logic;  
			rstn	:	in std_logic;  
			en		:	in std_logic;
			q  	:  out sfixed(qi-1 downto -qf));

end component; 

signal dsum1, dsum2, dsum3, dsum4 : sfixed( qi-1 downto -qf ) ;
signal qsum1, qsum2, qsum3			 : sfixed( qi-1 downto -qf ) ;

signal qpipe00, qpipe01, qpipe02, qpipe03, qpipe04 : sfixed( qi-1 downto -qf ) ;
signal qpipe10, qpipe11, qpipe12, qpipe13, qpipe14 : sfixed( qi-1 downto -qf ) ;

begin

s0_0: adder generic map ( qi => qi, qf => qf ) port map (qpipe10,qpipe11,dsum1);
s0_1: adder generic map ( qi => qi, qf => qf ) port map (qpipe12,qpipe13,dsum2);
s1_0: adder generic map ( qi => qi, qf => qf ) port map (qsum1,qsum2,dsum3);
s1_1: adder generic map ( qi => qi, qf => qf ) port map (qsum3,qpipe14,dsum4);

r0_0: regn generic map ( qi => qi, qf => qf ) port map (dsum1, ck, rstn, '1', qsum1);
r0_1: regn generic map ( qi => qi, qf => qf ) port map (dsum2, ck, rstn, '1', qsum2);
r1_0: regn generic map ( qi => qi, qf => qf ) port map (dsum3, ck, rstn, '1', qsum3);
r1_1: regn generic map ( qi => qi, qf => qf ) port map (dsum4, ck, rstn, '1', result);

-- 2 pipe stages : omap pixel available after one node period ( 5 ck of inner loop )

d0_0: regn generic map ( qi => qi, qf => qf ) port map (a, ck, rstn, '1', qpipe00);
d0_1: regn generic map ( qi => qi, qf => qf ) port map (b, ck, rstn, '1', qpipe01);
d0_2: regn generic map ( qi => qi, qf => qf ) port map (c, ck, rstn, '1', qpipe02);
d0_3: regn generic map ( qi => qi, qf => qf ) port map (d, ck, rstn, '1', qpipe03);
d0_4: regn generic map ( qi => qi, qf => qf ) port map (e, ck, rstn, '1', qpipe04);

d1_0: regn generic map ( qi => qi, qf => qf ) port map (qpipe00, ck, rstn, '1', qpipe10);
d1_1: regn generic map ( qi => qi, qf => qf ) port map (qpipe01, ck, rstn, '1', qpipe11);
d1_2: regn generic map ( qi => qi, qf => qf ) port map (qpipe02, ck, rstn, '1', qpipe12);
d1_3: regn generic map ( qi => qi, qf => qf ) port map (qpipe03, ck, rstn, '1', qpipe13);
d1_4: regn generic map ( qi => qi, qf => qf ) port map (qpipe04, ck, rstn, '1', qpipe14);



end architecture; 
