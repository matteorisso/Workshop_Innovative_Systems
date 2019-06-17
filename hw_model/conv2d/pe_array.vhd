library ieee;
use ieee.std_logic_1164.all;
use work.fixed_pkg.all;
use work.param.all;

-- strip mining 5x4 PE set

entity pe_array is 
generic ( qi : natural := 8; qf : natural := 8; filter_size : natural := 5);
port ( 	
			ck 	: in  std_logic;
			rstn	: in  std_logic;
			im_h 	: in  imap;
			im_w 	: in  imap; 
			k		: in  filter;
			om 	: out omap);
end entity;


architecture structure of pe_array is


component pe
generic ( qi : natural:= 8; qf : natural:= 8 );
port (	
			ck, rstn : in std_logic; 
			im, k  	: in  sfixed( qi-1 downto -qf );
			psum	 	: out sfixed( qi-1 downto -qf ));
			
end component;

component binary_adder_tree 
generic ( qi : natural := 8; qf : natural := 8);
port(
		ck, rstn	: in std_logic;
		a, b, c, d, e 
					: in  sfixed(qi-1 downto -qf);
		result	: out sfixed(qi-1 downto -qf));
end component;


signal ps : psum; 


begin

rgen: for i in 0 to filter_size-1 generate
	cgen: for j in 0 to array_c-1 generate
		
		i_h:
		if i+j < filter_size-1 generate
		mac:  pe	generic map ( qi => qi, qf => qf ) 
						port map ( ck, rstn, im_h(i+j), k(i), ps(i*array_c + j));
		end generate i_h;
	
		i_w:
		if i+j > filter_size-2 generate
		mac:  pe	generic map ( qi => qi, qf => qf ) 
						port map ( ck, rstn, im_w(i+j-imap'length), k(i), ps(i*array_c + j));
		end generate i_w;
		
	end generate cgen;
end generate rgen;

sum: for j in 0 to array_c-1 generate
				
			add:  binary_adder_tree generic map ( qi => qi, qf => qf )
												port map ( 
																ck, rstn, 
																ps(j),
																ps(j+array_c),
																ps(j+2*array_c),
																ps(j+3*array_c),
																ps(j+4*array_c),
																om(j));
end generate sum;

end architecture;


configuration strucural_cfg of pe_array is
  for structure
    for all : binary_adder_tree
      use entity work.binary_adder_tree(structure);
      -- architecture structure specified for BAT design entity
    end for;
  end for;
end strucural_cfg;

