read_verilog -netlist ../netlist/top.v
read_saif -verbose -input ../saif/top.saif -instance tb/DUT -unit ns -scale 1
create_clock -name MY_CLK clk
report_power > saif.rpt
