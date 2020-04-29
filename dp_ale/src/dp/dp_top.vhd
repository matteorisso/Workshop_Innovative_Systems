library ieee;
use ieee.std_logic_1164.all;
use work.mem_pkg.all;
use work.dp_pkg.all;
use work.cu_pkg.all;

entity dp_top is
    
    port(
        clk               : in  std_logic;
        rst_n             : in  std_logic;
--
        fc_i              : in  std_logic;
--                
        ctrl_i            : in  fsm_cmd_t;
        flag_o            : out fsm_flag_t;
--
        cfg_idx_mod_i     : in  idx_cnt_mod_t;  --! <-- cfg
        cfg_mac_mod_i     : in  mac_cnt_mod_t;  --! <-- cfg
        cfg_addr_stride_i : in  addressgen_stride_t;  --! <-- cfg
--
        data_h_i          : in  std_logic_vector(N*W-1 downto 0);    --! 32
        data_v_i          : in  std_logic_vector(N*W-1 downto 0);    --! 32
--
        weight_i          : in  std_logic_vector(1 downto 0);        --! 2
        weight_fc_i       : in  std_logic_vector(2*W*W-1 downto 0);  --! 128
--
        data_o            : out std_logic_vector(N*W-1 downto 0);
--        
        mem_be_o          : out std_logic_vector(1 downto 0);
        mem_xb_o          : out std_logic;
        addr_data_even_o  : out std_logic_vector(ADDR_WIDTH_INT-1 downto 0);
        addr_data_odd_o   : out std_logic_vector(ADDR_WIDTH_INT-1 downto 0);
        addr_weight_o     : out std_logic_vector(ADDR_WIDTH_INT_W-1 downto 0)

        );

end entity;

architecture rtl of dp_top is
    
    signal dp_ptr_int       : dp_ptr_t;
    signal dp_cmd_int       : dp_cmd_t;
    signal dp_ckg_rmask_int : std_logic_vector(0 to W-1);
    signal dp_ckg_cmask_int : std_logic_vector(0 to W-1);
    
begin


    dp_cmd_int.mem_rd_data   <= ctrl_i.mem_rd_data;
    dp_cmd_int.mem_rd_weight <= ctrl_i.mem_rd_weight;
    dp_cmd_int.en_npu        <= ctrl_i.en_npu;
    dp_cmd_int.ldh_v_n       <= ctrl_i.ldh_v_n;
    dp_cmd_int.rd_pipe       <= ctrl_i.en_cnt_re;
    dp_cmd_int.en_p_2_2      <= '0';    --!TMP


    dp_main_1 : entity work.dp_main
        
        port map (
            clk         => clk,
            rst_n       => rst_n,
            fc_i        => fc_i,
            --
            cmd_i       => dp_cmd_int,
            --
            ptr_i       => dp_ptr_int,
            ckg_rmask_i => dp_ckg_rmask_int,
            ckg_cmask_i => dp_ckg_cmask_int,
            --
            weight_i    => weight_i,
            weight_fc_i => weight_fc_i,
            data_v_i    => data_v_i,
            data_h_i    => data_h_i,
            data_o      => data_o

            );

    dp_extra_1 : entity work.dp_extra
        
        port map (
            clk               => clk,
            rst_n             => rst_n,
            --
            ctrl_i            => ctrl_i,
            flag_o            => flag_o,
            --
            cfg_idx_mod_i     => cfg_idx_mod_i,
            cfg_mac_mod_i     => cfg_mac_mod_i,
            cfg_addr_stride_i => cfg_addr_stride_i,
            --
            dp_ptr_o          => dp_ptr_int,
            dp_ckg_rmask_o    => dp_ckg_rmask_int,
            dp_ckg_cmask_o    => dp_ckg_cmask_int,
            --
            addr_data_even_o  => addr_data_even_o,
            addr_data_odd_o   => addr_data_odd_o,
            addr_weight_o     => addr_weight_o

            );



end architecture;
