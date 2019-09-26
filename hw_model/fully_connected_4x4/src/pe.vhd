library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all ;

entity pe is 

generic( b : natural; k : natural; bg : natural);

port(
		ck 			: in  std_logic; 
		rst         : in  std_logic;		
        en_reg_acc  : in  std_logic;
        en_reg_in   : in  std_logic;		
		imap        : in  signed(b-1 downto 0);
		weight		: in  signed(k-1 downto 0);
		omap		: out signed(bg-1 downto 0)
	);
		
end entity; 


architecture structure of pe is


component add_sub is

generic( n : natural); 

port ( 
       sign   : in  std_logic;
       a, b   : in  signed (n-1 downto 0);
       res    : out signed (n-1 downto 0)
--     c_out  : out std_logic
	   
	  );	  
end component;


component regn

	generic( n : natural );
	
	port(	
		  d 		:	in  signed(n-1 downto 0);
		  ck 		:	in  std_logic; 
		  rst 	    :	in  std_logic; 	
		  en 	    :   in  std_logic; 		  
		  q  		:   out signed(n-1 downto 0)
		  
		);
	
end component; 

component mux2to1 is

	generic( n : natural );
	
    port ( 
	      sel : in  std_logic;
          a   : in  signed (n-1 downto 0);
          b   : in  signed (n-1 downto 0);
          o   : out signed (n-1 downto 0)
		  
		  );
		  
end component;

component sign_ext is

	generic( ni : natural ; no : natural );
	
	port(	
		  d 		:	in  signed(ni-1 downto 0);
		  d_ext     :   out signed(no-1 downto 0)
		  
		);

end component;

--registers outputs
signal q_reg_w   : signed(k-1 downto 0);
signal q_reg_in  : signed(b-1 downto 0); 
signal q_reg_acc : signed(bg-1 downto 0);
signal q_reg_out : signed(bg-1 downto 0);
signal q_mux     : signed(bg-1 downto 0);


-- ifmap with sign extension 
signal q_in_ext : signed(bg-1 downto 0);


-- add_sub output
signal q_add_sub    : signed(bg-1 downto 0);

begin

reg_w   : regn		    generic map ( n => k )   port map ( weight, ck, rst, en_reg_in,  q_reg_w );
reg_in  : regn			generic map ( n => b )   port map ( imap,   ck, rst, en_reg_in,  q_reg_in );
reg_out : regn          generic map ( n => bg )  port map ( q_mux,  ck, rst, en_reg_in,  q_reg_out);
reg_acc : regn          generic map ( n => bg )  port map ( q_mux,  ck, rst, en_reg_acc, q_reg_acc);

sign    : sign_ext      generic map (ni => b , no => bg )   port map (q_reg_in, q_in_ext);         -- necessary before the add_sub operation in order to consider the bit growth

op	    : add_sub	    generic map ( n => bg )             port map (std_logic(q_reg_w(1)), q_reg_acc, q_in_ext, q_add_sub);

mux     : mux2to1       generic map ( n => bg )             port map (std_logic(q_reg_w(0)), q_add_sub, q_reg_acc, q_mux);

omap <= q_reg_out;

end architecture; 

