library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.globals.all;

entity pe_array is
port(
	ck 					: in 	std_logic;
	rst 					: in 	std_logic;
	en						: in 	std_logic;
	ld_h					: in	std_logic;
	ld_v					: in	std_logic;
	wr_pipe				: in	std_logic;
	ckg_rmask  			: in 	std_logic_vector(0 to W-1);
	ckg_cmask 			: in 	std_logic_vector(0 to W-1);
	i_weight_conv	 	: in	std_logic_vector(N_WEIGHT-1 downto 0); 
	i_data_conv_h		: in 	PERowData2;
	i_data_conv_v		: in 	PERowData2;
	i_data_pool			: in 	PEBlockData;
	i_weight_fc			: in 	std_logic_vector(N_WEIGHT-1 downto 0);--TMP CHECK ALE
	i_data_fc			: in 	signed(N-1 downto 0);
	o_data				: out PEResData2
	);
end entity; 

architecture rtl of pe_array is

component pe_v2 
port(
	ck 			: in 	std_logic; 
	rst 			: in 	std_logic;
	en				: in 	std_logic;
	ld_h			: in 	std_logic;
	ld_v			: in 	std_logic; 
	wr_pipe		: in 	std_logic;	
	weight 		: in	std_logic_vector(N_WEIGHT-1 downto 0);
	i_data_h		: in	signed(N-1 downto 0);
	i_data_v		: in 	signed(N-1 downto 0);
	i_data_acc	: in 	signed(N-1+BG downto 0);
	o_data_h		: out signed(N-1 downto 0);
	o_data_v		: out signed(N-1 downto 0);
	o_data_res	: out signed(N-1+BG downto 0)
	);
end component; 

type ckg_mask_t is array (0 to W-1) of std_logic_vector(0 to W-1);
type int_matrix_t is array (0 to W-1, 0 to W-1) of signed(N-1 downto 0);
type int_matrix_res_t is array (0 to W-1, 0 to W) of signed(N-1+BG downto 0);

signal int_pe_en 			: ckg_mask_t; 
signal int_data_x 		: int_matrix_t;
signal int_data_y			: int_matrix_t;
signal int_data_res 		: int_matrix_res_t;

signal int_ld_h			: std_logic;
signal int_ld_v			: std_logic;
signal int_wr_pipe		: std_logic;
signal int_weight			: std_logic_vector(N_WEIGHT-1 downto 0);

begin

int_ld_h				<= ld_h;
int_ld_v				<= ld_v;
int_wr_pipe			<= wr_pipe;
int_weight			<= i_weight_conv;

int_data_res(0,W)	<= (others=>'0');
int_data_res(1,W)	<= (others=>'0');
int_data_res(2,W)	<= (others=>'0');
int_data_res(3,W)	<= (others=>'0');

o_data(0)			<= int_data_res(0,0);
o_data(1)			<= int_data_res(1,0);
o_data(2)			<= int_data_res(2,0);
o_data(3)			<= int_data_res(3,0);

ckg_row:
for i in 0 to W-1 generate ckg_col:
	for j in 0 to W-1 generate
		int_pe_en(i)(j) <= en and (ckg_rmask(i) nor ckg_cmask(j));
	end generate;
end generate; 

dh:for i in 0 to W-1 generate
	int_data_x(i,W-1) <= i_data_conv_h(i);
end generate;
dv:for j in 0 to W-1 generate
	int_data_y(W-1,j) <= i_data_conv_v(j);
end generate;

mesh_body:
for i in 1 to W-1 generate c:
	for j in 1 to W-1 generate peij:	
		pe_v2	port map ( 
			ck 			=>ck,
			rst			=>rst,
			en				=>int_pe_en(i)(j),
			ld_h			=>int_ld_h,
			ld_v			=>int_ld_v,
			wr_pipe		=>int_wr_pipe,
			weight		=>int_weight,
			i_data_h		=>int_data_x(i,j),
			i_data_v		=>int_data_y(i,j),
			i_data_acc	=>int_data_res(i,j+1),
			o_data_h		=>int_data_x(i,j-1),
			o_data_v		=>int_data_y(i-1,j),
			o_data_res	=>int_data_res(i,j)
			);
	end generate;
end generate;

top_row:
for j in 0 to W-1 generate left_corner:
	if j = 0 generate peij:	
		pe_v2	port map ( 
			ck 			=>ck,
			rst			=>rst,
			en				=>int_pe_en(0)(0),
			ld_h			=>int_ld_h,
			ld_v			=>int_ld_v,
			wr_pipe		=>int_wr_pipe,
			weight		=>int_weight,
			i_data_h		=>int_data_x(0,0),
			i_data_v		=>int_data_y(0,0),
			i_data_acc	=>int_data_res(0,1),
			o_data_res	=>int_data_res(0,0)
			);
	end generate;
	
	any:
	if j > 0 generate peij:	
		pe_v2	port map ( 
			ck 			=>ck,
			rst			=>rst,
			en				=>int_pe_en(0)(j),
			ld_h			=>int_ld_h,
			ld_v			=>int_ld_v,
			wr_pipe		=>int_wr_pipe,
			weight		=>int_weight,
			i_data_h		=>int_data_x(0,j),
			i_data_v		=>int_data_y(0,j),
			i_data_acc	=>int_data_res(0,j+1),
			o_data_h		=>int_data_x(0,j-1),
			o_data_res	=>int_data_res(0,j)
			);
	end generate;
end generate; 

left_col:
for i in 1 to W-1 generate peij:	
	pe_v2	port map ( 
		ck 			=>ck,
		rst			=>rst,
		en				=>int_pe_en(i)(0),
		ld_h			=>int_ld_h,
		ld_v			=>int_ld_v,
		wr_pipe		=>int_wr_pipe,
		weight		=>int_weight,
		i_data_h		=>int_data_x(i,0),
		i_data_v		=>int_data_y(i,0),
		i_data_acc	=>int_data_res(i,1),
		o_data_v		=>int_data_y(i-1,0),
		o_data_res 	=>int_data_res(i,0)
		);
end generate; 

end architecture;
