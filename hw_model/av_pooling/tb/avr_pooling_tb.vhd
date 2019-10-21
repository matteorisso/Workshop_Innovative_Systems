library ieee;
library std;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;
use ieee.std_logic_textio.all;

use work.param.all;

entity avr_pooling_tb is
	
end entity;

architecture test of avr_pooling_tb is

	component avr_pooling is
		port(
			clk           : in  std_logic;
			rst_fsm       : in  std_logic;		
			start         : in  std_logic; 
			done		  : in  std_logic;
			en			  : in  std_logic; 
			size_1 		  :	in 	std_logic_vector(4 downto 0);
			size_2 		  :	in 	std_logic_vector(4 downto 0);
			pool_sel      :	in	std_logic;
			d_0 	      : in 	signed((W*N-1) downto 0);
			d_1 	      : in 	signed((W*N-1) downto 0);
			d_2 	      : in 	signed((W*N-1) downto 0);
			d_3 	      : in 	signed((W*N-1) downto 0);	
			d_4 	      : in 	signed((W*N-1) downto 0);	
			d_5 	      : in 	signed((W*N-1) downto 0);	
			d_6 	      : in 	signed((W*N-1) downto 0);	
			d_7 	      : in 	signed((W*N-1) downto 0);
			o_pool 	      : out PEBlockData
		);
	end component;
	
	file file_in_0_e   : text;
	file file_in_1_e   : text;
	file file_in_2_e   : text;
	file file_in_3_e   : text;
	file file_in_0_o   : text;
	file file_in_1_o   : text;
	file file_in_2_o   : text;
	file file_in_3_o   : text;
		
	file file_results  : text;
	

	
	signal tb_clk		: std_logic;
	
-- signals for the DP	
    --signal tb_ckg_rmask    : std_logic_vector(0 to W-1);
    --signal tb_ckg_cmask    : std_logic_vector(0 to W-1);
    
	signal tb_d_0		   : signed((W*N-1) downto 0);
	signal tb_d_1		   : signed((W*N-1) downto 0);
	signal tb_d_2		   : signed((W*N-1) downto 0);
	signal tb_d_3		   : signed((W*N-1) downto 0);
	signal tb_d_4		   : signed((W*N-1) downto 0);
	signal tb_d_5		   : signed((W*N-1) downto 0);
	signal tb_d_6		   : signed((W*N-1) downto 0);
	signal tb_d_7		   : signed((W*N-1) downto 0);


-- signals for the FSM	
	signal tb_rst_fsm	: std_logic;	
	signal tb_start   	: std_logic;
	signal tb_done   	: std_logic;
	signal tb_en		: std_logic;
			
	
-- output
	signal tb_o_pool 	: PEBlockData;
	signal tb_size_1	: std_logic_vector(4 downto 0);
	signal tb_size_2	: std_logic_vector(4 downto 0);
	signal tb_pool_sel	: std_logic;
	
	
begin
	
	process -- clock generation at 500mhz.
	begin
		tb_clk <= '1';
		wait for 1 ns;
		tb_clk <= '0';
		wait for 1 ns;
	end process;
	
	process -- reset generation 
	begin
		tb_rst_fsm   <= '1';	
		wait for 3 ns;
		tb_rst_fsm   <= '0';		
		wait;
	end process;
	
	
-- process for:
-- 1) reading inputs from file and writing results to file
	process
	
	variable flag 	 : integer := 0;
	variable gate_dn : integer := 0;
	variable gate_rg : integer := 1;
	
	variable v_iline_0_e	: line;
	variable v_iline_1_e	: line;
	variable v_iline_2_e	: line;
	variable v_iline_3_e	: line;
	variable v_iline_0_o	: line;
	variable v_iline_1_o	: line;
	variable v_iline_2_o	: line;
	variable v_iline_3_o	: line;
	variable v_ifmap_0_e    : std_logic_vector(3 downto 0);
	variable v_ifmap_1_e    : std_logic_vector(3 downto 0);
	variable v_ifmap_2_e    : std_logic_vector(3 downto 0);
	variable v_ifmap_3_e    : std_logic_vector(3 downto 0);
	variable v_ifmap_0_o    : std_logic_vector(3 downto 0);
	variable v_ifmap_1_o    : std_logic_vector(3 downto 0);
	variable v_ifmap_2_o    : std_logic_vector(3 downto 0);
	variable v_ifmap_3_o    : std_logic_vector(3 downto 0);
	variable v_oline	    : line;		
	 
	begin

	-- opening output files in write mode
	file_open(file_results,  "sim_resultspool.txt",     write_mode);		
	
    tb_start     <= '0';	
	tb_done		 <=	'0';
    tb_en        <= '0';       -- These enable has to be controlled from the fsm for the clk gating
    --tb_ckg_cmask <= (others => '1');
    --tb_ckg_rmask <= (others => '1');	
	tb_d_0		<=	(others => '0');
	tb_d_1		<=	(others => '0');
	tb_d_2		<=	(others => '0');
	tb_d_3		<=	(others => '0');
	tb_d_4		<=	(others => '0');
	tb_d_5		<=	(others => '0');
	tb_d_6		<=	(others => '0');
	tb_d_7		<=	(others => '0');
	tb_size_1	<=	"11011";
	tb_size_2	<=	"01001";
	tb_pool_sel	<=	'0';
	
	wait for 4 ns;

    -- ATTENZIONE: viene dato lo start, la fsm lo campiona e il colpo di clk successivo prende il primo dato 
    tb_start     <= '1';	
    tb_en        <= '1';       -- These enable has to be controlled from the fsm for the clk gating
    --tb_ckg_cmask <= (others => '0');
    --tb_ckg_rmask <= (others => '0');	
	
	wait for 2 ns;

    tb_start     <= '0';
	
	-- read input stimuli from file random_in.txt  
 
 	file_open(file_in_0_e,   "rf_0_e.txt",       read_mode); 
 	file_open(file_in_1_e,   "rf_1_e.txt",       read_mode); 
 	file_open(file_in_2_e,   "rf_2_e.txt",       read_mode); 
 	file_open(file_in_3_e,   "rf_3_e.txt",       read_mode); 
 	file_open(file_in_0_o,   "rf_0_o.txt",       read_mode); 
 	file_open(file_in_1_o,   "rf_1_o.txt",       read_mode); 
 	file_open(file_in_2_o,   "rf_2_o.txt",       read_mode); 
 	file_open(file_in_3_o,   "rf_3_o.txt",       read_mode); 

	while not endfile(file_in_0_e) loop  	
	
			flag 	:= flag + 1;
			gate_dn := gate_dn + 1;
			
			for i in 0 to 3 loop
				
				readline(file_in_0_e, v_iline_0_e);
				 read(v_iline_0_e, v_ifmap_0_e);	
				
				  tb_d_0((15-4*i) downto (12-4*i)) <= signed(v_ifmap_0_e);
				  
				readline(file_in_1_e, v_iline_1_e);
				 read(v_iline_1_e, v_ifmap_1_e);	
				
				  tb_d_1((15-4*i) downto (12-4*i)) <= signed(v_ifmap_1_e);
				
				readline(file_in_2_e, v_iline_2_e);
				 read(v_iline_2_e, v_ifmap_2_e);	
				
				  tb_d_2((15-4*i) downto (12-4*i)) <= signed(v_ifmap_2_e);
				  
				readline(file_in_3_e, v_iline_3_e);
				 read(v_iline_3_e, v_ifmap_3_e);	
				
				  tb_d_3((15-4*i) downto (12-4*i)) <= signed(v_ifmap_3_e);
				  
				readline(file_in_0_o, v_iline_0_o);
				 read(v_iline_0_o, v_ifmap_0_o);	
				
				  tb_d_4((15-4*i) downto (12-4*i)) <= signed(v_ifmap_0_o);
				  
				readline(file_in_1_o, v_iline_1_o);
				 read(v_iline_1_o, v_ifmap_1_o);	
				
				  tb_d_5((15-4*i) downto (12-4*i)) <= signed(v_ifmap_1_o);
				
				readline(file_in_2_o, v_iline_2_o);
				 read(v_iline_2_o, v_ifmap_2_o);	
				
				  tb_d_6((15-4*i) downto (12-4*i)) <= signed(v_ifmap_2_o);
				  
				readline(file_in_3_o, v_iline_3_o);
				 read(v_iline_3_o, v_ifmap_3_o);	
				
				  tb_d_7((15-4*i) downto (12-4*i)) <= signed(v_ifmap_3_o);
			
			end loop;
			
			if flag < 2 then
				wait for 4 ns;	
			else
				wait for 8 ns;
				flag := 0;
				-- writing array of output
				if gate_dn < 8 and gate_rg < 4 then
					for i in 0 to W-1 loop         --row
						for j in 0 to W-1 loop	    --col
							write(v_oline, std_logic_vector(tb_o_pool(i)(W*(N)-1 -j*(N) downto (W*(N) - (N)*(j+1)))), right, N);   
							writeline(file_results, v_oline); 
						end loop;	
					end loop;
				elsif gate_dn >= 8 and gate_rg < 4 then
					for i in 0 to W-3 loop         --row
						for j in 0 to W-1 loop	    --col
							write(v_oline, std_logic_vector(tb_o_pool(i)(W*(N)-1 -j*(N) downto (W*(N) - (N)*(j+1)))), right, N);   
							writeline(file_results, v_oline); 
						end loop;	
					end loop;
				else
					for i in 0 to W-3 loop         --row
						for j in 0 to W-3 loop	    --col
							write(v_oline, std_logic_vector(tb_o_pool(i)(W*(N)-1 -j*(N) downto (W*(N) - (N)*(j+1)))), right, N);   
							writeline(file_results, v_oline); 
						end loop;	
					end loop;
				end if;
			end if;
			
			-- if gate_rg >= 4 then
				-- tb_ckg_cmask	<= "0011";
			-- else
				-- tb_ckg_cmask	<= "0000";
			-- end if;
			
			if gate_dn = 9 then
				--tb_ckg_rmask	<= "0011";
				gate_dn			:= 0;
				gate_rg 		:= gate_rg + 1;
			-- elsif gate_dn = 8 then
				-- tb_ckg_rmask	<= "0011";
			-- else
				-- tb_ckg_rmask	<= "0000";
			end if;
			
			

 end loop;

 	 wait for 2 ns;  
	 
	 tb_done		 <=	'1';
		
	-- closin in/out files
	file_close(file_in_0_e);	
	file_close(file_in_1_e);	
	file_close(file_in_2_e);	
	file_close(file_in_3_e);	
	file_close(file_in_0_o);	
	file_close(file_in_1_o);	
	file_close(file_in_2_o);	
	file_close(file_in_3_o);
	file_close(file_results);		
	    
	wait;
	end process;
	
	
	pool : avr_pooling
		port map(
				clk 	  =>	tb_clk,
				rst_fsm   =>	tb_rst_fsm,
				start	  =>	tb_start,
				done	  =>	tb_done,
				en		  =>	tb_en,
				size_1	  =>	tb_size_1,
				size_2	  =>	tb_size_2,
				pool_sel  =>	tb_pool_sel,
				d_0 	  =>	tb_d_0,
				d_1 	  =>	tb_d_1,
				d_2 	  =>	tb_d_2,
				d_3 	  =>	tb_d_3,	
				d_4 	  =>	tb_d_4,
				d_5 	  =>	tb_d_5,
				d_6 	  =>	tb_d_6,
				d_7 	  =>	tb_d_7,
				o_pool 	  =>	tb_o_pool
			    );
	 
end test;
        