library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all ;

use work.param.all;

entity fully_connected_all is

    port(
		  clk 		  : in  std_logic; 
          rst_fsm     : in  std_logic;
          start       : in  std_logic;
		  ckg_rmask   : in  std_logic_vector(0 to 3);
		  ckg_cmask   : in  std_logic_vector(0 to 3);		  	  
		  layer_fc    : in  std_logic_vector(1 downto 0); 	     
		  i_kernel1	  : in  std_logic_vector(7 downto 0);
		  i_kernel2	  : in  std_logic_vector(7 downto 0);
		  i_kernel3	  : in  std_logic_vector(7 downto 0);
		  i_kernel4	  : in  std_logic_vector(7 downto 0);
		  i_data 	  : in  signed(3 downto 0);
		  o_data1 	  : out signed(43 downto 0);
		  o_data2 	  : out signed(43 downto 0);
		  o_data3 	  : out signed(43 downto 0);
		  o_data4 	  : out signed(43 downto 0);
          tc          : out std_logic 
	);
	
end entity;

architecture behavior of fully_connected_all is
	
component fully_connected is

    port(
		  ck 		  : in  std_logic; 
		  rst         : in  std_logic;
	      sync_clr    : in  std_logic;	
		  ckg_rmask   : in  std_logic_vector(0 to W-1);
		  ckg_cmask   : in  std_logic_vector(0 to W-1);		  
		  rst_cnt1    : in  std_logic;
		  en_cnt1     : in  std_logic; 
		  rst_cnt2    : in  std_logic;
		  en_cnt2     : in  std_logic; 		  
		  layer_fc    : in  std_logic_vector(1 downto 0); 	     
		  i_kernel	  : in  PEBlockWeights; 
		  i_data 	  : in  signed(W-1 downto 0);
		  o_data 	  : out PEBlockDataRes;
		  tc          : out std_logic;     -- result of the comparator used to understand when the output data are valid 
		  tc2         : out std_logic;     -- result of the comparator2 for the evolution of the fsm 
		  cnt1        : out unsigned(cnt_b-1 downto 0);   --TEST PURPOSE        
		  cnt2        : out unsigned(cnt_b2-1 downto 0)   --TEST PURPOSE
		  
	);
	
end component;

component fsm_fully_connected is

    port(	
		clk            : in  std_logic;
        rst_fsm        : in  std_logic;		
		start          : in  std_logic;  
        tc             : in  std_logic;		
        tc2            : in  std_logic;
        en_cnt1        : out std_logic;    
        rst_cnt1       : out std_logic;
        en_cnt2        : out std_logic;    
        rst_cnt2       : out std_logic;						
		rst            : out std_logic;
	    sync_clr       : out std_logic		
		
		);
		
end component;
	
-- signals for the DP	
	signal tb_rst          : std_logic;
	signal tb_sync_clr	   : std_logic;
	signal tb_rst_cnt1     : std_logic;	
    signal tb_en_cnt1      : std_logic;
	signal tb_rst_cnt2     : std_logic;	
    signal tb_en_cnt2      : std_logic;	
    signal tb_cnt1         : unsigned(cnt_b-1 downto 0);	
    signal tb_cnt2         : unsigned(cnt_b2-1 downto 0);		

-- signals for the FSM
	signal tb_tc	    : std_logic;				
	signal tb_tc2	    : std_logic;		

	
begin

	fc : fully_connected
		port map(
		          ck 		  => clk,   
		          rst         => tb_rst,
	              sync_clr    => tb_sync_clr,
		          ckg_rmask   => ckg_rmask,
		          ckg_cmask   => ckg_cmask,		  
		          rst_cnt1    => tb_rst_cnt1, 
		          en_cnt1     => tb_en_cnt1,
		          rst_cnt2    => tb_rst_cnt2,
		          en_cnt2     => tb_en_cnt2, 		  
		          layer_fc    => layer_fc, 	     
		          i_kernel(0) => i_kernel1,
		          i_kernel(1) => i_kernel2,
		          i_kernel(2) => i_kernel3,
		          i_kernel(3) => i_kernel4,
		          i_data 	  => i_data,
		          o_data(0)   => o_data1,
		          o_data(1)   => o_data2,
		          o_data(2)   => o_data3,
		          o_data(3)   => o_data4,
		          tc          => tb_tc, 
		          tc2         => tb_tc2,  
		          cnt1        => tb_cnt1,       
		          cnt2        => tb_cnt2			  
				  
			     );
				 
	fsm : fsm_fully_connected
	    port map(
		
		         clk            => clk,
                 rst_fsm        => rst_fsm,		
		         start          => start, 
                 tc             => tb_tc,	
                 tc2            => tb_tc2,
                 en_cnt1        => tb_en_cnt1,   
                 rst_cnt1       => tb_rst_cnt1,
                 en_cnt2        => tb_en_cnt2,    
                 rst_cnt2       => tb_rst_cnt2,					
		         rst            => tb_rst,
	             sync_clr       => tb_sync_clr			
				  
         	     );	

tc <= tb_tc;					

end behavior;
