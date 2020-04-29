library ieee;
use ieee.std_logic_1164.all;
use work.dp_pkg.all;

entity dp_main is

    port(
        clk                 : in  std_logic;
        rst_n               : in  std_logic;
--        
        fc_i                : in  std_logic;
--
        cmd_mem_rd_data_i   : in  std_logic;
        cmd_mem_rd_weight_i : in  std_logic;
        cmd_en_npu_i        : in  std_logic;
        cmd_ldh_v_n_i       : in  std_logic;
        cmd_rd_pipe_i       : in  std_logic;
        cmd_en_p_2_2_i      : in  std_logic;
--
        ptr_wr_addr_h_i     : in  std_logic_vector(2 downto 0);
        ptr_rd_addr_h_i     : in  std_logic_vector(2 downto 0);
        ptr_rd_mux_h_i      : in  std_logic_vector(2 downto 0);
        ptr_rd_mux_v_i      : in  std_logic_vector(2 downto 0);
--
        ckg_rmask_i         : in  std_logic_vector(0 to W-1);
        ckg_cmask_i         : in  std_logic_vector(0 to W-1);
--
        weight_i            : in  std_logic_vector(1 downto 0);
        weight_fc_i         : in  std_logic_vector(2*W*W-1 downto 0);
--        
        data_v_i            : in  std_logic_vector(N*W-1 downto 0);
        data_h_i            : in  std_logic_vector(N*W-1 downto 0);
--        
        data_o              : out std_logic_vector(N*W-1 downto 0)

        );


end entity;

architecture rtl of dp_main is
    
    signal cmd_i         : dp_cmd_t;
    signal ptr_i         : dp_ptr_t;
    signal cmd_int       : dp_cmd_t;
    signal ptr_int       : dp_ptr_t;
--
    signal data_h_int    : std_logic_vector(N*W-1 downto 0);
    signal data_v_int    : std_logic_vector(N*W-1 downto 0);
--
    signal data_npu_int  : std_logic_vector((N+BG)*W-1 downto 0);
    signal data_relu_int : std_logic_vector(N*W-1 downto 0);
    signal data_p_int    : std_logic_vector(N*(W/2)-1 downto 0);
    signal weight_int    : std_logic_vector(1 downto 0);
--
    signal weight_fc_int : std_logic_vector(2*W*W-1 downto 0);
    signal data_fc_int   : std_logic_vector(N-1 downto 0);
begin

--
    --! flat i/o
    --! -------------------------------------------------------------------------------------

    cmd_i.mem_rd_data   <= cmd_mem_rd_data_i;
    cmd_i.mem_rd_weight <= cmd_mem_rd_weight_i;
    cmd_i.en_npu        <= cmd_en_npu_i;
    cmd_i.ldh_v_n       <= cmd_ldh_v_n_i;
    cmd_i.rd_pipe       <= cmd_rd_pipe_i;
    cmd_i.en_p_2_2      <= cmd_en_p_2_2_i;
    ptr_i.wr_addr_h     <= ptr_wr_addr_h_i;
    ptr_i.rd_addr_h     <= ptr_rd_addr_h_i;
    ptr_i.rd_mux_h      <= ptr_rd_mux_h_i;
    ptr_i.rd_mux_v      <= ptr_rd_mux_v_i;

    --! -------------------------------------------------------------------------------------

    pipeline_stage_1 : entity work.pipeline_stage
        
        port map (
            clk   => clk,
            rst_n => rst_n,
            cmd_i => cmd_i,
            ptr_i => ptr_i,
            cmd_o => cmd_int,
            ptr_o => ptr_int

            );

    
    weight_buffer_1 : process(clk, rst_n)
    begin

        if rst_n = '0' then
            
            weight_int <= (others => '0');
            
        elsif rising_edge(clk) then
            
            if (cmd_i.mem_rd_weight and not(fc_i)) = '1' then
                
                weight_int <= weight_i;
                
            end if;
            
        end if;

    end process;


    weight_str_buffer_1 : process(clk, rst_n)
    begin

        if rst_n = '0' then
            
            weight_fc_int <= (others => '0');
            
        elsif rising_edge(clk) then
            
            if (cmd_i.mem_rd_weight and fc_i) = '1' then
                
                weight_fc_int <= weight_fc_i;
                
            end if;
            
        end if;

        
    end process;


    act_buffer_h_1 : entity work.act_buffer_h
        
        port map (
            clk          => clk,
            rst_n        => rst_n,
            wr_i         => cmd_int.mem_rd_data,
            wr_addr_i    => ptr_int.wr_addr_h,
            rd_addr_i    => ptr_int.rd_addr_h,
            sel_rd_mux_i => ptr_int.rd_mux_h,
            data_i       => data_h_i(N*4-1 downto 0),
            data_o       => data_h_int

            );

    act_buffer_v_1 : entity work.act_buffer_v
        
        port map (
            clk          => clk,
            rst_n        => rst_n,
            fc_i         => fc_i,
            en_i         => cmd_int.mem_rd_data,
            sel_rd_mux_i => ptr_int.rd_mux_v,
            data_i       => data_v_i,
            data_o       => data_v_int,
            data_fc_o    => data_fc_int

            );

    npu_1 : entity work.npu
        
        port map (
            clk         => clk,
            rst_n       => rst_n,
            fc_i        => fc_i,
            en_i        => cmd_int.en_npu,
            ldh_v_ni    => cmd_int.ldh_v_n,
            rd_pipe_i   => cmd_int.rd_pipe,
            ckg_rmask_i => ckg_rmask_i,
            ckg_cmask_i => ckg_cmask_i,
            data_fc_i   => data_fc_int,
            weight_fc_i => weight_fc_int,
            weight_i    => weight_int,
            data_h_i    => data_h_int,
            data_v_i    => data_v_int,
            data_acc_i  => (others => '0'),
            data_o      => data_npu_int

            );

    gen_relu_1 : for i in 0 to W-1 generate
        
        relu_i : entity work.relu
            
            port map (
                data_i => data_npu_int(data_npu_int'high - i*(N+BG) downto data_npu_int'length - (i+1)*(N+BG)),
                data_o => data_relu_int(data_relu_int'high - i*N downto data_relu_int'length - (i+1)*N)

                );

    end generate;

    gen_p_2_2_1 : for i in 0 to W/2-1 generate
        
        p_2_2_i : entity work.p_2_2
            
            port map (
                clk      => clk,
                rst_n    => rst_n,
                en_i     => cmd_int.en_p_2_2,
                data_1_i => data_relu_int(data_relu_int'high - i*2*N downto data_relu_int'length - N*(i*2+1)),
                data_2_i => data_relu_int(data_relu_int'high - (i*2+1)*N downto data_relu_int'length - N*(i*2+2)),
                data_o   => data_p_int(data_p_int'high - i*N downto data_p_int'length - (i+1)*N)

                );

    end generate;


    

    

    
end architecture;
