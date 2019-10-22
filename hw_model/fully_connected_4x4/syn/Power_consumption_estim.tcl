read_verilog -netlist ../netlist/fully_connected_all.v
read_saif -input ../saif/fully_connected_all_syn.saif -instance tb_fc/UUT -unit ns -scale 1
create_clock -name MY_CLK clk
