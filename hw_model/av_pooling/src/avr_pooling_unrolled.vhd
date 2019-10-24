library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	
	use work.param.all;
	
entity avr_pooling_unrolled is

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
		o_pool_1      : out signed((W*N-1) downto 0);
		o_pool_2      : out signed((W*N-1) downto 0);
		o_pool_3      : out signed((W*N-1) downto 0);
		o_pool_4      : out signed((W*N-1) downto 0)
	);

end avr_pooling_unrolled;

architecture behavior of avr_pooling_unrolled is
	
	component avr_pooling is
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
	end component;
	
	signal data_out	:	PEBlockData;
	
begin
	
	pool :	avr_pooling	port map(
							clk           =>	clk,
							rst_fsm       =>	rst_fsm,	
							start         =>	start,
							done		  =>	done,
							en			  =>	en,
							size_1 		  =>	size_1,
							size_2 		  =>	size_2,
							pool_sel      =>	pool_sel,
							d_0 	      =>	d_0,
							d_1 	      =>	d_1,
							d_2 	      =>	d_2,
							d_3 	      =>	d_3,	
							d_4 	      =>	d_4,	
							d_5 	      =>	d_5,	
							d_6 	      =>	d_6,
							d_7 	      =>	d_7,
							o_pool 	      =>	data_out
						);
	
	o_pool_1	<=	data_out(0);
	o_pool_2	<=	data_out(1);
	o_pool_3	<=	data_out(2);
	o_pool_4	<=	data_out(3);
	
end behavior;