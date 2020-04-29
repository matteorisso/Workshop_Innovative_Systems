library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mod_counter is
    generic (N : natural := 8);
    port (
        clk   : in  std_logic;
        rst_n : in  std_logic;
        en_i  : in  std_logic;                       --! enable
        clr_i : in  std_logic;                       --! synch. rst
        mod_i : in  std_logic_vector(N-1 downto 0);  --! modulus
        tc_o  : out std_logic;                       --! terminal count
        q_o   : out std_logic_vector(N-1 downto 0)   --! count 
        );
end entity;

architecture beh of mod_counter is
    
    signal q_int  : unsigned(N-1 downto 0);
    signal tc_int : std_logic;
begin
    
    q_o  <= std_logic_vector(q_int);
    tc_o <= tc_int;

    tc_int <= '1' when q_int = unsigned(mod_i) else '0';

    process(clk, rst_n)
    begin
        
        if (rst_n = '0') then
            
            q_int <= (others => '0');   -- async rst
            
        elsif rising_edge(clk) then
            
            
            if (clr_i = '1') then
                
                q_int <= (others => '0');  --! sync rst

            elsif (en_i = '1') then
                
                if (tc_int = '1') then
                    
                    q_int <= (others => '0');  --! sync rst
                                               --
                else
                    
                    q_int <= q_int + 1;  --! inc                    
                    
                end if;
                
            end if;
            
        end if;
        
    end process;


end architecture;
