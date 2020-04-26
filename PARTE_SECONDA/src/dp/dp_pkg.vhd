library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;


package dp_pkg is

    constant W      : natural := 8;
    constant N      : natural := 4;
    constant BG     : natural := 12;
    constant CLOG2W : natural := natural(CEIL(LOG2(real(W))));
    
end package;
