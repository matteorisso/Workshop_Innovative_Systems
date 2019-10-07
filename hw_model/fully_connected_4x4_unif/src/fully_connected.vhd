library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all ;

use work.param.all;

entity fully_connected is

    port(
		  ck 		  : in  std_logic; 
		  rst         : in  std_logic;
	      sync_clr    : in  std_logic;	
		  en		  : in  std_logic; 
		  ckg_rmask   : in  std_logic_vector(0 to W-1);
		  ckg_cmask   : in  std_logic_vector(0 to W-1);		  
		  rst_cnt1    : in  std_logic;
		  en_cnt1     : in  std_logic; 
		  rst_cnt2    : in  std_logic;
		  en_cnt2     : in  std_logic; 		  
		  layer_fc    : in  std_logic; 	     
		  i_kernel	  : in  PEBlockWeights; 
		  i_data 	  : in  signed(W-1 downto 0);
		  o_data 	  : out PEBlockDataRes;
		  tc          : out std_logic;     -- result of the comparator used to understand when the output data are valid 
		  tc2         : out std_logic;     -- result of the comparator2 for the evolution of the fsm 
		  cnt1        : out unsigned(cnt_b-1 downto 0);   --TEST PURPOSE ONLY        
		  cnt2        : out unsigned(cnt_b2-1 downto 0)   --TEST PURPOSE ONLY
		  
	);
	
end entity;

architecture behavior of fully_connected is
	
component pe_block is

port(
		ck 			: in  std_logic;
		rst			: in  std_logic;
		sync_clr 	: in  std_logic;
		en			: in  std_logic; 
		ckg_rmask  	: in  std_logic_vector(0 to W-1);
		ckg_cmask 	: in  std_logic_vector(0 to W-1);
		i_kernel	: in  PEBlockWeights; 
		i_data 		: in  PEBlockData;
		o_data 		: out PEBlockDataRes);
end component;

component countern is 
generic ( N: natural );    
port( 
		ck  : in std_logic; 
		rst : in std_logic; 
		en  : in std_logic;
		arv : in unsigned(N-1 downto 0); -- auto-reload value
		q   : out unsigned(N-1 downto 0); 
        tc  : out std_logic); 
end component; 

component mux_c is
 
    port ( 
	       sel : in  std_logic;
           o   : out unsigned (6 downto 0)
		   
		  );
		  
end component;

component mux_c2 is
 
    port ( 
	       sel : in  std_logic;
           o   : out unsigned (2 downto 0)
		   
		  );
		  
end component;

signal int_i_data   :   PEBlockData;
signal out_mux      :   unsigned(cnt_b-1 downto 0);
signal out_mux2     :   unsigned(cnt_b2-1 downto 0);
signal s_tc         :   std_logic;

	
begin

row: for i  in 0 to W-1 generate 

col:	for j in 0 to W-1 generate pe_bij:
	
	int_i_data(i)(W*N-1 -j*N downto (W*N - N*(j+1))) <= i_data;
	
    end generate;

end generate;	
	

pe_b : pe_block 

          port map (
			         ck        => ck, 
			         rst 	   => rst,
			         sync_clr  => sync_clr,
		             en		   => en,
		             ckg_rmask => ckg_rmask, 	
		             ckg_cmask => ckg_cmask,			
			         i_kernel  => i_kernel, 
			         i_data    => int_i_data, 
			         o_data    => o_data
		            );

count : countern generic map ( n => cnt_b )

            port map(
			           ck    => ck,
 	                   rst   => rst_cnt1,
	                   en    => en_cnt1,
					   arv   => out_mux,
 	                   q     => cnt1,	
					   tc    => s_tc
			        );	

count2 : countern generic map ( n => cnt_b2 )

            port map(
			           ck    => s_tc,
 	                   rst   => rst_cnt2,
	                   en    => en_cnt2,
					   arv   => out_mux2,
 	                   q     => cnt2,	
					   tc    => tc2					   	
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


tc <= s_tc;								

end behavior;
