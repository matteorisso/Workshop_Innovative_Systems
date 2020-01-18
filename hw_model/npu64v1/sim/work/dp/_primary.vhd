library verilog;
use verilog.vl_types.all;
entity dp is
    port(
        ck              : in     vl_logic;
        rst             : in     vl_logic;
        i_acth          : in     vl_logic_vector(15 downto 0);
        i_actv          : in     vl_logic_vector(15 downto 0);
        i_weight        : in     vl_logic_vector(1 downto 0);
        arv_npu         : in     vl_logic_vector(2 downto 0);
        arv_ckg         : in     vl_logic_vector(2 downto 0);
        arv_k           : in     vl_logic_vector(2 downto 0);
        arv_tile        : in     vl_logic_vector(1 downto 0);
        arv_ifmaps      : in     vl_logic_vector(2 downto 0);
        arv_ofmaps      : in     vl_logic_vector(3 downto 0);
        ctrl_en_npu     : in     vl_logic;
        ctrl_ldh_v_n    : in     vl_logic;
        ctrl_en_hmode   : in     vl_logic;
        ctrl_en_vmode   : in     vl_logic;
        ctrl_wr_pipe    : in     vl_logic;
        s_tc_hmode      : out    vl_logic;
        s_tc_vmode      : out    vl_logic;
        s_tc_res        : out    vl_logic;
        s_tc_npu_ptr    : out    vl_logic;
        s_tc_tilev      : out    vl_logic;
        s_tc_tileh      : out    vl_logic;
        s_tc_ifmaps     : out    vl_logic;
        s_tc_ofmaps     : out    vl_logic;
        i_data_even_addr: out    vl_logic_vector(9 downto 0);
        i_data_odd_addr : out    vl_logic_vector(9 downto 0);
        i_data_ev_odd_n : out    vl_logic;
        o_data          : out    vl_logic_vector(63 downto 0)
    );
end dp;
