library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all ;

use work.param.all;

entity fully_connected is

    port(
		  ck 		  : in  std_logic; 
		  rst         : in  std_logic;
          en_reg_acc  : in  std_logic; 
          en_reg_in   : in  std_logic; 		  
		  rst_cnt1    : in  std_logic;
		  en_cnt1     : in  std_logic; 
		  rst_cnt2    : in  std_logic;
		  en_cnt2     : in  std_logic; 		  
		  layer_fc    : in  std_logic; 		  
		  ifmap	      : in  ifmap_type;
		  weights     : in  weights_type;
		  ofmap 	  : out ofmap_type;
		  eq          : out std_logic;     -- result of the comparator used to understand when the output data are valid 
		  eq2         : out std_logic;     -- result of the comparator2 for the evolution of the fsm 
		  cnt1        : out std_logic_vector(cnt_b-1 downto 0);   --TEST PURPOSE        
		  cnt2        : out std_logic_vector(cnt_b2-1 downto 0)   --TEST PURPOSE
		  
	);
	
end entity;

architecture behavior of fully_connected is
	
component pe

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
	
end component;

component counter is

generic( n : natural ); 

   port(
   
 	    clk   : in  std_logic;
 	    rst   : in  std_logic;
		en    : in  std_logic;	
 	    cnt   : out std_logic_vector(n-1 downto 0)		
		);
		
end component;

component comparator is                 

generic( n : natural ); 

   port(
 	     d1     : in std_logic_vector(n-1 downto 0);
 	     d2     : in std_logic_vector(n-1 downto 0);	
	     eq     : out std_logic			 
		
		);
		
end component;

component mux_c is
 
    port ( 
	       sel : in  std_logic;
           o   : out std_logic_vector (6 downto 0)
		   
		  );
		  
end component;

component mux_c2 is
 
    port ( 
	       sel : in  std_logic;
           o   : out std_logic_vector (2 downto 0)
		   
		  );
		  
end component;

component ff is
	
	port(	
		  d 		:	in  std_logic;
		  ck 		:	in  std_logic; 
		  rst 	    :	in  std_logic;
		  q  		:   out std_logic
		  
		);

end component;

signal cnt_to_comp  :   std_logic_vector(cnt_b-1 downto 0);
signal cnt_to_comp2 :   std_logic_vector(cnt_b2-1 downto 0);
signal out_mux      :   std_logic_vector(cnt_b-1 downto 0);
signal out_mux2     :   std_logic_vector(cnt_b2-1 downto 0);
signal comp_to_ff   :   std_logic;
signal comp2_to_ff  :   std_logic;
signal s_eq         :   std_logic;

	
begin

mac_1_to_16 : for i in 0 to pe_number-1 generate 
	
	mac : pe generic map( b => b, k => k, bg => bg )
	
			port map( 
						ck		    => ck, 
				        rst         => rst,						
                        en_reg_acc  => en_reg_acc, 
                        en_reg_in   => en_reg_in, 						
						imap 	    => ifmap(i),
						weight 	    => weights(i), 
						omap 	    => ofmap(i)						
					);
					
end generate mac_1_to_16;

count : counter generic map ( n => cnt_b )

            port map(
			           clk   => ck,
 	                   rst   => rst_cnt1,
	                   en    => en_cnt1,
 	                   cnt   => cnt_to_comp	
			        );	

count2 : counter generic map ( n => cnt_b2 )

            port map(
			           clk   => s_eq,
 	                   rst   => rst_cnt2,
	                   en    => en_cnt2,
 	                   cnt   => cnt_to_comp2	
			        );							
					
cmp : comparator generic map ( n => cnt_b )

            port map(
                      d1 => cnt_to_comp,
					  d2 => out_mux,           -- number of the imap required (for the two layers of fc)   
					  eq => comp_to_ff
			        );	

cmp2 : comparator generic map ( n => cnt_b2 )

            port map(
                      d1 => cnt_to_comp2,
					  d2 => out_mux2,            
					  eq => comp2_to_ff
			        );						

mux : mux_c 

            port map(
                      sel => layer_fc,  
					  o   => out_mux
			        );
					
mux2 : mux_c2 

            port map(
                      sel => layer_fc,  
					  o   => out_mux2
			        );								

ff_eq: ff	

            port map(
 		             d 	  => comp_to_ff,
		             ck   => ck,		
		             rst  => rst,	    
		             q    => s_eq	
			        );	  			

ff_eq2: ff	

            port map(
 		             d 	  => comp2_to_ff,
		             ck   => ck,		
		             rst  => rst,	    
		             q    => eq2	
			        );	

eq <= s_eq;		
cnt1 <= cnt_to_comp;       --TEST PURPOSE
cnt2 <= cnt_to_comp2;	   --TEST PURPOSE						

end behavior;
