library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dp_pkg.all;

entity p_2_2 is
    
    port (
        clk      : in  std_logic;
        rst_n    : in  std_logic;
        en_i     : in  std_logic;
        data_1_i : in  std_logic_vector(N-1 downto 0);
        data_2_i : in  std_logic_vector(N-1 downto 0);
        data_o   : out std_logic_vector(N-1 downto 0)

        );

end entity;


architecture beh of p_2_2 is

    signal tap1_1_int    : unsigned(N-1 downto 0);
    signal tap1_2_int    : unsigned(N-1 downto 0);
    signal tap2_1_int    : unsigned(N-1 downto 0);
    signal tap2_2_int    : unsigned(N-1 downto 0);
--
    signal sum_round_int : std_logic_vector(N-1 downto 0);
    signal sum_int       : std_logic_vector(N+1 downto 0);
begin
    
    process(clk, rst_n)
    begin
        
        if rst_n = '0' then
            
            tap1_1_int <= (others => '0');
            tap1_2_int <= (others => '0');
            tap2_1_int <= (others => '0');
            tap2_2_int <= (others => '0');
            
        elsif rising_edge(clk) then
            
            if en_i = '1' then
                
                tap1_1_int <= unsigned(data_1_i);
                tap1_2_int <= unsigned(data_2_i);
                tap2_1_int <= tap1_1_int;
                tap2_2_int <= tap1_2_int;
                
            end if;
            
        end if;
        
    end process;




    sum_int <= std_logic_vector(unsigned("00"&tap1_1_int) + unsigned("00"&tap2_1_int) + unsigned("00"&tap1_2_int) + unsigned("00"&tap2_2_int));




    round_1 : entity work.round
        port map (
            data_i => sum_int,
            data_o => sum_round_int

            );



    
    process(clk, rst_n)
    begin
        
        if rst_n = '0' then
            
            data_o <= (others => '0');
            
        elsif rising_edge(clk) then
            
            if en_i = '1' then

                data_o <= sum_round_int;
                
            end if;
            
        end if;
        
    end process;




end architecture;
