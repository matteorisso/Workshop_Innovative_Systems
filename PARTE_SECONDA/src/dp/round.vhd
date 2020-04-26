library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;            -- OR_REDUCE
use ieee.numeric_std.all;
use work.dp_pkg.all;

entity round is  --// round half to n.even (zero mean)    
    generic (N_I : natural := N+2; N_O : natural := N);
    
    port (
        data_i : in  std_logic_vector(N_I-1 downto 0);
        data_o : out std_logic_vector(N_O-1 downto 0)

        );

end entity;

architecture beh of round is
    
    constant LSB : natural := (N_I - N_O);
begin

    process (data_i)
    begin
        
        if data_i(LSB-1) = '1' then     --// =.5
            
            if OR_REDUCE(data_i(LSB-2 downto 0)) = '1' then  --// >.5
                
                data_o <= std_logic_vector(unsigned(data_i(data_i'high downto LSB)) + 1);
                
            else                        --// tie-breaker
                
                if data_i(LSB) = '1' then  --// is odd
                    
                    data_o <= std_logic_vector(unsigned(data_i(data_i'high downto LSB)) + 1);
                    
                else
                    
                    data_o <= data_i(data_i'high downto LSB);  --// floor
                    
                end if;
                
            end if;
            
        else
                                                       --// <.5
            data_o <= data_i(data_i'high downto LSB);  --// floor
            
        end if;
        
    end process;
    
end architecture;
