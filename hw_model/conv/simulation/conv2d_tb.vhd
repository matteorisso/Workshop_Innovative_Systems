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
		weight		: in sfixed(qi-1 downto -qf);   
		din_h		: in data_h;
		din_v		: in data_v;
		omap		: out matrix);
    end component;
	
	file file_vectors : text;
	file file_weigths : text;	
	file file_results : text;
	
	signal tb_clk		: std_logic;
	signal tb_rstn		: std_logic;
	signal tb_imaph		: data_h;
	signal tb_imapv		: data_v;
	signal tb_weigths	: sfixed(qi-1 downto -qf):=(others=>'0'); 
    signal tb_sel	    : std_logic;
	signal tb_ofmap		: matrix;
	signal tb_ld_h 		: std_logic;	
	signal tb_ld_v  	: std_logic;		
	
	constant half_period : time := 5 ns; 
	constant period		 : time := 10 ns; 
	
	
begin
	
	
	
	DUT: nfu
		generic map ( qi => 1, qf => 15 )
		port map(
		
		ck 	    => tb_clk,
		rstn    => tb_rstn,
		ld_v 	=> tb_ld_v,
		ld_h 	=> tb_ld_h, 
		sel		=> tb_sel,
		weight	=> tb_weigths,
		din_h	=> tb_imaph,
		din_v   => tb_imapv,
		omap    => tb_ofmap);
		
	-- clock generation
	process 
	begin
		tb_clk <= '0';
		wait for half_period;
		tb_clk <= '1';
		wait for half_period;
	end process;
	
	-- reset generation
	process   
	-- DUT starts after (period + half_period) - second clock cycle -
	begin
		tb_rstn <= '0';
		wait for 2*half_period;
		tb_rstn <= '1';
		wait;
	end process;
	
	-- process for writing results to file	
	process
	variable v_oline	: line;
	variable v_space	: character; 
	 
	begin

	-- opening output file in write modes	
	file_open(file_results, "./results.txt", write_mode);
	
	wait for (py-1)*period + period + 25*period; 
	
	-- //**	
	-- init time period 4 cycle + 
	-- offset (reset cycle) 	+ 
	-- no. of filter elements 	+ 
	-- offset (sampling on rising edge)
	-- **//
	
	-- writing array of output
	    for i in 0 to py-1 loop
			for j in 0 to px-1 loop
				write(v_oline, to_real(tb_ofmap(i,j)));
			writeline(file_results,v_oline);
			end loop;  
	    end loop;			

	-- closin out file
	file_close(file_results);

	wait;
	end process;		
	
	-- -- process for reading kernels from file
	process
	variable v_iline	: line;
	variable v_oline	: line;
	variable v_weights	: sfixed(qi-1 downto -qf);
	variable v_space	: character; 
	 
	begin
	
	-- opening input files in read modes
	file_open(file_weigths, "../stimuli/random_filter.txt",  read_mode);	
	
	wait for (py-1)*period+period;  						-- init time period 4 cycle + offset (rst)
	while not endfile(file_weigths) loop
		-- reading array of weights         
			readline(file_weigths, v_iline);
			read(v_iline, v_weights);
			tb_weigths <= v_weights; 
			
			wait for period; 
	end loop;
	-- closin in file
	file_close(file_weigths);	

	wait;
	end process;	
	
	
	-- process for reading input stimuli from file 
	
	-- //**
	-- set cmd and data on leading falling edge
	-- DUT samples on trailing rising edge 
	-- **//
	process
	variable v_iline	: line;
	
	variable v_imaph	: sfixed(qi-1 downto -qf);
	variable v_imapv	: sfixed(qi-1 downto -qf);	
	 
	begin

	-- opening input file in read modes
	file_open(file_vectors, "../stimuli/random_in.txt",  read_mode);
	
	-- read input stimuli from file random_in.txt
	while not endfile(file_vectors) loop
		
		wait for period;							-- wait first reset cycle

		for i in 0 to py-1 loop                     -- init array of pe: wait 4 ck loading from the bottom one row per ck cycle 
		   
		    readline(file_vectors, v_iline); 		
			for item in 0 to px-1 loop				-- reading array of input
				read(v_iline, v_imapv);
				tb_imapv(item) <= v_imapv;
			end loop; 
			
			tb_ld_v	<= '1'; 
			tb_sel	<= '1'; 
			
			if i = py-1 then 
				tb_ld_h <= '1'; 
			end if; 
	
			wait for period; 						-- set tb command and input data on falling edge after reset cycle			
        end loop; 									-- pe ready
		
		tb_ld_v		<= '0';
		tb_ld_h		<= '0';
		
		
		for i in 0 to 4	 loop                 		-- loop per le 5 volte in verticale		
													-- orizzontale						
			for j in 0 to 3  loop                  	-- primo prodotto nel ciclo di ld_v, altri 4 in orizzontale
			
				readline(file_vectors, v_iline);
				for item in 0 to py-1 loop
					read(v_iline, v_imaph);	    	
					tb_imaph(item)	<= v_imaph;
				end loop; 
				
				tb_sel 	<= '0';
				tb_ld_h	<= '1';
				tb_ld_v	<= '0'; 
				wait for period;
				
			end loop;	
		   
			readline(file_vectors, v_iline);   		-- 1 in verticale
			for item in 0 to px-1 loop
				read(v_iline, v_imapv);
				tb_imapv(item) 	<= v_imapv;	
            end loop;
			if i < 4 then	
				tb_sel		<= '1'; 
				tb_ld_h		<= '1';
				tb_ld_v		<= '1';
			else 
				tb_sel	<= '0'; 
				tb_ld_h	<= '0';
				tb_ld_v	<= '0';
			end if; 
			
				wait for period;
		end loop;
	
	end loop;
	
	-- closing in file
	file_close(file_vectors);    
	
	wait;
	end process;    

		 
end test;
       