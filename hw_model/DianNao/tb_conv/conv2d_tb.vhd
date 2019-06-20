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
		weight		: in 	sfixed(qi-1 downto -qf);   -- il tipo dei pesi? non dovrebbero essere array? 
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
	
	
	-- process for:
	-- 1) reading input stimuli from file
	-- 2) writing results to file
	process
	variable v_iline	: line;
	variable v_oline	: line;
	variable v_imap	    : imap_in;
	variable v_weights	: sfixed(qi-1 downto -qf);
	variable v_space	: character; 
	 
	begin

	-- opening input and output files in read/write modes
	file_open(file_vectors, "random_in.txt",  read_mode);
	file_open(file_weigths, "random_filter",  read_mode);	
	file_open(file_results, "results.txt", write_mode);
	
	wait for 10 ns;
	
	
	-- read input stimuli from file random_in.txt
	while not endfile(file_vectors) loop
		
		-- reading array of input
		
		for i in 0 to 3                         --parallel
	     ld_parallel <= '1';
		   
		   	readline(file_vectors, v_iline);
			read(v_iline, v_imap(i));	       
            
            tb_imap(i) <= v_imap(i);
        end loop; 
		
		-- reading array of weights         
		for i in 0 to pe_number-1 loop
			readline(file_weigths, v_iline);
			read(v_iline, v_weights);
			tb_weigths(i) <= v_weights; 
		end loop;
		
	-- writing array of output
	    for i in 0 to pe_number-1 loop
	 	    write(v_oline, tb_ofmap(i), right, 16);
		    writeline(file_results, v_oline); 
	    end loop;		
		
		wait for 1 ns; 

        for i in 0 to 4                           -- orizz 
	     ld_right <= '1';
	       
		   wait for 1 ns;
		   
		for i in 0 to 3
	     ld_parallel <= '1';
		   
		   	readline(file_vectors, v_iline);
			read(v_iline, v_imap(i));	       
            
            tb_imap(i) <= v_imap(i);
        end loop;
		
	    -- reading array of weights         
		for i in 0 to pe_number-1 loop
			readline(file_weigths, v_iline);
			read(v_iline, v_weights);
			tb_weigths(i) <= v_weights; 
		end loop;
		
	    -- writing array of output
	    for i in 0 to pe_number-1 loop                --Dobbiamo scrivere una matrice in output??????
	 	    write(v_oline, tb_ofmap(i), right, 16);
		    writeline(file_results, v_oline); 
	    end loop;		
		
		wait for 1 ns; 
        
        end loop;
	  
	end loop;
	
        
	-- closin in/out files
	file_close(file_vectors);
	file_close(file_weigths);	
	file_close(file_results);
	    
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
       