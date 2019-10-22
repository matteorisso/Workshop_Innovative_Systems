library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

use work.param.all;

entity data_maker_new is  

  port (
    clk       : in  std_logic;
    o_data1   : in  signed(43 downto 0);
    o_data2   : in  signed(43 downto 0);
    o_data3   : in  signed(43 downto 0);
    o_data4   : in  signed(43 downto 0);
    i_kernel1 : out std_logic_vector(7 downto 0);
    i_kernel2 : out std_logic_vector(7 downto 0);
	i_kernel3 : out std_logic_vector(7 downto 0);
    i_kernel4 : out std_logic_vector(7 downto 0);
	i_data 	  : out signed(W-1 downto 0);
    layer_fc  : out std_logic_vector(1 downto 0);
    start     : out std_logic; 
    ckg_rmask : out std_logic_vector(0 to W-1);
	ckg_cmask : out std_logic_vector(0 to W-1));			  

end data_maker_new;

architecture beh of data_maker_new is

	file file_inputs   : text;
	file file_inputs2  : text;	
	file file_weights  : text;
	file file_weights2 : text;	
	file file_results  : text;
	file file_results2 : text;

begin  -- beh

  process 

	variable v_iline	: line;
	variable v_iline2	: line;	
	variable v_ifmap	: std_logic_vector(W-1 downto 0);
	variable v_oline	: line;	
	variable v_oline2	: line;		

  begin  -- process

	-- opening output files in write mode
	file_open(file_results,  "sim_results.txt",     write_mode);	
	file_open(file_results2, "sim_results2.txt",    write_mode);		
	
    start     <= '0';	
    ckg_cmask <= (others => '1');
    ckg_rmask <= (others => '1');	
	layer_fc  <= "01";
	
	wait for 3 ns;

    -- ATTENZIONE: viene dato lo start, la fsm lo campiona e il colpo di clk successivo prende il primo dato 
    start     <= '1';	
    ckg_cmask <= (others => '0');
    ckg_rmask <= (others => '0');
	layer_fc  <= "01";	
	
	wait for 2 ns;

    start     <= '0';
	
	-- read input stimuli from file random_in.txt 
 for step in 0 to 5 loop 
 
 	file_open(file_inputs,   "random_in.txt",       read_mode); 

	while not endfile(file_inputs) loop  	
		
			readline(file_inputs, v_iline);
			 read(v_iline, v_ifmap);	
			
			  i_data <= signed(v_ifmap);
	
     wait for 2 ns;	
	 
	end loop;	 
	
	-- writing array of output
	
    for j in 0 to W-1 loop	    --col
	 
		write(v_oline, std_logic_vector(o_data1(W*(N+G)-1 -j*(N+G) downto (W*(N+G) - (N+G)*(j+1)))), right, N+G);   
		writeline(file_results, v_oline); 
	
	end loop;	

    for j in 0 to W-1 loop	    --col
	 
		write(v_oline, std_logic_vector(o_data2(W*(N+G)-1 -j*(N+G) downto (W*(N+G) - (N+G)*(j+1)))), right, N+G);   
		writeline(file_results, v_oline); 
	
	end loop;	

    for j in 0 to W-1 loop	    --col
	 
		write(v_oline, std_logic_vector(o_data3(W*(N+G)-1 -j*(N+G) downto (W*(N+G) - (N+G)*(j+1)))), right, N+G);   
		writeline(file_results, v_oline); 
	
	end loop;	

    for j in 0 to W-1 loop	    --col
	 
		write(v_oline, std_logic_vector(o_data4(W*(N+G)-1 -j*(N+G) downto (W*(N+G) - (N+G)*(j+1)))), right, N+G);   
		writeline(file_results, v_oline); 
	
	end loop;	



     wait for 2 ns;	                       --Before giving the 120 images again and the respective weights 2 clock cycles are required 

	file_close(file_inputs);	
	
 end loop;

	 wait for 20 ns;

    start     <= '1';	  --SECOND LAYER
	layer_fc  <= "10";	

	wait for 2 ns;	
	
    start <= '0';	

	-- read input stimuli from file random_in2.txt
 
 	file_open(file_inputs2,  "random_in2.txt",      read_mode);
 
	while not endfile(file_inputs2) loop                   
		
			readline(file_inputs2, v_iline2);
			 read(v_iline2, v_ifmap);	
			
			  i_data <= signed(v_ifmap);
			
     wait for 2 ns;		 
	
	end loop;
	
     wait for 2 ns;		
	
	 	-- writing array of output
	
	for j in 0 to W-1 loop	--col
	
		write(v_oline2, std_logic_vector(o_data1(W*(N+G)-1 -j*(N+G) downto (W*(N+G) - (N+G)*(j+1)))), right, N+G);
		writeline(file_results2, v_oline2);
		
	end loop;

	for j in 0 to W-1 loop	--col
	
		write(v_oline2, std_logic_vector(o_data2(W*(N+G)-1 -j*(N+G) downto (W*(N+G) - (N+G)*(j+1)))), right, N+G);
		writeline(file_results2, v_oline2);
		
	end loop;

	for j in 0 to 2-1 loop	--col
	
		write(v_oline2, std_logic_vector(o_data3(W*(N+G)-1 -j*(N+G) downto (W*(N+G) - (N+G)*(j+1)))), right, N+G);
		writeline(file_results2, v_oline2);
		
	end loop;	

    wait for 2 ns;		
	
    file_close(file_inputs2); 

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
	variable v_weights	: std_logic_vector(2-1 downto 0);
	 
	begin

	file_open(file_weights,  "random_weights.txt",   read_mode);	
	file_open(file_weights2, "random_weights2.txt",  read_mode);		
	
	wait for 5 ns;	

	-- read input stimuli from file random_weights.txt 	
    -- for the first 80 outputs

  for n in 0 to 5-1 loop             -- We need to generate 5 times 16 outputs

	for n2 in 0 to 120-1 loop         -- For each group of 16 outputs we need to load 120 times 16 the weigths 
	
	 for j in 0 to W-1 loop --col	                     
		
			readline(file_weights, v_iline);
			read(v_iline, v_weights);
			i_kernel1(W*2-1 -j*2 downto (W*2 - 2*(j+1))) <= v_weights; 	
			
	 end loop;

	 for j in 0 to W-1 loop --col	                     
		
			readline(file_weights, v_iline);
			read(v_iline, v_weights);
			i_kernel2(W*2-1 -j*2 downto (W*2 - 2*(j+1))) <= v_weights; 	
			
	 end loop;

	 for j in 0 to W-1 loop --col	                     
		
			readline(file_weights, v_iline);
			read(v_iline, v_weights);
			i_kernel3(W*2-1 -j*2 downto (W*2 - 2*(j+1))) <= v_weights; 	
			
	 end loop;

	 for j in 0 to W-1 loop --col	                     
		
			readline(file_weights, v_iline);
			read(v_iline, v_weights);
			i_kernel4(W*2-1 -j*2 downto (W*2 - 2*(j+1))) <= v_weights; 	
			
	 end loop;		
		
	wait for 2 ns;
	  
	end loop;
	
	wait for 4 ns;              
 
  end loop; 

-- for the last 4 outputs
	for n in 0 to 120-1 loop         
	
	for j in 0 to W-1 loop	 --col                        
		
			readline(file_weights, v_iline);
			read(v_iline, v_weights);
			i_kernel1(W*2-1 -j*2 downto (W*2 - 2*(j+1))) <= v_weights; 	
			
		 end loop;		 
	
	wait for 2 ns;
	  
	end loop; 
	
	wait for 4 ns;
	
	wait for 22 ns;

	-- read input stimuli from file random_weights2.txt
    -- for the 10 outputs of the second fc layer
	for n in 0 to 84-1 loop           
	
	 for j in 0 to W-1 loop	--col                        
		
			readline(file_weights2, v_iline2);
			read(v_iline2, v_weights);
			i_kernel1(W*2-1 -j*2 downto (W*2 - 2*(j+1))) <= v_weights; 	
			
		 end loop;

	 for j in 0 to W-1 loop	--col                        
		
			readline(file_weights2, v_iline2);
			read(v_iline2, v_weights);
			i_kernel2(W*2-1 -j*2 downto (W*2 - 2*(j+1))) <= v_weights; 	
			
		 end loop;

 	 

     for j in 0 to 2-1 loop --col	  	
		
			readline(file_weights2, v_iline2);
			read(v_iline2, v_weights);
			i_kernel3(W*2-1 -j*2 downto (W*2 - 2*(j+1))) <= v_weights; 	
			
	 end loop;

	wait for 2 ns;	 
	  
	end loop;

	wait for 4 ns;	
        
	-- closin in/out files
	file_close(file_weights);
	file_close(file_weights2);	
	    
	wait;
	
	end process;

end beh;
