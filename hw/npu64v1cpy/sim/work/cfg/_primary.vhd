library verilog;
use verilog.vl_types.all;
entity cfg is
    port(
        opcode          : in     vl_logic_vector(2 downto 0);
        arv_KSI         : out    vl_logic_vector(2 downto 0);
        arv_CKG         : out    vl_logic_vector(2 downto 0);
        arv_L0          : out    vl_logic_vector(3 downto 0);
        arv_L1          : out    vl_logic_vector(3 downto 0);
        arv_L2          : out    vl_logic_vector(3 downto 0);
        arv_L3          : out    vl_logic_vector(3 downto 0);
        arv_L4          : out    vl_logic_vector(3 downto 0)
    );
end cfg;
