library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_textio.all;
	use ieee.numeric_std.all;

library std;
	use std.textio.all;

	use work.param.all;

entity data_maker_new is  

  port (
    clk       : in  std_logic;
    o_data1   : in  signed(15 downto 0);
    o_data2   : in  signed(15 downto 0);
    o_data3   : in  signed(15 downto 0);
    o_data4   : in  signed(15 downto 0);
	tb_d_0	  : out signed((W*N-1) downto 0);
	tb_d_1	  : out signed((W*N-1) downto 0);
	tb_d_2	  : out signed((W*N-1) downto 0);
	tb_d_3	  : out signed((W*N-1) downto 0);
	tb_d_4	  : out signed((W*N-1) downto 0);
	tb_d_5	  : out signed((W*N-1) downto 0);
	tb_d_6	  : out signed((W*N-1) downto 0);
	tb_d_7	  : out signed((W*N-1) downto 0);
	en		  : out std_logic; 
	size_1    :	out std_logic_vector(4 downto 0);
	size_2 	  :	out std_logic_vector(4 downto 0);
	pool_sel  :	out	std_logic;
    start     : out std_logic; 
	done	  : out std_logic
	);			  

end data_maker_new;

architecture beh of data_maker_new is

	file file_in_0_e   : text;
	file file_in_1_e   : text;
	file file_in_2_e   : text;
	file file_in_3_e   : text;
	file file_in_0_o   : text;
	file file_in_1_o   : text;
	file file_in_2_o   : text;
	file file_in_3_o   : text;
		
	file file_results  : text;

begin  -- beh

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

  begin  -- process

	-- opening output files in write mode
	file_open(file_results,  "sim_resultspool.txt",     write_mode);		
	
    start     <= '0';	
	done		 <=	'0';
    en        <= '0';       -- These enable has to be controlled from the fsm for the clk gating
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
	size_1	<=	"11011";
	size_2	<=	"01001";
	pool_sel	<=	'1';
	
	wait for 4 ns;

    -- ATTENZIONE: viene dato lo start, la fsm lo campiona e il colpo di clk successivo prende il primo dato 
    start     <= '1';	
    en        <= '1';       -- These enable has to be controlled from the fsm for the clk gating
    --tb_ckg_cmask <= (others => '0');
    --tb_ckg_rmask <= (others => '0');	
	
	wait for 2 ns;

    start     <= '0';
	
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
							if i = 0 then 
								write(v_oline, std_logic_vector(o_data1(W*(N)-1 -j*(N) downto (W*(N) - (N)*(j+1)))), right, N);   
								writeline(file_results, v_oline); 
							elsif i = 1 then
								write(v_oline, std_logic_vector(o_data2(W*(N)-1 -j*(N) downto (W*(N) - (N)*(j+1)))), right, N);   
								writeline(file_results, v_oline);
							elsif i = 2 then
								write(v_oline, std_logic_vector(o_data3(W*(N)-1 -j*(N) downto (W*(N) - (N)*(j+1)))), right, N);   
								writeline(file_results, v_oline);
							elsif i = 3 then
								write(v_oline, std_logic_vector(o_data4(W*(N)-1 -j*(N) downto (W*(N) - (N)*(j+1)))), right, N);   
								writeline(file_results, v_oline);
							end if;
						end loop;	
					end loop;
				elsif gate_dn >= 8 and gate_rg < 4 then
					for i in 0 to W-3 loop         --row
						for j in 0 to W-1 loop	    --col
							if i = 0 then 
								write(v_oline, std_logic_vector(o_data1(W*(N)-1 -j*(N) downto (W*(N) - (N)*(j+1)))), right, N);   
								writeline(file_results, v_oline); 
							elsif i = 1 then
								write(v_oline, std_logic_vector(o_data2(W*(N)-1 -j*(N) downto (W*(N) - (N)*(j+1)))), right, N);   
								writeline(file_results, v_oline);
							end if;
						end loop;	
					end loop;
				else
					for i in 0 to W-3 loop         --row
						for j in 0 to W-3 loop	    --col
							if i = 0 then 
								write(v_oline, std_logic_vector(o_data1(W*(N)-1 -j*(N) downto (W*(N) - (N)*(j+1)))), right, N);   
								writeline(file_results, v_oline); 
							elsif i = 1 then
								write(v_oline, std_logic_vector(o_data2(W*(N)-1 -j*(N) downto (W*(N) - (N)*(j+1)))), right, N);   
								writeline(file_results, v_oline);
							end if;
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
	 
	 done		 <=	'1';
		
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
	
end beh;
