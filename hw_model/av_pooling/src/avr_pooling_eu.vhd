library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all ;

use work.param.all;

entity avr_pooling_eu is

    port(
		  ck 		  : in  std_logic; 
		  rst         : in  std_logic;
		  sel         : in  std_logic;
		  d_0 	      : in 	signed((W*N-1) downto 0);
		  d_1 	      : in 	signed((W*N-1) downto 0);
		  d_2 	      : in 	signed((W*N-1) downto 0);
		  d_3 	      : in 	signed((W*N-1) downto 0);	
		  d_4 	      : in 	signed((W*N-1) downto 0);	
		  d_5 	      : in 	signed((W*N-1) downto 0);	
		  d_6 	      : in 	signed((W*N-1) downto 0);	
		  d_7 	      : in 	signed((W*N-1) downto 0);		  
	      sync_clr    : in  std_logic;	
		  en		  : in  std_logic; 
		  ckg_rmask   : in  std_logic_vector(0 to W-1);
		  ckg_cmask   : in  std_logic_vector(0 to W-1);		  
		  rst_cnt     : in  std_logic;
		  en_cnt      : in  std_logic; 	        
		  o_pool 	  : out PEBlockData;
		  tc          : out std_logic;                   -- result of the comparator used to understand when the output data are valid 
		  cnt         : out unsigned(1 downto 0)   --TEST PURPOSE        
		  
	);
	
end entity;

architecture behavior of avr_pooling_eu is
	
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
		o_data 		: out PEBlockDataRes
	);
end component;

component interf is

	generic(n : integer := 16);
	
	port(
		sel 	: in 	std_logic;
		d_0 	: in 	signed((n-1) downto 0);
		d_1 	: in 	signed((n-1) downto 0);
		d_2 	: in 	signed((n-1) downto 0);
		d_3 	: in 	signed((n-1) downto 0);	
		d_4 	: in 	signed((n-1) downto 0);	
		d_5 	: in 	signed((n-1) downto 0);	
		d_6 	: in 	signed((n-1) downto 0);	
		d_7 	: in 	signed((n-1) downto 0);			
		d_out0	: out 	signed((n-1) downto 0);
		d_out1	: out 	signed((n-1) downto 0);
		d_out2	: out 	signed((n-1) downto 0);
		d_out3	: out 	signed((n-1) downto 0)
	);

end component;

component shift_right2 is

 generic( N : natural:= 11 );
 
port(
		in0      : in signed(N-1 downto 0);
		in1      : in signed(N-1 downto 0);
        in2      : in signed(N-1 downto 0);
		in3	     : in signed(N-1 downto 0);
	    out0     : out signed(N-8 downto 0);    -- the out has to be on 3 bits
	    out1     : out signed(N-8 downto 0);
	    out2     : out signed(N-8 downto 0);
	    out3     : out signed(N-8 downto 0)
    );
	
end component;

component countern is 
generic ( N: natural );    
port( 
		ck  : in std_logic; 
		rst : in std_logic; 
		en  : in std_logic;
		arv : in unsigned(N-1 downto 0); -- auto-reload value
		q   : out unsigned(N-1 downto 0); 
        tc  : out std_logic
	); 
end component; 

-- component relu_4bit is
	-- port(
		-- d_in 	: in 	std_logic_vector(3 downto 0);
		-- d_out 	: out 	std_logic_vector(3 downto 0)
	-- );
-- end component;

signal pe_b_i_data  :   PEBlockData;
signal pe_b_o_data  :   PEBlockDataRes;
signal int_k_pool   :   PEBlockWeights;     -- in order to have only sum in the pooling operation the weights are set to 1
signal s_tc         :   std_logic;

-- signal in_relu00	:   std_logic_vector(3 downto 0);
-- signal in_relu01	:   std_logic_vector(3 downto 0);
-- signal in_relu02	:   std_logic_vector(3 downto 0);
-- signal in_relu03	:   std_logic_vector(3 downto 0);
-- signal in_relu10	:   std_logic_vector(3 downto 0);
-- signal in_relu11	:   std_logic_vector(3 downto 0);
-- signal in_relu12	:   std_logic_vector(3 downto 0);
-- signal in_relu13	:   std_logic_vector(3 downto 0);
-- signal in_relu20	:   std_logic_vector(3 downto 0);
-- signal in_relu21	:   std_logic_vector(3 downto 0);
-- signal in_relu22	:   std_logic_vector(3 downto 0);
-- signal in_relu23	:   std_logic_vector(3 downto 0);
-- signal in_relu30	:   std_logic_vector(3 downto 0);
-- signal in_relu31	:   std_logic_vector(3 downto 0);
-- signal in_relu32	:   std_logic_vector(3 downto 0);
-- signal in_relu33	:   std_logic_vector(3 downto 0);


	
begin

row: for i  in 0 to W-1 generate 

col:	for j in 0 to W-1 generate pool_weights:
	
	int_k_pool(i)(W*2-1 -j*2 downto (W*2 - 2*(j+1))) <= "01";
	
    end generate;

end generate;	

interface : interf generic map (n => 16)
     
	     port map (
		            sel    => sel,
		            d_0    => d_0, 
		            d_1    => d_1,	
		            d_2    => d_2,	
		            d_3    => d_3, 	
		            d_4    => d_4,
		            d_5    => d_5,					
		            d_6    => d_6,					
		            d_7    => d_7,
					d_out0 => pe_b_i_data(0),
		            d_out1 => pe_b_i_data(1),
		            d_out2 => pe_b_i_data(2),
		            d_out3 => pe_b_i_data(3)
						 
		          );

pe_b : pe_block 

          port map (
			         ck        => ck, 
			         rst 	   => rst,
			         sync_clr  => sync_clr,
		             en		   => en,
		             ckg_rmask => ckg_rmask, 	
		             ckg_cmask => ckg_cmask,			
			         i_kernel  => int_k_pool, 
			         i_data    => pe_b_i_data, 
			         o_data    => pe_b_o_data
		            );

count : countern generic map ( n => 2 )

            port map(
			           ck    => ck,
 	                   rst   => rst_cnt,
	                   en    => en_cnt,
					   arv   => "11",
 	                   q     => cnt,	
					   tc    => s_tc
			        );	
					
shift_row0: shift_right2 generic map ( n => 11)
   
            port map(
			         in0 	=> pe_b_o_data(0)(43 downto 33),
			         in1 	=> pe_b_o_data(0)(32 downto 22),
			         in2 	=> pe_b_o_data(0)(21 downto 11),
			         in3 	=> pe_b_o_data(0)(10 downto 0),
					 out0	=> o_pool(0)(15 downto 12),
					 out1	=> o_pool(0)(11 downto 8),
					 out2	=> o_pool(0)(7 downto 4),
					 out3	=> o_pool(0)(3 downto 0)
			         );

shift_row1: shift_right2 generic map ( n => 11)
   
            port map(
			         in0 	=> pe_b_o_data(1)(43 downto 33),
			         in1 	=> pe_b_o_data(1)(32 downto 22),
			         in2 	=> pe_b_o_data(1)(21 downto 11),
			         in3 	=> pe_b_o_data(1)(10 downto 0),
					 out0	=> o_pool(1)(15 downto 12),
					 out1	=> o_pool(1)(11 downto 8),
					 out2	=> o_pool(1)(7 downto 4),
					 out3	=> o_pool(1)(3 downto 0)
			         );		

shift_row2: shift_right2 generic map ( n => 11)
   
            port map(
			         in0 	=> pe_b_o_data(2)(43 downto 33),
			         in1 	=> pe_b_o_data(2)(32 downto 22),
			         in2 	=> pe_b_o_data(2)(21 downto 11),
			         in3 	=> pe_b_o_data(2)(10 downto 0),
					 out0	=> o_pool(2)(15 downto 12),
					 out1	=> o_pool(2)(11 downto 8),
					 out2	=> o_pool(2)(7 downto 4),
					 out3	=> o_pool(2)(3 downto 0)
			         );		
					 
shift_row3: shift_right2 generic map ( n => 11)
   
            port map(
			         in0 	=> pe_b_o_data(3)(43 downto 33),
			         in1 	=> pe_b_o_data(3)(32 downto 22),
			         in2 	=> pe_b_o_data(3)(21 downto 11),
			         in3 	=> pe_b_o_data(3)(10 downto 0),
					 out0	=> o_pool(3)(15 downto 12),
					 out1	=> o_pool(3)(11 downto 8),
					 out2	=> o_pool(3)(7 downto 4),
					 out3	=> o_pool(3)(3 downto 0)
			         );					 							


tc <= s_tc;								

end behavior;
