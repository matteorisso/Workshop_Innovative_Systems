library ieee;
LIBRARY STD;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.fixed_pkg.all; 
use work.param.all;

entity tb_tanh is 

end entity;

architecture sim of tb_tanh is
				
signal ck : std_logic := '1';
signal rstn: std_logic := '0';
signal en  : std_logic := '0';
signal in1 : sfixed(qi-1 downto -qf);
signal out1 : sfixed(qi-1 downto -qf);

component tanh is
generic ( 	qi : natural:= 8;
				qf : natural:= 8 );				
port(
	  ck, 
	  rstn, 
	  en:	in std_logic;
     A : in sfixed(qi-1 downto -qf);
     O : out sfixed(qi-1 downto -qf)
     );
end component;

  file file_inputs : text;
  
  constant c_WIDTH : natural := 16;

  signal in1s            : std_logic_vector(c_WIDTH-1 downto 0) := (others => '0');  
  
begin	

th:  tanh generic map ( qi => qi, qf => qf )
												port map ( 
	                                           ck=>ck, 
	                                           rstn=>rstn, 
	                                           en=>en, 
                                              A=>in1,
                                              O=>out1); 

 	process -- clock/reset generation 
	begin
		ck <= not ck after 20 ns;  --25 Mhz clock generator
		en  <=  '1';
		rstn <= '1', '0' after 5 ns;  --Asynchronous initial reset
		
	end process;	
		
stimulus: process
    variable v_ILINE : line;
    variable v_OLINE : line;
    variable v_in1s  : std_logic_vector(c_WIDTH-1 downto 0);

		begin  
	
    file_open(file_inputs, "input_tanh.txt",  read_mode);

    while not endfile(file_inputs) loop
      
      --------------------------------------------------input from file
      readline(file_inputs, v_ILINE);
      read(v_ILINE, v_in1s);
 
      -- Pass the variable to a signal
      in1s <= v_in1s;
    
      in1 <= sfixed(in1s); 
      
      wait until rising_edge(ck);
      
    end loop;	 
		
    file_close(file_inputs);

		  wait;
		  
	  end process;

end architecture;