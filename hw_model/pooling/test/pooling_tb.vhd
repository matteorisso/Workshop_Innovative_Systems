library ieee;
library std;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.fixed_pkg.all; 
use work.param.all;

entity tb_pooling is
	
end tb_pooling;

architecture test of tb_pooling is

	component pooling is
		port(	
		clk		: in std_logic;
		rst_n	: in std_logic;
		en 		: in std_logic;
		ifmap_a : in ifmap_type;
		ifmap_b : in ifmap_type;
		ifmap_c : in ifmap_type; 
		ifmap_d : in ifmap_type;
		ofmap	: out ifmap_type
		);
	end component;
	
	file file_vectors : text;
	file file_results : text;
	
	signal tb_clk	: std_logic;
	signal tb_rst	: std_logic;
	signal tb_a		: ifmap_type;
	signal tb_b		: ifmap_type; 
	signal tb_c		: ifmap_type;
	signal tb_d		: ifmap_type;
	signal tb_res	: ifmap_type;
	
	
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
	variable v_a		: sfixed(qi-1 downto -qf);
	variable v_b		: sfixed(qi-1 downto -qf);
	variable v_c		: sfixed(qi-1 downto -qf);
	variable v_d		: sfixed(qi-1 downto -qf);
	 
	begin

	-- opening input and output files in read/write modes
	file_open(file_vectors, "random_in.txt",  read_mode);
	file_open(file_results, "sim_results.txt", write_mode);
	
	wait for 10 ns;
	
	
	-- read input stimuli from file random_in.txt
	while not endfile(file_vectors) loop
		
		-- reading array of a input
		for i in 0 to pe_number-1 loop
			readline(file_vectors, v_iline);
			read(v_iline, v_a);
			tb_a(i) <= v_a; 
		end loop;
		
		-- reading array of b input
		for i in 0 to pe_number-1 loop
			readline(file_vectors, v_iline);
			read(v_iline, v_b);
			tb_b(i) <= v_b; 
		end loop;
		
		-- reading array of c input
		for i in 0 to pe_number-1 loop
			readline(file_vectors, v_iline);
			read(v_iline, v_c);
			tb_c(i) <= v_c; 
		end loop;
		
		-- reading array of d input
		for i in 0 to pe_number-1 loop
			readline(file_vectors, v_iline);
			read(v_iline, v_d);
			tb_d(i) <= v_d; 
		end loop;
	  
	  --wait for 2 ns;
	  
	end loop;
	
	wait for 4 ns;
	
	-- writing array of output
	for i in 0 to pe_number-1 loop
		write(v_oline, tb_res(i), right, 16);
		writeline(file_results, v_oline); 
	end loop;
        
	-- closin in/out files
	file_close(file_vectors);
	file_close(file_results);
	    
	wait;
	end process;
        
	avg_pool : pooling
		port map(	
			clk		=> tb_clk,
			rst_n	=> tb_rst,
			en 		=> '1',
			ifmap_a	=> tb_a,
			ifmap_b => tb_b,
			ifmap_c => tb_c,
			ifmap_d => tb_d,
			ofmap	=> tb_res
			);
		 
end test;
        