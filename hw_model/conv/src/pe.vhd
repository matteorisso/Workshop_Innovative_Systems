library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PE is 
generic( N : natural:= 4;  G : natural:= 7); 
port(
	ck : in std_logic;
	rst: in std_logic; 
	en	: in std_logic;
	k  : in std_logic;
	i_data: in signed(N-1 downto 0);
	o_data: out signed(N-1+G downto 0));
end entity;

architecture structure of PE is

signal int_en : std_logic;

signal q_im  : signed(N-1 downto 0);
signal sgnext: signed(N-1+G downto 0); 
signal d_acc : signed(N-1+G downto 0);
signal q_acc : signed(N-1+G downto 0);
signal q_k 	 : std_logic;

begin
add: 
entity work.adder_subn 	generic map(N => N+G)
					port map(
								a 			=> q_acc, 
								b 			=> sgnext, 
								add_subn => q_k, 
								res 		=> d_acc);

sgnext(N-1+G downto N-1)<= (others=> q_im(q_im'high));
sgnext(N-1 downto 0)<= q_im;  

int_en <= rst or en; 

process(ck,int_en)
begin
if ck'event and ck='1' and int_en = '1' then
	if rst = '1' then
		q_im 	<= (others=>'0');
		q_acc <= (others=>'0');
		q_k 	<= '0';
	else
		q_acc <= d_acc;
		q_im 	<= i_data;
		q_k 	<= not k;  
	end if;
end if;
end process;

o_data <= q_acc; 

end architecture; 
	