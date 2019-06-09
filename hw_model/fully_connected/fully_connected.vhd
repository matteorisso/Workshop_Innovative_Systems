library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package IFMAP_OFMAP_type is
  constant IFMAP_size : integer := 400;
  constant IFMAP_size : integer := 120;
  type IFMAP_type is array(0 to IFMAP_size-1) of std_logic_vector(15 downto 0);
end package IFMAP_OFMAP_type;
    
entity fully_connected is
  --generic(
    --IFMAP_size : integer;
    --OFMAP_size : integer
    --);
  
  port(	
    IFMAP : in 
    );
end entity;

architecture behavior of fully_connected is
  begin

end behavior;
