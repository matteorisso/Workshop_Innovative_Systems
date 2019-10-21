library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.globals.all;

entity imem_w_tb is
end entity;

architecture test_wr_cs of imem_w_tb is 

signal ck_tb	: std_logic; 
signal rst_tb	: std_logic; 

signal i_data_even_tb 	: mem_data_t:=(others=>(others=>'0')); 
signal i_data_odd_tb		: mem_data_t:=(others=>(others=>'0'));

signal even_wr_addr_tb 	: unsigned(clog2M-1 downto 0):=(others=>'0');
signal even_rd_addr_tb 	: unsigned(clog2M-1 downto 0):=(others=>'0');
signal odd_wr_addr_tb	: unsigned(clog2M-1 downto 0):=(others=>'0');
signal odd_rd_addr_tb	: unsigned(clog2M-1 downto 0):=(others=>'0');
signal rf_ptr_tb			: unsigned(clog2W-1 downto 0):=(others=>'0');
signal px_ptr_tb			: unsigned(clog2K-1 downto 0):=(others=>'0');

signal test_tb	: std_logic:='0';
signal wr_tb : std_logic:='0';
signal rd_tb : std_logic:='0';
signal wr_vect_tb	: std_logic_vector(0 to W-1):=(others=>'0');
signal rd_vect_tb	: std_logic_vector(0 to W-1):=(others=>'0');
signal even_odd_n_tb	: std_logic:='0';

begin

ckgen:
process(ck_tb)
begin
	if ck_tb='U' then 
		ck_tb<='0'; 
	else
		ck_tb<= not ck_tb after 5 ns; 
	end if; 
end process;

ctrl:
process
begin
	wait until rising_edge(ck_tb);
	rst_tb		<='0';
	wr_tb			<='1';
	rd_tb			<='1';
	wait;
end process;

addr_gen:
process(ck_tb)
begin
-- del redundancy
	if rising_edge(ck_tb) then 
		if even_wr_addr_tb = 47 then
			even_wr_addr_tb <= (others=>'0');
			rf_ptr_tb <= rf_ptr_tb+1;
		else 
			even_wr_addr_tb 	<= even_wr_addr_tb+1;
		end if;
		if odd_wr_addr_tb = 47 then
			odd_wr_addr_tb <= (others=>'0');
			rf_ptr_tb <= rf_ptr_tb+1;
		else
			odd_wr_addr_tb		<= odd_wr_addr_tb+1;
		end if;
	end if; 
end process;

stimuli:  
process(ck_tb)
variable px_v 	 :signed(N-1 downto 0):=(others=>'0');
variable word_v :signed(N*W-1 downto 0):=(others=>'0');
begin
	if rising_edge(ck_tb) then
		if test_tb = '0' then
			for i in 0 to W-1 loop 
				word_v(word_v'length-1 - i*px_v'length	downto word_v'length - (i+1)*px_v'length) := px_v+i;
			end loop;
			px_v := px_v+1; 
			i_data_even_tb <= (others=>word_v); 
			i_data_odd_tb	<= (others=>word_v); 
		end if; 
	end if; 
end process;

--DUT

imem:
entity work.imem_w port map (
	ck 				=> ck_tb,
	rst				=> rst_tb,
	test				=> test_tb, 
	cs_all			=> test_tb, 
	i_data_even		=> i_data_even_tb,
	i_data_odd		=> i_data_odd_tb,
	rd					=> rd_vect_tb,
	wr					=> wr_vect_tb,
	even_wr_addr	=> even_wr_addr_tb,
	even_rd_addr	=> even_rd_addr_tb,
	odd_wr_addr		=> odd_wr_addr_tb,
	odd_rd_addr		=> odd_rd_addr_tb,
	even_odd_n		=> even_odd_n_tb,
	rf_ptr			=> rf_ptr_tb,
	px_ptr			=> px_ptr_tb
	);
	
even_rd_addr_tb	<= even_wr_addr_tb;
odd_rd_addr_tb		<= odd_wr_addr_tb;

rd_vect_tb  <= (others=>rd_tb); 
wr_vect_tb  <= (others=>wr_tb);	

end architecture test_wr_cs; 

architecture test_fc_rd   of imem_w_tb is

signal ck_tb	: std_logic; 
signal rst_tb	: std_logic; 

signal i_data_even_tb 	: mem_data_t:=(others=>(others=>'0')); 
signal i_data_odd_tb		: mem_data_t:=(others=>(others=>'0'));

signal even_wr_addr_tb 	: unsigned(clog2M-1 downto 0):=(others=>'0');
signal even_rd_addr_tb 	: unsigned(clog2M-1 downto 0):=(others=>'0');
signal odd_wr_addr_tb	: unsigned(clog2M-1 downto 0):=(others=>'0');
signal odd_rd_addr_tb	: unsigned(clog2M-1 downto 0):=(others=>'0');
signal rf_ptr_tb			: unsigned(clog2W-1 downto 0):=(others=>'0');
signal px_ptr_tb			: unsigned(clog2K-1 downto 0):=(others=>'0');

signal test_tb				: std_logic:='1';
signal wr_tb				: std_logic:='0';
signal rd_tb          	: std_logic:='0';
signal wr_vect_tb     	: std_logic_vector(0 to W-1):=(others=>'0');
signal rd_vect_tb			: std_logic_vector(0 to W-1):=(others=>'0');
signal even_odd_n_tb		: std_logic:='0';

begin

ckgen:
process(ck_tb)
begin
	if ck_tb='U' then 
		ck_tb<='0'; 
	else
		ck_tb<= not ck_tb after 5 ns; 
	end if; 
end process;

msb_addr_gen:
process(ck_tb)
begin
	if rising_edge(ck_tb) then
		if rf_ptr_tb = 3 then 
			even_odd_n_tb <= '1'; 
		end if; 
	end if; 
end process;

addr_gen:
process(ck_tb)
begin
	if rising_edge(ck_tb) then 
		if even_rd_addr_tb = 47 then
			even_rd_addr_tb <= (others=>'0');
			rf_ptr_tb <= rf_ptr_tb+1;
		elsif px_ptr_tb(px_ptr_tb'high-1 downto 0) = 3 then 
			even_rd_addr_tb 	<= even_rd_addr_tb+1;
		end if;
		if odd_rd_addr_tb = 47 then
			odd_rd_addr_tb <= (others=>'0');
			rf_ptr_tb <= rf_ptr_tb+1;
		elsif px_ptr_tb(px_ptr_tb'high-1 downto 0) = 3 then 
			odd_rd_addr_tb		<= odd_rd_addr_tb+1;
		end if;
	end if; 
end process;

px_addr_gen:
process(ck_tb)
begin
	if rising_edge(ck_tb) then
		px_ptr_tb <= px_ptr_tb+1; 
	end if;
end process;

rd_vect_tb<=(others=>'1');

imem:
entity work.imem_w port map (
	ck 				=> ck_tb,
	rst				=> rst_tb,
	test				=> test_tb, 
	cs_all			=> '0', 
	i_data_even		=> i_data_even_tb,
	i_data_odd		=> i_data_odd_tb,
	rd					=> rd_vect_tb,
	wr					=> wr_vect_tb,
	even_wr_addr	=> even_wr_addr_tb,
	even_rd_addr	=> even_rd_addr_tb,
	odd_wr_addr		=> odd_wr_addr_tb,
	odd_rd_addr		=> odd_rd_addr_tb,
	even_odd_n		=> even_odd_n_tb,
	rf_ptr			=> rf_ptr_tb,
	px_ptr			=> px_ptr_tb
	);


end architecture test_fc_rd; 


architecture test_conv_rd of imem_w_tb is
begin
end architecture
