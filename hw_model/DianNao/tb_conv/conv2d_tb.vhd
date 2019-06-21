library ieee;
library std;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.fixed_pkg.all; 
use work.ptype.all;

entity tb_conv is
	
end tb_conv;

architecture test of tb_conv is

   component nfu is

      port(
		ck 			: in std_logic; 
		rstn		: in std_logic; 
		ld_v 		: in std_logic;
		ld_h 		: in std_logic; 
		sel			: in std_logic;
		weight		: in 	sfixed(qi-1 downto -qf);   
		din_h		: in 	data_h;
		din_v		: in 	data_v;
		omap		: out matrix);
    end component;
	
	file file_vectors : text;
	file file_weigths : text;	
	file file_results : text;
	
	signal tb_clk		: std_logic;
	signal tb_rst		: std_logic;
	signal tb_imaph		: data_h;
	signal tb_imapv		: data_v;
    signal tb_sel	    : std_logic;
	signal tb_weigths	: sfixed(qi-1 downto -qf); 
	signal tb_ofmap		: matrix;
	signal ld_parallel  : std_logic;	
	signal ld_right     : std_logic;		
	
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
		tb_rst <= '0';
		wait for 12 ns;
		tb_rst <= '1';
		wait;
	end process;
	
	-- process for writing results to file	
	process
	variable v_iline	: line;
	variable v_oline	: line;
	variable v_space	: character; 
	 
	begin

	-- opening output file in write modes	
	file_open(file_results, "results.txt", write_mode);
	
	wait for 25 ns;
	
	-- writing array of output
	    for i in 0 to py-1 loop
	 	    write(v_oline, tb_ofmap, right, 16);
		    writeline(file_results, v_oline); 
	    end loop;			

	-- closin out file
	file_close(file_results);

	wait;
	end process;		
	
	-- process for reading kernels from file
	process
	variable v_iline	: line;
	variable v_oline	: line;
	variable v_weights	: sfixed(qi-1 downto -qf);
	variable v_space	: character; 
	 
	begin
	
	-- opening input files in read modes
	file_open(file_weigths, "random_filter",  read_mode);	
	
	wait for 10 ns;

		-- reading array of weights         
			readline(file_weigths, v_iline);
			read(v_iline, v_weights);
			tb_weigths <= v_weights; 		

	-- closin in file
	file_close(file_weigths);	

	wait;
	end process;	
	
	
	-- process for reading input stimuli from file
	process
	variable v_iline	: line;
	variable v_oline	: line;
	variable v_imaph	: data_h;
	variable v_imapv	: data_v;	
	variable v_space	: character; 
	 
	begin

	-- opening input file in read modes
	file_open(file_vectors, "random_in.txt",  read_mode);
	
	wait for 10 ns;
	
	-- read input stimuli from file random_in.txt
	while not endfile(file_vectors) loop
		
		-- reading array of input
		
		for i in 0 to 3                       
		   
		   	readline(file_vectors, v_iline);
			read(v_iline, v_imaph);	       
            
            tb_imaph <= v_imaph;
        end loop; 
		
		wait for 1 ns; 
		
	 for j in 0 to 4	                            --loop per le 5 volte in verticale

       for i in 0 to 4                           --5 volte in orizz 
	       
		   wait for 1 ns;
		   
		for i in 0 to 3
		   
		   	readline(file_vectors, v_iline);
			read(v_iline, v_imaph);	       
            
            tb_imaph <= v_imaph;
        end loop;
	   end loop;	
		
		wait for 1 ns; 

		   	readline(file_vectors, v_iline);   -- 1 in verticale
			read(v_iline, v_imapv);	       
            
            tb_imapv <= v_imapv;		
        
     end loop;
		
	  
	end loop;
	
        
	-- closin in file
	file_close(file_vectors);
	    
	wait;
	end process;
        
	conv : conv2d
		port map(
		
		ck 	    => tb_clk,
		rstn    => tb_rst,
		ld_v 	=> ld_parallel,
		ld_h 	=> ld_right, 
		sel		=> tb_sel,
		weight	=> tb_weigths,
		din_h	=> tb_imaph,
		din_v   => tb_imapv,
		omap    => tb_ofmap);
		 
end test;
       