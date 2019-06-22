library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.fixed_pkg.all; 
use work.ptype.all;

entity nfu is
generic ( qi : natural := 8 ; qf : natural := 8 );
port(
		ck 			: in std_logic; 
		rstn		: in std_logic; 
		ld_v 		: in std_logic;
		ld_h 		: in std_logic; 
		sel			: in std_logic;
		weight		: in sfixed(qi-1 downto -qf);
		din_h		: in data_h;
		din_v		: in data_v;
		omap		: out matrix);
end entity;


architecture structure of nfu is

component pe
generic( qi : natural:= 8; qf : natural:=8 );
port(
		ck 			: in std_logic; 
		rstn		: in std_logic; 
		ld_v 		: in std_logic;
		ld_h 		: in std_logic; 
		sel			: in std_logic;
		weight		: in sfixed(qi-1 downto -qf);
		pe_right 	: in sfixed(qi-1 downto -qf);
		pe_bottom	: in sfixed(qi-1 downto -qf);
		pe_top		: out sfixed(qi-1 downto -qf);
		pe_left		: out sfixed(qi-1 downto -qf);
		omap		: out sfixed(qi-1 downto -qf));
		
end component; 


signal data_x 	: matrix;
signal data_y	: matrix;

begin

	
dh:for i in 0 to py-1 generate
	data_x(i,px-1) <= din_h(i);
end generate;

dv:for j in 0 to px-1 generate
	data_y(py-1,j) <= din_v(j);
end generate;


-- most of the matrix:

r:for i in 1 to py-1 generate
	c:for j in 1 to px-1 generate
		pei:	pe	generic map ( qi => qi, qf => qf )
							port map ( 
										ck 			=>ck,
										rstn		=>rstn,
										ld_v		=>ld_v,
										ld_h		=>ld_h,
										sel			=>sel,
										weight		=>weight,
										pe_right	=>data_x(i,j),
										pe_bottom	=>data_y(i,j),
										pe_left		=>data_x(i,j-1),
										pe_top		=>data_y(i-1,j),
										omap		=>omap(i,j));
	end generate;
end generate;


-- NW contour :

left_c:
for i in 1 to py-1 generate 
	pei:	pe	generic map ( qi => qi, qf => qf )
							port map ( 
										ck 			=>ck,
										rstn		=>rstn,
										ld_v		=>ld_v,
										ld_h		=>ld_h,
										sel			=>sel,
										weight		=>weight,
										pe_right	=>data_x(i,0),
										pe_bottom	=>data_y(i,0),
										pe_top		=>data_y(i-1,0),
										omap		=>omap(i,0));
end generate; 

top_r:
for j in 0 to px-1 generate

	left_corner:
	if j = 0 generate
	pei:	pe	generic map ( qi => qi, qf => qf )
							port map ( 
										ck 			=>ck,
										rstn		=>rstn,
										ld_v		=>ld_v,
										ld_h		=>ld_h,
										sel			=>sel,
										weight		=>weight,
										pe_right	=>data_x(0,0),
										pe_bottom	=>data_y(0,0),
										omap		=>omap(0,0));
	end generate;
	
	top_c:
	if j > 0 generate
	pei:	pe	generic map ( qi => qi, qf => qf )
							port map ( 
										ck 			=>ck,
										rstn		=>rstn,
										ld_v		=>ld_v,
										ld_h		=>ld_h,
										sel			=>sel,
										weight		=>weight,
										pe_right	=>data_x(0,j),
										pe_bottom	=>data_y(0,j),
										pe_left		=>data_x(0,j-1),
										omap		=>omap(0,j));
	end generate;
end generate; 
				

end architecture; 