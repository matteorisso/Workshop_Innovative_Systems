use work.fixed_pkg.all;

package ptype is


constant qi : natural:=8;
constant qf : natural:=8;

constant px : natural:=4; -- pe array x-dim
constant py	: natural:=4; -- pe array y-dim
 

type matrix is array (0 to py-1, 0 to px-1) of sfixed(qi-1 downto -qf); -- inter-pe wire matrix

type data_h is array (0 to py-1) of sfixed(qi-1 downto -qf);
type data_v is array (0 to px-1) of sfixed(qi-1 downto -qf);

end package; 
