library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;


package dp_pkg is

    constant W      : natural := 8;
    constant N      : natural := 4;
    constant BG     : natural := 12;
    constant CLOG2W : natural := natural(CEIL(LOG2(real(W))));

    type dp_cmd_t is record
        
        mem_rd_data   : std_logic;
        mem_rd_weight : std_logic;
        en_npu        : std_logic;
        ldh_v_n       : std_logic;
        rd_pipe       : std_logic;
        en_p_2_2      : std_logic;
        
    end record;

    type dp_ptr_t is record --! 3b all
        wr_addr_h : std_logic_vector(CLOG2W-1 downto 0);
        rd_addr_h : std_logic_vector(CLOG2W-1 downto 0);
        rd_mux_h  : std_logic_vector(2 downto 0);
        rd_mux_v  : std_logic_vector(CLOG2W-1 downto 0);
        
    end record;

    --! DP_EXTRA

    constant IDX_CNT_WIDTH : natural := 4;

    --! IDX [loop counters]
    type idx_cnt_mod_t is record
        nif     : std_logic_vector(IDX_CNT_WIDTH-1 downto 0);
        nof     : std_logic_vector(IDX_CNT_WIDTH-1 downto 0);
        block_y : std_logic_vector(IDX_CNT_WIDTH-1 downto 0);
        block_x : std_logic_vector(IDX_CNT_WIDTH-1 downto 0);
        
    end record;

    type idx_cnt_en_t is record
        nif     : std_logic;
        nof     : std_logic;
        block_y : std_logic;
        block_x : std_logic;
        
    end record;


    type idx_cnt_tc_t is record
        nif     : std_logic;
        nof     : std_logic;
        block_y : std_logic;
        block_x : std_logic;
        
    end record;

    type idx_cnt_q_t is record
        nif     : std_logic_vector(IDX_CNT_WIDTH-1 downto 0);
        nof     : std_logic_vector(IDX_CNT_WIDTH-1 downto 0);
        block_y : std_logic_vector(IDX_CNT_WIDTH-1 downto 0);
        block_x : std_logic_vector(IDX_CNT_WIDTH-1 downto 0);
        
    end record;

    --! MAC [loop counters]

    constant MAC_CNT_WIDTH : natural := 3;

    type mac_cnt_mod_t is record
        kx : std_logic_vector(MAC_CNT_WIDTH-1 downto 0);
        ky : std_logic_vector(MAC_CNT_WIDTH-1 downto 0);
        re : std_logic_vector(MAC_CNT_WIDTH-1 downto 0);
        
    end record;

    type mac_cnt_en_t is record
        npu : std_logic;
        kx  : std_logic;
        ky  : std_logic;
        re  : std_logic;
        
    end record;

    type mac_cnt_tc_t is record
        npu : std_logic;
        ldk : std_logic;
        kx  : std_logic;
        ky  : std_logic;
        re  : std_logic;
        
    end record;


    type mac_cnt_q_t is record
        npu : std_logic_vector(MAC_CNT_WIDTH-1 downto 0);
        kx  : std_logic_vector(MAC_CNT_WIDTH-1 downto 0);
        ky  : std_logic_vector(MAC_CNT_WIDTH-1 downto 0);
        re  : std_logic_vector(MAC_CNT_WIDTH-1 downto 0);
        
    end record;

    --! ADDR
    type addressgen_cmd_t is record
        en_word          : std_logic;
        en_nif           : std_logic;
        en_block_y       : std_logic;
        en_block_x_even  : std_logic;
        en_block_x_odd   : std_logic;
        clr_word         : std_logic;
        clr_nif          : std_logic;
        clr_block_y      : std_logic;
        clr_block_x_even : std_logic;
        clr_block_x_odd  : std_logic;
        
    end record;

    type addressgen_weight_cmd_t is record
        en_base  : std_logic;
        en_offs  : std_logic;
        clr_base : std_logic;
        clr_offs : std_logic;
        
    end record;

end package;
