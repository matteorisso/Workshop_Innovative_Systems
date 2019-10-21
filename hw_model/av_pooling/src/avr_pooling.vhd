library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	
	use work.param.all;
	
entity avr_pooling is

	port(
		clk           : in  std_logic;
		rst_fsm       : in  std_logic;		
		start         : in  std_logic; 
		done		  : in  std_logic;
		en			  : in  std_logic; 
		size_1 		  :	in 	std_logic_vector(4 downto 0);
		size_2 		  :	in 	std_logic_vector(4 downto 0);
		pool_sel      :	in	std_logic;
		d_0 	      : in 	signed((W*N-1) downto 0);
		d_1 	      : in 	signed((W*N-1) downto 0);
		d_2 	      : in 	signed((W*N-1) downto 0);
		d_3 	      : in 	signed((W*N-1) downto 0);	
		d_4 	      : in 	signed((W*N-1) downto 0);	
		d_5 	      : in 	signed((W*N-1) downto 0);	
		d_6 	      : in 	signed((W*N-1) downto 0);	
		d_7 	      : in 	signed((W*N-1) downto 0);
		o_pool 	      : out PEBlockData
	);

end avr_pooling;

architecture behavior of avr_pooling is
	
	component avr_pooling_eu is
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
	end component;
	
	component avr_pooling_fsm is
		port( 
			clk            	: 	in  std_logic;
			rst_fsm        	: 	in  std_logic;		
			start          	: 	in  std_logic; 
			done		   	: 	in  std_logic;
			tc             	: 	in  std_logic;	
			rst_cnt_c		:	out	std_logic;
			rst_cnt_r		:	out	std_logic;
			ld_h			:	out	std_logic;
			sel             : 	out std_logic;
			en_cnt1         : 	out std_logic;    
			rst_cnt1        : 	out std_logic;					
			rst             : 	out std_logic;
			sync_clr      	: 	out std_logic		
			);
	end component;
	
	component cgu is
		port(
			clk			: 	in 	std_logic;
			size_1 		: 	in 	std_logic_vector(4 downto 0);
			size_2 		: 	in 	std_logic_vector(4 downto 0);
			pool_sel	:	in	std_logic;
			tc			:	in	std_logic;
			ld_h		:	in	std_logic;
			rst_h		:	in	std_logic;
			rst_cnt_c	:	in	std_logic;
			rst_cnt_r	:	in	std_logic;
			ckg_rmask	: 	out	std_logic_vector(0 to W-1);
			ckg_cmask	: 	out	std_logic_vector(0 to W-1)
		);
	end component;

	signal rst		:	std_logic;
	signal sel		:	std_logic;
	signal sync_clr	:	std_logic;
	signal rst_cnt	:	std_logic;
	signal en_cnt	:	std_logic;
	signal tc		:	std_logic;
	
	signal rst_cnt_c:	std_logic;
	signal rst_cnt_r:	std_logic;
	signal ld_h		:	std_logic;
	
	signal ckg_cmask:	std_logic_vector(3 downto 0);
	signal ckg_rmask:	std_logic_vector(3 downto 0);
	
begin
	
	pool : avr_pooling_eu
		port map(
				ck 		  =>	clk,
				rst       =>	rst,
				sel       =>	sel,
				d_0 	  =>	d_0,
				d_1 	  =>	d_1,
				d_2 	  =>	d_2,
				d_3 	  =>	d_3,	
				d_4 	  =>	d_4,
				d_5 	  =>	d_5,
				d_6 	  =>	d_6,
				d_7 	  =>	d_7,
				sync_clr  =>	sync_clr,
				en		  =>	en,
				ckg_rmask =>	ckg_rmask,
				ckg_cmask =>	ckg_cmask, 
				rst_cnt   =>	rst_cnt,
				en_cnt    =>	en_cnt,
				o_pool 	  =>	o_pool,
				tc        =>	tc
			    );
				 
	fsm : avr_pooling_fsm
	    port map(
		        clk           =>	clk,
				rst_fsm       =>	rst_fsm,
				start         =>	start,
				done		  =>	done,
				tc            =>	tc,
				sel           =>	sel,
				rst_cnt_c	  =>	rst_cnt_c,
				rst_cnt_r	  =>	rst_cnt_r,
				ld_h		  =>	ld_h,
				en_cnt1       =>	en_cnt,
				rst_cnt1      =>	rst_cnt,	
				rst           =>	rst,
				sync_clr      =>	sync_clr
         	    );
	
	gate_clk : cgu	
		port map(
				clk			=>	clk,
				size_1 		=>	size_1,
				size_2 		=>	size_2,
				pool_sel	=>	pool_sel,
				tc			=>	tc,
				ld_h		=>	ld_h,
				rst_h		=>	rst,
				rst_cnt_c	=>	rst_cnt_c,
				rst_cnt_r	=>	rst_cnt_r,
				ckg_rmask	=>	ckg_rmask,
				ckg_cmask	=>	ckg_cmask
				);

end behavior;