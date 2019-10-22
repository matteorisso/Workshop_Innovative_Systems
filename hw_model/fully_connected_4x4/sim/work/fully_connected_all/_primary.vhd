library verilog;
use verilog.vl_types.all;
entity fully_connected_all is
    port(
        clk             : in     vl_logic;
        rst_fsm         : in     vl_logic;
        start           : in     vl_logic;
        ckg_rmask       : in     vl_logic_vector(0 to 3);
        ckg_cmask       : in     vl_logic_vector(0 to 3);
        layer_fc        : in     vl_logic_vector(1 downto 0);
        i_kernel1       : in     vl_logic_vector(7 downto 0);
        i_kernel2       : in     vl_logic_vector(7 downto 0);
        i_kernel3       : in     vl_logic_vector(7 downto 0);
        i_kernel4       : in     vl_logic_vector(7 downto 0);
        i_data          : in     vl_logic_vector(3 downto 0);
        o_data1         : out    vl_logic_vector(43 downto 0);
        o_data2         : out    vl_logic_vector(43 downto 0);
        o_data3         : out    vl_logic_vector(43 downto 0);
        o_data4         : out    vl_logic_vector(43 downto 0);
        tc              : out    vl_logic
    );
end fully_connected_all;
