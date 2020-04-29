library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dp_pkg.all;

entity pe is
    
    port(
        clk         : in  std_logic;
        rst_n       : in  std_logic;
        fc_i        : in  std_logic;
        en_i        : in  std_logic;
        clk_gate_i  : in  std_logic;
        ldh_v_ni    : in  std_logic;
        rd_pipe_i   : in  std_logic;
        data_fc_i   : in  std_logic_vector(N-1 downto 0);
        weight_fc_i : in  std_logic_vector(1 downto 0);
        weight_i    : in  std_logic_vector(1 downto 0);
        data_h_i    : in  std_logic_vector(N-1 downto 0);
        data_v_i    : in  std_logic_vector(N-1 downto 0);
        data_acc_i  : in  std_logic_vector(N+BG-1 downto 0);
        data_h_o    : out std_logic_vector(N-1 downto 0);
        data_v_o    : out std_logic_vector(N-1 downto 0);
        data_o      : out std_logic_vector(N+BG-1 downto 0)

        );

end entity;

architecture beh of pe is
    --
    --! activation
    --
    signal reg_v_q_int   : std_logic_vector(N-1 downto 0);
    signal reg_h_q_int   : std_logic_vector(N-1 downto 0);
    signal reg_grd_q_int : std_logic_vector(N-1 downto 0);
    --
    --! weight
    --
    signal weight_int    : std_logic_vector(1 downto 0);
    --    
    --! accumulator i_o
    --
    signal acc_d_int     : std_logic_vector(N+BG-1 downto 0);
    signal acc_q_int     : std_logic_vector(N+BG-1 downto 0);
    --
    --! addsubtractor i 
    --
    signal op_a_int      : std_logic_vector(N+BG-1 downto 0);
    signal op_b_int      : std_logic_vector(N+BG-1 downto 0);
    signal s_int         : std_logic_vector(N+BG-1 downto 0);
    signal add_sub_n_int : std_logic;
begin





    --! input activation buffer
    input_data_reg_h : process(clk, rst_n)
    begin
        
        if rst_n = '0' then
            
            reg_h_q_int <= (others => '0');
            
        elsif rising_edge(clk) then
            
            if en_i = '1' then
                
                if ldh_v_ni = '1' then
                    
                    if fc_i = '1' then
                        
                        reg_h_q_int <= data_fc_i;
                        
                    else
                        
                        reg_h_q_int <= data_v_i;
                        
                    end if;
                    
                else
                    
                    reg_h_q_int <= data_h_i;
                    
                end if;  --! ldh_v_ni
                
                
            end if;  --! ld activation enable
            
        end if;  --! clk
        
    end process;


    --! activation _o
    h_reg_pin : data_h_o <= reg_h_q_int;
    v_reg_pin : data_v_o <= reg_v_q_int;


    input_data_reg_v : process(clk, rst_n)
    begin
        
        if rst_n = '0' then
            
            reg_v_q_int <= (others => '0');
            
        elsif rising_edge(clk) then
            
            if (ldh_v_ni and not(fc_i)) = '1' then
                
                reg_v_q_int <= data_v_i;
                
            end if;  --! ld activation enable
            
        end if;  --! clk
        
    end process;


    weight_int <= weight_fc_i when fc_i = '1' else weight_i;


    --! zero-weight activation guard
    process(clk, rst_n)
    begin

        if (rst_n = '0') then
            
            reg_grd_q_int <= (others => '0');
            
        elsif rising_edge(clk) then
            
            if (weight_int(1) = '1') then
                
                reg_grd_q_int <= reg_h_q_int;
                
            end if;
            
        end if;

    end process;




    --! op
    add_sub_n_int <= weight_int(0);
    op_a_int      <= acc_q_int;

    --! sign extend
    op_b_int(op_a_int'high downto reg_h_q_int'length) <= (others => '0');
    op_b_int(reg_h_q_int'high downto 0)               <= reg_h_q_int when weight_int(1) = '1' else reg_grd_q_int;


    addsub_1 : entity work.addsub
        generic map (
            n => N+BG)

        port map (
            a_i        => op_a_int,
            b_i        => op_b_int,
            add_sub_ni => add_sub_n_int,
            s_i        => s_int

            );




    --! accumulation reg
    acc_d_int <= s_int when rd_pipe_i = '0' else data_acc_i;



    acc : process(clk, rst_n)
    begin
        
        if rst_n = '0' then
            
            acc_q_int <= (others => '0');
            
        elsif rising_edge(clk) then
            
            if (((ldh_v_ni nor clk_gate_i) and weight_int(1)) or rd_pipe_i) = '1' then
                
                acc_q_int <= acc_d_int;
                
            end if;  --! enable
            
        end if;  --! clk
        
    end process;




    --! rd pipe results guard
    acc_pin_mask : for i in 0 to data_o'high generate
        
        data_o(i) <= rd_pipe_i and acc_q_int(i);
        
    end generate;


    
    
end architecture;
