library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;            -- OR_REDUCE
use ieee.numeric_std.all;
use work.dp_pkg.all;

entity relu is
    generic (N_I : natural := N+BG; N_O : natural := N);
    
    port (
        data_i : in  std_logic_vector(N_I-1 downto 0);
        data_o : out std_logic_vector(N_O-1 downto 0)

        );

end entity;

architecture beh of relu is

    --! flag
    signal sat_int : std_logic;
    signal msb_int : std_logic;
begin


    
    sat_int <= OR_REDUCE(std_logic_vector(data_i(N_I-1 downto N_O)));
    msb_int <= data_i(data_i'high);

    process(data_i, sat_int)
    begin
        
        if msb_int = '1' then           --! is_negative
            
            data_o <= (others => '0');
            
        else
            
            if sat_int = '1' then       --! clip to max
                
                data_o <= (others => '1');
                
            else                        --! trunc
                
                data_o <= data_i(N_O-1 downto 0);
                
            end if;
            
        end if;
        
    end process;
    
end architecture;

