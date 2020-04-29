library ieee;
use ieee.std_logic_1164.all;
use work.mem_pkg.all;
use work.dp_pkg.all;
use work.cu_pkg.all;

entity dp_top is
    
    port(
        clk                       : in  std_logic;
        rst_n                     : in  std_logic;
--
        fc_i                      : in  std_logic;
--      --! fsm  
        mem_rd_data_i             : in  std_logic;
        mem_rd_weight_i           : in  std_logic;
        en_npu_i                  : in  std_logic;
        ldh_v_n_i                 : in  std_logic;
        ldk_i                     : in  std_logic;
        en_cnt_kx_i               : in  std_logic;
        en_cnt_ky_i               : in  std_logic;
        en_cnt_re_i               : in  std_logic;
        update_idx_i              : in  std_logic;
        --
        idx_cnt_tc_nif_o          : out std_logic;
        idx_cnt_tc_nof_o          : out std_logic;
        idx_cnt_tc_block_x_o      : out std_logic;
        idx_cnt_tc_block_y_o      : out std_logic;
        mac_cnt_tc_npu_o          : out std_logic;
        mac_cnt_tc_ldk_o          : out std_logic;
        mac_cnt_tc_kx_o           : out std_logic;
        mac_cnt_tc_ky_o           : out std_logic;
        mac_cnt_tc_re_o           : out std_logic;
--      --! cfg 
        cfg_idx_cnt_mod_nif_i     : in  std_logic_vector(IDX_CNT_WIDTH-1 downto 0);
        cfg_idx_cnt_mod_nof_i     : in  std_logic_vector(IDX_CNT_WIDTH-1 downto 0);
        cfg_idx_cnt_mod_block_y_i : in  std_logic_vector(IDX_CNT_WIDTH-1 downto 0);
        cfg_idx_cnt_mod_block_x_i : in  std_logic_vector(IDX_CNT_WIDTH-1 downto 0);
        cfg_mac_cnt_mod_kx_i      : in  std_logic_vector(MAC_CNT_WIDTH-1 downto 0);
        cfg_mac_cnt_mod_ky_i      : in  std_logic_vector(MAC_CNT_WIDTH-1 downto 0);
        cfg_mac_cnt_mod_re_i      : in  std_logic_vector(MAC_CNT_WIDTH-1 downto 0);
--
        cfg_addr_stride_nif_i     : in  std_logic_vector(ADDR_WIDTH_INT-1 downto 0);
        cfg_addr_stride_word_i    : in  std_logic_vector(ADDR_WIDTH_INT-1 downto 0);
        cfg_addr_stride_block_y_i : in  std_logic_vector(ADDR_WIDTH_INT-1 downto 0);
        cfg_addr_stride_block_x_i : in  std_logic_vector(ADDR_WIDTH_INT-1 downto 0);
--
        data_h_i                  : in  std_logic_vector(N*W-1 downto 0);  --! 32
        data_v_i                  : in  std_logic_vector(N*W-1 downto 0);  --! 32
--
        weight_i                  : in  std_logic_vector(1 downto 0);  --! 2
        weight_fc_i               : in  std_logic_vector(2*W*W-1 downto 0);  --! 128
--
        data_o                    : out std_logic_vector(N*W-1 downto 0);
--        
        mem_be_o                  : out std_logic_vector(1 downto 0);
        mem_xb_o                  : out std_logic;
        addr_data_even_o          : out std_logic_vector(ADDR_WIDTH_INT-1 downto 0);
        addr_data_odd_o           : out std_logic_vector(ADDR_WIDTH_INT-1 downto 0);
        addr_weight_o             : out std_logic_vector(ADDR_WIDTH_INT_W-1 downto 0)

        );

end entity;

architecture rtl of dp_top is

    signal dp_ptr_int       : dp_ptr_t;
    signal dp_cmd_int       : dp_cmd_t;
    signal dp_ckg_rmask_int : std_logic_vector(0 to W-1);
    signal dp_ckg_cmask_int : std_logic_vector(0 to W-1);
    
begin


    dp_cmd_int.mem_rd_data   <= mem_rd_data_i;
    dp_cmd_int.mem_rd_weight <= mem_rd_weight_i;
    dp_cmd_int.en_npu        <= en_npu_i;
    dp_cmd_int.ldh_v_n       <= ldh_v_n_i;
    dp_cmd_int.rd_pipe       <= en_cnt_re_i;
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

    dp_extra_1 : entity work.dp_extra   --! flat
        
        port map (

            clk                       => clk,
            rst_n                     => rst_n,
--            
            --
--
            mem_rd_data_i             => mem_rd_data_i,
            mem_rd_weight_i           => mem_rd_weight_i,
--            
            --
--            
            en_cnt_kx_i               => en_cnt_kx_i,
            en_cnt_ky_i               => en_cnt_ky_i,
            en_cnt_re_i               => en_cnt_re_i,
            update_idx_i              => update_idx_i,
--            
            --
--            
            idx_cnt_tc_nif_o          => idx_cnt_tc_nif_o,
            idx_cnt_tc_nof_o          => idx_cnt_tc_nof_o,
            idx_cnt_tc_block_x_o      => idx_cnt_tc_block_x_o,
            idx_cnt_tc_block_y_o      => idx_cnt_tc_block_y_o,
            mac_cnt_tc_npu_o          => mac_cnt_tc_npu_o,
            mac_cnt_tc_ldk_o          => mac_cnt_tc_ldk_o,
            mac_cnt_tc_kx_o           => mac_cnt_tc_kx_o,
            mac_cnt_tc_ky_o           => mac_cnt_tc_ky_o,
            mac_cnt_tc_re_o           => mac_cnt_tc_re_o,
--            
            --
--            
            cfg_idx_cnt_mod_nif_i     => cfg_idx_cnt_mod_nif_i,
            cfg_idx_cnt_mod_nof_i     => cfg_idx_cnt_mod_nof_i,
            cfg_idx_cnt_mod_block_y_i => cfg_idx_cnt_mod_block_y_i,
            cfg_idx_cnt_mod_block_x_i => cfg_idx_cnt_mod_block_x_i,
--
            --
--            
            cfg_mac_cnt_mod_kx_i      => cfg_mac_cnt_mod_kx_i,
            cfg_mac_cnt_mod_ky_i      => cfg_mac_cnt_mod_ky_i,
            cfg_mac_cnt_mod_re_i      => cfg_mac_cnt_mod_re_i,
--            
            --
--            
            cfg_addr_stride_nif_i     => cfg_addr_stride_nif_i,
            cfg_addr_stride_word_i    => cfg_addr_stride_word_i,
            cfg_addr_stride_block_y_i => cfg_addr_stride_block_y_i,
            cfg_addr_stride_block_x_i => cfg_addr_stride_block_x_i,
--            
            --
--            
            dp_ptr_wr_addr_h_o        => dp_ptr_int.wr_addr_h,
            dp_ptr_rd_addr_h_o        => dp_ptr_int.rd_addr_h,
            dp_ptr_rd_mux_v_o         => dp_ptr_int.rd_mux_v,
            dp_ptr_rd_mux_h_o         => dp_ptr_int.rd_mux_h,
            dp_ckg_rmask_o            => dp_ckg_rmask_int,
            dp_ckg_cmask_o            => dp_ckg_cmask_int,
--            
            --
--            
            addr_data_even_o          => addr_data_even_o,
            addr_data_odd_o           => addr_data_odd_o,
            addr_weight_o             => addr_weight_o



            );




end architecture;
