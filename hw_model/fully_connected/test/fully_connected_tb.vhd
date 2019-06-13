 --
-- testbench of the: fully connected layer 400 to 120.
--
library ieee;
LIBRARY STD;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.fixed_pkg.all; 

package ifmap_ofmap_type is

	--constant ifmap_size : natural := 400;
	--constant ofmap_size : natural := 120;
	constant pe_number	: natural := 20;
	constant qi			: natural := 8;
	constant qf			: natural := 8;
	
	type ifmap_type is array(0 to pe_number-1) of sfixed(qi-1 downto -qf);
	
end package ifmap_ofmap_type;


library ieee;
library std;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.fixed_pkg.all; 

use work.ifmap_ofmap_type.all;

entity tb_fc is
	
	

end tb_fc;

architecture test of tb_fc is

	component fully_connected is
		port(	
		clk		: in std_logic;
		rst_n	: in std_logic;
		ifmap	: in ifmap_type;
		weights : in ifmap_type;
		ofmap	: out ifmap_type
		);
	end component;
	
	file file_vectors : text;
	file file_results : text;
	
	signal tb_clk		: std_logic;
	signal tb_rst		: std_logic;
	signal tb_ifmap		: ifmap_type;
	signal tb_weigths	: ifmap_type; 
	signal tb_ofmap		: ifmap_type;
	
	
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
	variable v_ifmap	: sfixed(qi-1 downto -qf);
	variable v_weights	: sfixed(qi-1 downto -qf);
	variable v_space	: character; 
	 
	begin

	-- opening input and output files in read/write modes
	file_open(file_vectors, "random_in.txt",  read_mode);
	file_open(file_results, "sim_results.txt", write_mode);
	
	wait for 10 ns;
	
	
	-- read input stimuli from file random_in.txt
	while not endfile(file_vectors) loop
		
		-- reading array of input
		for i in 0 to pe_number-1 loop
			readline(file_vectors, v_iline);
			read(v_iline, v_ifmap);
			tb_ifmap(i) <= v_ifmap; 
		end loop;
		
		-- reading array of weights
		for i in 0 to pe_number-1 loop
			readline(file_vectors, v_iline);
			read(v_iline, v_weights);
			tb_weigths(i) <= v_weights; 
		end loop;
	  
	  wait for 2 ns;
	  
	end loop;
	
	-- writing array of output
	for i in 0 to pe_number-1 loop
		write(v_oline, tb_ofmap(i), right, 16);
		writeline(file_results, v_oline); 
	end loop;
        
	-- closin in/out files
	file_close(file_vectors);
	file_close(file_results);
	    
	wait;
	end process;
        
	fc : fully_connected
		port map(
			clk		=> tb_clk, 
			rst_n	=> tb_rst, 
			ifmap 	=> tb_ifmap, 
			weights => tb_weigths,
			ofmap 	=> tb_ofmap
			);
		 
end test;
        