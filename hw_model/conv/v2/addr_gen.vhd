library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity addr_gen is 
port(
		ck  					: in 	std_logic;
		rst 					: in 	std_logic;
		
		inc					: in 	std_logic;
		arv_tilev			: in 	unsigned(clog2v-1 downto 0);
		arv_tileh			: in	unsigned(clog2h-1 downto 0);
		arv_tileb			: in 	unsigned(clog2b-1 downto 0);
		arv_tilec			: in 	unsigned(clog2c-1 downto 0); 
		
		s_tc_tilev			: out std_logic; 
		s_tc_tileh			: out std_logic;
		s_tc_tileb			: out std_logic; 
		s_tc_tilec			: out std_logic;
		
		even_addr			: out unsigned(clog2m-1 downto 0);
		odd_addr				: out unsigned(clog2m-1 downto 0)
		);		
end entity;

architecture rtl of addr_gen is 

component countern 
generic ( N	: natural := 16 );    
port( 
	ck 			: in std_logic; 
	rst			: in std_logic; 
	sync_clr		: in std_logic; 
	en 			: in std_logic;
	arv			: in unsigned(N-1 downto 0); -- auto-reload value
	q 				: out unsigned(N-1 downto 0); 
	tc				: out std_logic
	);
end component;

signal int_en_tilev_ptr : std_logic;
signal int_en_tileh_ptr : std_logic;
signal int_en_tileb_ptr : std_logic;
signal int_en_tilec_ptr : std_logic;

signal int_tc_tilev 		: std_logic;
signal int_tc_tileh 		: std_logic;
signal int_tc_tileb 		: std_logic;
signal int_tc_tilec 		: std_logic;

signal int_tilev_ptr 	: unsigned(clog2v-1 downto 0);  
signal int_tileh_ptr 	: unsigned(clog2v-1 downto 0);   
--signal int_tileb_ptr 	: unsigned(clog2b-1 downto 0);  
--signal int_tilec_ptr 	: unsigned(clog2c-1 downto 0); 

signal int_arv_tilev 	: unsigned(clog2v-1 downto 0);
signal int_arv_tileh 	: unsigned(clog2v-1 downto 0);
signal int_arv_tileb 	: unsigned(clog2b-1 downto 0);
signal int_arv_tilec 	: unsigned(clog2c-1 downto 0);

signal int_en_page_ptr	: std_logic;
signal int_tc_page		: std_logic;
signal int_page_ptr		: unsigned(int_arv_tileh'high downto 0);

signal int_inc_even 		: std_logic;
signal int_inc_odd		: std_logic;
signal int_even_offset 	: unsigned(clog2m-1 downto 0); 
signal int_odd_offset	: unsigned(clog2m-1 downto 0); 
signal int_offset_val 	: unsigned(clog2m-1 downto 0); 

signal int_even_addr		: unsigned(clog2m-1 downto 0); 
signal int_odd_addr		: unsigned(clog2m-1 downto 0); 

begin

int_en_tilev_ptr 	<= inc;
int_en_tileh_ptr 	<= int_tc_tilev 	and int_en_tilev_ptr;
int_en_tileb_ptr	<= int_tc_tileh 	and int_en_tileh_ptr;
int_en_tilec_ptr	<= int_tc_tileb 	and int_en_tileb_ptr;

int_arv_tilev		<= arv_tilev;
int_arv_tileh		<= arv_tileh;
int_arv_tileb		<= arv_tileb;
int_arv_tilec		<= arv_tilec;

int_en_page_ptr 	<= int_tc_tilev and int_en_tilev_ptr;
int_offset_val		<= to_unsigned(to_integer(int_arv_tilev+1), int_offset_val'length); 

int_inc_even		<= (int_en_tileh_ptr and (not int_page_ptr(0))) or (int_tc_tileh and int_en_tileh_ptr);
int_inc_odd			<= (int_en_tileh_ptr and int_page_ptr(0)) 		or (int_tc_tileh and int_en_tileh_ptr);

s_tc_tilev 			<= int_tc_tilev;	
s_tc_tileh			<= int_tc_tileh;
s_tc_tileb			<= int_tc_tileb;
s_tc_tilec 			<= int_tc_tilec; 

even_addr			<= int_even_addr;
odd_addr				<= int_odd_addr;

tilev_cnt:
countern generic map (N => int_arv_tilev'length) port map (
	ck 			=> ck, 
	rst 			=> rst, 
	sync_clr 	=> '0',
	en 			=> int_en_tilev_ptr, 
	arv 			=> int_arv_tilev,
	q 				=> int_tilev_ptr,
	tc 			=> int_tc_tilev
	);

tileh_cnt: 
countern generic map (N => int_arv_tileh'length) port map (
	ck 			=> ck, 
	rst 			=> rst, 
	sync_clr 	=> '0',
	en	 			=> int_en_tileh_ptr, 
	arv			=> int_arv_tileh, 
--	q 				=> int_tileh_ptr,
	tc				=> int_tc_tileh
	);

tileb_cnt: 
countern generic map (N => int_arv_tileb'length) port map (
	ck 			=> ck, 
	rst 			=> rst, 
	sync_clr 	=> '0',
	en 			=> int_en_tileb_ptr, 
	arv 			=> int_arv_tileb,
--	q	 			=> int_tileb_ptr,
	tc 			=> int_tc_tileb
	);
									
tilec_cnt: 
countern generic map (N => int_arv_tilec'length) port map (
	ck 			=> ck, 
	rst 			=> rst, 
	sync_clr 	=> '0',
	en 			=> int_en_tilec_ptr, 
	arv 			=> int_arv_tilec,
--	q	 			=> int_tilec_ptr,
	tc 			=> int_tc_tilec
	);
	
page_cnt:
countern generic map (N => int_arv_tileh'length) port map (
	ck 			=> ck, 
	rst 			=> rst, 
	sync_clr 	=> '0',
	en	 			=> int_en_page_ptr, 
	arv			=> int_arv_tileh, 
	q 				=> int_page_ptr
--	,tc				=> int_tc_page
	);
		
even_addr_gen:
process(ck,rst)
begin
	if rst = '1' then
		int_even_addr 			<= (others=>'0');
		int_even_offset	  	<= (others=>'0'); 
		
	elsif rising_edge(ck) then
		int_even_addr 	<= int_even_offset + int_tilev_ptr;  
		if int_inc_even = '1' then
			int_even_offset <= int_even_offset + int_offset_val;
		end if; 
	end if;
end process;

odd_addr_gen:
process(ck,rst)
begin
	if rst = '1' then
		int_odd_addr 			<= (others=>'0');
		int_odd_offset	  		<= (others=>'0'); 
		
	elsif rising_edge(ck) then
		int_odd_addr 	<= int_odd_offset + int_tilev_ptr;  
		if int_inc_odd = '1' then
			int_odd_offset <= int_odd_offset + int_offset_val;
		end if; 
	end if;
end process;

end architecture;
