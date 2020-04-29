library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dp_pkg.all;

entity act_buffer_h is
    
    port (
        clk          : in  std_logic;
        rst_n        : in  std_logic;
        --! buffer 
        wr_i         : in  std_logic;
        wr_addr_i    : in  std_logic_vector(CLOG2W-1 downto 0);
        rd_addr_i    : in  std_logic_vector(CLOG2W-1 downto 0);
        --! output mux-array
        sel_rd_mux_i : in  std_logic_vector(2 downto 0);
        --! data
        data_i       : in  std_logic_vector(N*4-1 downto 0);
        data_o       : out std_logic_vector(N*W-1 downto 0)

        );

end entity;

architecture beh of act_buffer_h is

    --! registers
    type regs_t is array (0 to W-1) of std_logic_vector(N*4-1 downto 0);
    signal reg_q_int  : regs_t;
    --! mux array (rotate)    
    signal data_o_int : regs_t;
begin



    --! buffer ctrl
    wr_1 : process(clk, rst_n)
    begin
        
        if rst_n = '0' then
            
            reg_q_int <= (others => (others => '0'));
            
        elsif rising_edge(clk) then
            
            if wr_i = '1' then
                
                reg_q_int(to_integer(unsigned(wr_addr_i))) <= data_i;
                
            end if;
            
        end if;
        
    end process;




    rotate_1 : process(reg_q_int, rd_addr_i)
    begin
        
        case (to_integer(unsigned(rd_addr_i))) is
            
            when 1 => data_o_int <= reg_q_int(1 to reg_q_int'high) & reg_q_int(0);
            when 2 => data_o_int <= reg_q_int(2 to reg_q_int'high) & reg_q_int(0 to 1);
            when 3 => data_o_int <= reg_q_int(3 to reg_q_int'high) & reg_q_int(0 to 2);
            when 4 => data_o_int <= reg_q_int(4 to reg_q_int'high) & reg_q_int(0 to 3);
            when 5 => data_o_int <= reg_q_int(5 to reg_q_int'high) & reg_q_int(0 to 4);
            when 6 => data_o_int <= reg_q_int(6 to reg_q_int'high) & reg_q_int(0 to 5);
            when 7 => data_o_int <= reg_q_int(7 to reg_q_int'high) & reg_q_int(0 to 6);

            when others => data_o_int <= reg_q_int;
                           
        end case;
        
    end process;




                                        --! activations select_op 
    mux_1 : process(data_o_int, sel_rd_mux_i)
    begin
        
        case (to_integer(unsigned(sel_rd_mux_i))) is
            
            when 1 =>
                
                for i in 0 to W-1 loop
                    
                    data_o(data_o'high - i*N downto data_o'length - (i+1)*N)
                        
                        <= data_o_int(i)(data_o_int(i)'high - 1*N downto data_o_int(i)'length - 2*N);
                    
                end loop;

                
            when 2 =>
                
                for i in 0 to W-1 loop
                    
                    data_o(data_o'high - i*N downto data_o'length - (i+1)*N)
                        
                        <= data_o_int(i)(data_o_int(i)'high - 2*N downto data_o_int(i)'length - 3*N);
                    
                end loop;

                
            when 3 =>
                
                for i in 0 to W-1 loop
                    
                    data_o(data_o'high - i*N downto data_o'length - (i+1)*N)
                        
                        <= data_o_int(i)(data_o_int(i)'high - 3*N downto data_o_int(i)'length - 4*N);
                    
                end loop;

                
            when others =>
                
                for i in 0 to W-1 loop
                    
                    data_o(data_o'high - i*N downto data_o'length - (i+1)*N)
                        
                        <= data_o_int(i)(data_o_int(i)'high - 0*N downto data_o_int(i)'length - 1*N);
                    
                end loop;
                
        end case;
        
    end process;


end architecture;
