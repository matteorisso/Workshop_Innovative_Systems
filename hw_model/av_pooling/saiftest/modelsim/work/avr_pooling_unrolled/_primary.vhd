library verilog;
use verilog.vl_types.all;
entity avr_pooling_unrolled is
    port(
        clk             : in     vl_logic;
        rst_fsm         : in     vl_logic;
        start           : in     vl_logic;
        done            : in     vl_logic;
        en              : in     vl_logic;
        size_1          : in     vl_logic_vector(4 downto 0);
        size_2          : in     vl_logic_vector(4 downto 0);
        pool_sel        : in     vl_logic;
        d_0             : in     vl_logic_vector(15 downto 0);
        d_1             : in     vl_logic_vector(15 downto 0);
        d_2             : in     vl_logic_vector(15 downto 0);
        d_3             : in     vl_logic_vector(15 downto 0);
        d_4             : in     vl_logic_vector(15 downto 0);
        d_5             : in     vl_logic_vector(15 downto 0);
        d_6             : in     vl_logic_vector(15 downto 0);
        d_7             : in     vl_logic_vector(15 downto 0);
        o_pool_1        : out    vl_logic_vector(15 downto 0);
        o_pool_2        : out    vl_logic_vector(15 downto 0);
        o_pool_3        : out    vl_logic_vector(15 downto 0);
        o_pool_4        : out    vl_logic_vector(15 downto 0)
    );
end avr_pooling_unrolled;
