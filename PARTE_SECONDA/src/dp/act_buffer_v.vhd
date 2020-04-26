library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dp_pkg.all;

entity act_buffer_v is
    
    port(
        clk          : in  std_logic;
        rst_n        : in  std_logic;
        en_i         : in  std_logic;
        fc_i         : in  std_logic;
        sel_rd_mux_i : in  std_logic_vector(CLOG2W-1 downto 0);
        data_i       : in  std_logic_vector(N*W-1 downto 0);
        data_o       : out std_logic_vector(N*W-1 downto 0);
        data_fc_o    : out std_logic_vector(N-1 downto 0)

        );

end entity;

architecture beh of act_buffer_v is

    signal reg_q_int      : std_logic_vector(N*W-1 downto 0);
    signal data_fc_int    : std_logic_vector(N-1 downto 0);
    signal sel_rd_mux_int : std_logic_vector(CLOG2W-1 downto 0);
begin



    --! register
    reg : process(clk, rst_n)
    begin
        
        if rst_n = '0' then
            
            reg_q_int <= (others => '0');
            
        elsif rising_edge(clk) then
            
            if en_i = '1' then
                
                reg_q_int <= data_i;
                
            end if;
            
        end if;
        
    end process;




    --! FC output
    rd_mux : process (sel_rd_mux_int, reg_q_int)
    begin
        
        case to_integer(unsigned(sel_rd_mux_int)) is
            
            when 1 => data_fc_int <= reg_q_int(reg_q_int'high - 1*N downto reg_q_int'length - 2*N);
            when 2 => data_fc_int <= reg_q_int(reg_q_int'high - 2*N downto reg_q_int'length - 3*N);
            when 3 => data_fc_int <= reg_q_int(reg_q_int'high - 3*N downto reg_q_int'length - 4*N);
            when 4 => data_fc_int <= reg_q_int(reg_q_int'high - 4*N downto reg_q_int'length - 5*N);
            when 5 => data_fc_int <= reg_q_int(reg_q_int'high - 5*N downto reg_q_int'length - 6*N);
            when 6 => data_fc_int <= reg_q_int(reg_q_int'high - 6*N downto reg_q_int'length - 7*N);
            when 7 => data_fc_int <= reg_q_int(reg_q_int'high - 7*N downto reg_q_int'length - 8*N);

            when others => data_fc_int <= reg_q_int(reg_q_int'high - 0*N downto reg_q_int'length - 1*N);
                           
        end case;
        
    end process;



    --! guard C output
    gen_mask_1 : for i in 0 to data_o'high generate
        
        data_o(i) <= not(fc_i) and reg_q_int(i);
        
    end generate;


    

    --! guard sel_rd_mux_i
    gen_mask_2 : for i in 0 to sel_rd_mux_i'high generate
        
        sel_rd_mux_int(i) <= fc_i and sel_rd_mux_i(i);
        
    end generate;




    --! guard FC output
    gen_mask_3 : for i in 0 to data_fc_o'high generate
        
        data_fc_o(i) <= fc_i and data_fc_int(i);

    end generate;


    
end architecture;

