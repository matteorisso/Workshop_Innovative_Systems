library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package mem_pkg is

    constant ADDR_WIDTH_INT   : natural := 16;
    constant ADDR_WIDTH_INT_W : natural := 16;

    type addressgen_stride_t is record
        nif     : std_logic_vector(ADDR_WIDTH_INT-1 downto 0);
        word    : std_logic_vector(ADDR_WIDTH_INT-1 downto 0);
        block_x : std_logic_vector(ADDR_WIDTH_INT-1 downto 0);
        block_y : std_logic_vector(ADDR_WIDTH_INT-1 downto 0);
        
    end record;


    type addressgen_q_t is record
        even : std_logic_vector(ADDR_WIDTH_INT-1 downto 0);
        odd  : std_logic_vector(ADDR_WIDTH_INT-1 downto 0);
        
    end record;

end package;
