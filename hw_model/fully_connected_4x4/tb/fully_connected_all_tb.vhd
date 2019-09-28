library ieee;
library std;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;
use ieee.std_logic_textio.all;

use work.param.all;

entity fully_connected_all_tb is
	
end entity;

architecture test of fully_connected_all_tb is

component fully_connected is
	
    port(
		  ck 		  : in  std_logic; 
		  rst         : in  std_logic;
          en_reg_acc  : in  std_logic; 
          en_reg_in   : in  std_logic; 	 		  
		  rst_cnt1    : in  std_logic;
		  en_cnt1     : in  std_logic; 
		  rst_cnt2    : in  std_logic;
		  en_cnt2     : in  std_logic; 		  
		  layer_fc    : in  std_logic; 		  
		  ifmap	      : in  ifmap_type;
		  weights     : in  weights_type;
		  ofmap 	  : out ofmap_type;
		  eq          : out std_logic;     -- result of the comparator used to understand when the output data are valid 
		  eq2         : out std_logic;      -- result of the comparator2 for the evolution of the fsm
		  cnt1        : out std_logic_vector(cnt_b-1 downto 0);          
		  cnt2        : out std_logic_vector(cnt_b2-1 downto 0)
 		  
	);
		
end component;	
	
component fsm_fully_connected is
	
	port( 
		clk            : in  std_logic;
        rst_fsm        : in  std_logic;		
		start_l1       : in  std_logic;  
		start_l2       : in  std_logic;
        eq		       : in  std_logic;
        eq2            : in  std_logic;
        en_cnt1        : out std_logic;   
        rst_cnt1       : out std_logic;
        en_cnt2        : out std_logic;   
        rst_cnt2       : out std_logic;		
		layer_fc       : out std_logic;				
		rst            : out std_logic	
		
		);
		
end component;	
	
	file file_inputs   : text;
	file file_inputs2  : text;	
	file file_weights  : text;
	file file_weights2 : text;	
	file file_results  : text;
	file file_results2 : text;	

	
	signal tb_clk		: std_logic;
	
-- signals for the DP	
	signal tb_rst          : std_logic;
	signal tb_en_reg_acc   : std_logic;	
	signal tb_en_reg_in    : std_logic;		
	signal tb_rst_cnt1     : std_logic;	
    signal tb_en_cnt1      : std_logic;
	signal tb_rst_cnt2     : std_logic;	
    signal tb_en_cnt2      : std_logic;	
    signal tb_layer_fc	   : std_logic;
	signal tb_ifmap		   : ifmap_type;
	signal tb_weights	   : weights_type;
    signal tb_cnt1         : std_logic_vector(cnt_b-1 downto 0);	
    signal tb_cnt2         : std_logic_vector(cnt_b2-1 downto 0);		

-- signals for the FSM	
	signal tb_rst_fsm	: std_logic;	
	signal tb_start_l1	: std_logic;	
	signal tb_start_l2	: std_logic;	
	signal tb_eq	    : std_logic;
	signal tb_eq2	    : std_logic;		
	
-- output
	signal tb_ofmap		: ofmap_type;
	
	
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
	
	variable v_iline	: line;
	variable v_iline2	: line;	
	variable v_ifmap	: std_logic_vector(b-1 downto 0);
	variable v_oline	: line;	
	variable v_oline2	: line;		
	 
	begin

	-- opening output files in write mode
	file_open(file_results,  "sim_results.txt",     write_mode);	
	file_open(file_results2, "sim_results2.txt",    write_mode);		
	
    tb_start_l1 <= '0';	
    tb_start_l2 <= '0';	
    tb_en_reg_acc <= '0';       -- These enable has to be controlled from the fsm for the clk gating
    tb_en_reg_in <= '0';	
	
	wait for 3 ns;

    tb_start_l1 <= '1';	    -- ATTENZIONE: viene dato lo start, la fsm lo campiona e il colpo di clk successivo prende il primo dato 
    tb_en_reg_acc <= '1';       
    tb_en_reg_in <= '1';
	
	wait for 2 ns;
	
	-- read input stimuli from file random_in.txt 
 for j in 0 to 5 loop 
 
 	file_open(file_inputs,   "random_in.txt",       read_mode); 

	while not endfile(file_inputs) loop  	
		
			readline(file_inputs, v_iline);
			 read(v_iline, v_ifmap);	
			  
			for i in 0 to pe_number-1 loop
			
			  tb_ifmap(i) <= signed(v_ifmap);

            end loop;  
	
     wait for 2 ns;	
	 
	end loop;	 
	
	-- writing array of output
	for i in 0 to pe_number-1 loop
		write(v_oline, std_logic_vector(tb_ofmap(i)), right, bg);
		writeline(file_results, v_oline); 
	end loop;
	
     wait for 2 ns;		                            --Before giving the 120 images again and the respective weights 2 clock cycles are required 

	file_close(file_inputs);	
	
 end loop;

	 wait for 20 ns;

    tb_start_l1 <= '0';	
    tb_start_l2 <= '1';          --AVVIO IL SECONDO LAYER DI FC	

	wait for 2 ns;	

	-- read input stimuli from file random_in2.txt
 for j in 0 to 1 loop
 
 	file_open(file_inputs2,  "random_in2.txt",      read_mode);
 
	while not endfile(file_inputs2) loop                   
		
			readline(file_inputs2, v_iline2);
			 read(v_iline2, v_ifmap);	
			  
			for i in 0 to pe_number-1 loop
			
			  tb_ifmap(i) <= signed(v_ifmap);

            end loop;  
			
     wait for 2 ns;		 
	
	end loop;
	
     wait for 2 ns;		
	
	 	-- writing array of output
	for i in 0 to 8-1 loop
		write(v_oline2, std_logic_vector(tb_ofmap(i)), right, bg);
		writeline(file_results2, v_oline2); 
	end loop;		

    wait for 2 ns;		
	
    file_close(file_inputs2);
	
 end loop; 

	 wait for 2 ns; 	
		
	-- closin in/out files
	file_close(file_results);
	file_close(file_results2);		
	    
	wait;
	end process;
	
	
-- 2) reading weights from file	
	process
	
	variable v_iline	: line;	
	variable v_iline2	: line;		
	variable v_weights	: std_logic_vector(k-1 downto 0);
	 
	begin

	file_open(file_weights,  "random_weights.txt",   read_mode);	
	file_open(file_weights2, "random_weights2.txt",  read_mode);		
	
	wait for 5 ns;	

	-- read input stimuli from file random_weights.txt 	
-- for the first 80 outputs

  for n in 0 to 5-1 loop             -- We need to generate 5 times 16 outputs

	for j in 0 to 120-1 loop         -- For each group of 16 outputs we need to load 120 times 16 the weigths 

		for i in 0 to pe_number-1 loop                        
		
			readline(file_weights, v_iline);
			read(v_iline, v_weights);
			tb_weights(i) <= signed(v_weights); 	
			
		end loop;
		
	wait for 2 ns;
	  
	end loop;
	
	wait for 4 ns;              
 
  end loop; 

-- for the last 4 outputs
	for j in 0 to 120-1 loop         

		for i in 0 to 4-1 loop                        
		
			readline(file_weights, v_iline);
			read(v_iline, v_weights);
			tb_weights(i) <= signed(v_weights); 	
			
		end loop;
	
	wait for 2 ns;
	  
	end loop; 
	
	wait for 4 ns;
	
	wait for 22 ns;

	-- read input stimuli from file random_weights2.txt
-- for the first 8 outputs
	for j in 0 to 84-1 loop
	
		for i in 0 to 8-1 loop                        
		
			readline(file_weights2, v_iline2);
			read(v_iline2, v_weights);
			tb_weights(i) <= signed(v_weights); 	
			
		end loop;	
		
	wait for 2 ns;			
	  
	end loop;

	wait for 4 ns;

-- for the last 2 outputs	
	for j in 0 to 84-1 loop
	
		for i in 0 to 2-1 loop                        
		
			readline(file_weights2, v_iline2);
			read(v_iline2, v_weights);
			tb_weights(i) <= signed(v_weights); 	
			
		end loop;

	wait for 2 ns;			
	  
	end loop;	

	wait for 4 ns;		
        
	-- closin in/out files
	file_close(file_weights);
	file_close(file_weights2);	
	    
	wait;
	end process;	
	
        
		
	fc : fully_connected
		port map(
			      ck            => tb_clk, 
			      rst	        => tb_rst,			  
			      en_reg_acc	=> tb_en_reg_acc,
			      en_reg_in	    => tb_en_reg_in,				  
			      rst_cnt1      => tb_rst_cnt1, 				  	
		          en_cnt1       => tb_en_cnt1,
			      rst_cnt2      => tb_rst_cnt2, 				  	
		          en_cnt2       => tb_en_cnt2,				  
                  layer_fc      => tb_layer_fc,		                 				  
			      ifmap         => tb_ifmap, 
			      weights       => tb_weights,
			      ofmap         => tb_ofmap,
                  eq            => tb_eq, 
                  eq2           => tb_eq2,
                  cnt1          => tb_cnt1,
                  cnt2          => tb_cnt2				  
				  
			     );
				 
	fsm : fsm_fully_connected
	    port map(
			      clk           => tb_clk,
                  rst_fsm       => tb_rst_fsm,	
		          start_l1      => tb_start_l1,  
		          start_l2      => tb_start_l2,
                  eq            => tb_eq,				  
                  eq2           => tb_eq2, 	
                  en_cnt1       => tb_en_cnt1,
                  rst_cnt1      => tb_rst_cnt1,
                  en_cnt2       => tb_en_cnt2,
                  rst_cnt2      => tb_rst_cnt2,				  
                  layer_fc      => tb_layer_fc,				  		
		          rst           => tb_rst
				  
         	     );
		 
end test;
        