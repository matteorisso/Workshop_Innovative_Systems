library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mem_pkg.all;
use work.cu_pkg.all;
use work.dp_pkg.all;

entity dp_extra is
    
    port (
        clk                       : in  std_logic;
        rst_n                     : in  std_logic;
--        
--      --! fsm  
        mem_rd_data_i             : in  std_logic;
        mem_rd_weight_i           : in  std_logic;
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
--
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
--      --! ptr -> main
        dp_ptr_wr_addr_h_o        : out std_logic_vector(CLOG2W-1 downto 0);
        dp_ptr_rd_addr_h_o        : out std_logic_vector(CLOG2W-1 downto 0);
        dp_ptr_rd_mux_v_o         : out std_logic_vector(CLOG2W-1 downto 0);
        dp_ptr_rd_mux_h_o         : out std_logic_vector(2 downto 0);
        dp_ckg_rmask_o            : out std_logic_vector(0 to W-1);
        dp_ckg_cmask_o            : out std_logic_vector(0 to W-1);
--
--      --! addr -> mem
        addr_data_even_o          : out std_logic_vector(ADDR_WIDTH_INT-1 downto 0);
        addr_data_odd_o           : out std_logic_vector(ADDR_WIDTH_INT-1 downto 0);
        addr_weight_o             : out std_logic_vector(ADDR_WIDTH_INT-1 downto 0)

        );

end entity;




architecture rtl of dp_extra is

--  --! flatten
    signal ctrl_i              : fsm_cmd_t;
    signal cfg_idx_mod_i       : idx_cnt_mod_t;
    signal cfg_addr_stride_i   : addressgen_stride_t;
--
--
    signal nif_z_int           : std_logic;  --! nif == 0
    signal dpc_i_int           : std_logic;  --! depthwise_conv/input_img address flag
--
    signal idx_cnt_en_int      : idx_cnt_en_t;
    signal idx_cnt_tc_int      : idx_cnt_tc_t;
    signal idx_cnt_q_int       : idx_cnt_q_t;
--
    signal mac_cnt_en_int      : mac_cnt_en_t;
    signal mac_cnt_tc_int      : mac_cnt_tc_t;
    signal mac_cnt_q_int       : mac_cnt_q_t;
    signal mac_cnt_mod_int_1   : mac_cnt_mod_t;
    signal mac_cnt_mod_int_2   : mac_cnt_mod_t;
--
    signal addr_weight_cmd_int : addressgen_weight_cmd_t;
    signal addr_cmd_int        : addressgen_cmd_t;
    signal addr_q_int          : addressgen_q_t;
    --
    signal ckg_mask_int        : std_logic_vector(0 to W-1);
begin

--
    --! flat i/o
    --! -------------------------------------------------------------------------------------

    ctrl_i.mem_rd_data        <= mem_rd_data_i;
    ctrl_i.mem_rd_weight      <= mem_rd_weight_i;
    ctrl_i.en_cnt_kx          <= en_cnt_kx_i;
    ctrl_i.en_cnt_ky          <= en_cnt_ky_i;
    ctrl_i.en_cnt_re          <= en_cnt_re_i;
    ctrl_i.update_idx         <= update_idx_i;
    cfg_idx_mod_i.nif         <= cfg_idx_cnt_mod_nif_i;
    cfg_idx_mod_i.nof         <= cfg_idx_cnt_mod_nof_i;
    cfg_idx_mod_i.block_y     <= cfg_idx_cnt_mod_block_y_i;
    cfg_idx_mod_i.block_x     <= cfg_idx_cnt_mod_block_x_i;
    mac_cnt_mod_int_1.kx      <= cfg_mac_cnt_mod_kx_i;
    mac_cnt_mod_int_1.ky      <= cfg_mac_cnt_mod_ky_i;
    mac_cnt_mod_int_1.re      <= cfg_mac_cnt_mod_re_i;
    cfg_addr_stride_i.nif     <= cfg_addr_stride_nif_i;
    cfg_addr_stride_i.word    <= cfg_addr_stride_word_i;
    cfg_addr_stride_i.block_y <= cfg_addr_stride_block_y_i;
    cfg_addr_stride_i.block_x <= cfg_addr_stride_block_x_i;
    idx_cnt_tc_nif_o          <= idx_cnt_tc_int.nif;
    idx_cnt_tc_nof_o          <= idx_cnt_tc_int.nof;
    idx_cnt_tc_block_y_o      <= idx_cnt_tc_int.block_y;
    idx_cnt_tc_block_x_o      <= idx_cnt_tc_int.block_x;
    mac_cnt_tc_npu_o          <= mac_cnt_tc_int.npu;
    mac_cnt_tc_ldk_o          <= mac_cnt_tc_int.ldk;
    mac_cnt_tc_kx_o           <= mac_cnt_tc_int.kx;
    mac_cnt_tc_ky_o           <= mac_cnt_tc_int.ky;
    mac_cnt_tc_re_o           <= mac_cnt_tc_int.re;

    --! ------------------------------------------------------------------------------------


    mac_cnt_en_int.npu <= ctrl_i.mem_rd_data;
    mac_cnt_en_int.kx  <= ctrl_i.en_cnt_kx;
    mac_cnt_en_int.ky  <= ctrl_i.en_cnt_ky;
    mac_cnt_en_int.re  <= ctrl_i.en_cnt_re;

    mac_cnt_mod_int_2.kx <= mac_cnt_mod_int_1.kx;
    mac_cnt_mod_int_2.ky <= mac_cnt_mod_int_1.ky;
    mac_cnt_mod_int_2.re <= mac_cnt_mod_int_1.re when idx_cnt_tc_int.block_y = '1' else std_logic_vector(to_unsigned(7, MAC_CNT_WIDTH));


    mac_cnt_1 : entity work.mac_cnt
        
        port map (
            clk   => clk,
            rst_n => rst_n,
            dpc_i => dpc_i_int,         --! depthwise/input            
            mod_i => mac_cnt_mod_int_1,
            en_i  => mac_cnt_en_int,
            tc_o  => mac_cnt_tc_int,
            q_o   => mac_cnt_q_int

            );

    dp_ptr_wr_addr_h_o <= mac_cnt_q_int.npu;
    dp_ptr_rd_addr_h_o <= mac_cnt_q_int.npu;
    dp_ptr_rd_mux_h_o  <= mac_cnt_q_int.kx;
    dp_ptr_rd_mux_v_o  <= mac_cnt_q_int.kx;




    idx_cnt_1 : entity work.idx_cnt
        
        port map (
            clk   => clk,
            rst_n => rst_n,
            mod_i => cfg_idx_mod_i,
            en_i  => ctrl_i.update_idx,
            tc_o  => idx_cnt_tc_int,
            en_o  => idx_cnt_en_int,
            q_o   => idx_cnt_q_int

            );



    
    nif_z_int <= '1' when unsigned(cfg_idx_mod_i.nif) = to_unsigned(0, IDX_CNT_WIDTH) else '0';
    dpc_i_int <= nif_z_int and not(idx_cnt_tc_int.block_y);




    addressgen_data_logic_1 : entity work.addressgen_data_logic
        
        port map (
            nif_z_i      => nif_z_int,
            en_base_i    => ctrl_i.update_idx,
            en_offs_i    => ctrl_i.mem_rd_data,
            idx_cnt_en_i => idx_cnt_en_int,
            idx_cnt_tc_i => idx_cnt_tc_int,
            idx_cnt_q_i  => idx_cnt_q_int,
            cmd_o        => addr_cmd_int

            );

    addressgen_1 : entity work.addressgen

        port map (
            clk      => clk,
            rst_n    => rst_n,
            cmd_i    => addr_cmd_int,
            stride_i => cfg_addr_stride_i,
            addr_o   => addr_q_int

            );

    addr_data_even_o <= addr_q_int.even;
    addr_data_odd_o  <= addr_q_int.odd;



    addressgen_weight_logic_1 : entity work.addressgen_weight_logic
        
        port map (
            en_offs_i    => ctrl_i.mem_rd_weight,
            idx_cnt_en_i => idx_cnt_en_int,
            idx_cnt_tc_i => idx_cnt_tc_int,
            cmd_o        => addr_weight_cmd_int

            );

    addressgen_weight_1 : entity work.addressgen_weight
        
        port map (
            clk    => clk,
            rst_n  => rst_n,
            cmd_i  => addr_weight_cmd_int,
            addr_o => addr_weight_o

            );



    
    dp_ckg_rmask_o <= ckg_mask_int when idx_cnt_tc_int.block_y = '1' else (others => '0');
    dp_ckg_cmask_o <= ckg_mask_int when idx_cnt_tc_int.block_x = '1' else (others => '0');


    process(mac_cnt_mod_int_1.re)
    begin

        case (to_integer(unsigned(mac_cnt_mod_int_1.re))) is

            when 1      => ckg_mask_int <= "10000000";
            when 2      => ckg_mask_int <= "11000000";
            when 3      => ckg_mask_int <= "11100000";
            when 4      => ckg_mask_int <= "11110000";
            when 5      => ckg_mask_int <= "11111000";
            when 6      => ckg_mask_int <= "11111100";
            when 7      => ckg_mask_int <= "11111110";
            when others => ckg_mask_int <= (others => '0');
                           
        end case;

        
    end process;

    


    
end architecture;
