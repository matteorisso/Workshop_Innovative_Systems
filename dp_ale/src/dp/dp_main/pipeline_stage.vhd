library ieee;
use ieee.std_logic_1164.all;
use work.dp_pkg.all;

entity pipeline_stage is

    port (
        clk   : in  std_logic;
        rst_n : in  std_logic;
        cmd_i : in  dp_cmd_t;
        ptr_i : in  dp_ptr_t;
        cmd_o : out dp_cmd_t;
        ptr_o : out dp_ptr_t

        );

end entity;

architecture beh of pipeline_stage is

begin



    --! pass through
    cmd_o.mem_rd_data <= cmd_i.mem_rd_data;
    cmd_o.en_p_2_2    <= cmd_i.en_p_2_2;
    ptr_o.wr_addr_h   <= ptr_i.wr_addr_h;




    --! q1 
    process(clk, rst_n)
    begin
        if (rst_n = '0') then
            
            ptr_o.rd_addr_h <= (others => '0');
            ptr_o.rd_mux_h  <= (others => '0');
            ptr_o.rd_mux_v  <= (others => '0');
        elsif rising_edge(clk) then
            
            if (cmd_i.en_npu = '1') then
                
                ptr_o.rd_addr_h <= ptr_i.rd_addr_h;
                ptr_o.rd_mux_h  <= ptr_i.rd_mux_h;
                ptr_o.rd_mux_v  <= ptr_i.rd_mux_v;
                
            end if;
            
        end if;

    end process;


    process(clk, rst_n)
    begin
        if (rst_n = '0') then

            cmd_o.en_npu  <= '0';
            cmd_o.ldh_v_n <= '0';
            cmd_o.rd_pipe <= '0';
            
        elsif rising_edge(clk) then

            cmd_o.en_npu  <= '1';
            cmd_o.ldh_v_n <= '1';
            cmd_o.rd_pipe <= '1';
            
        end if;

    end process;


    
end architecture;
