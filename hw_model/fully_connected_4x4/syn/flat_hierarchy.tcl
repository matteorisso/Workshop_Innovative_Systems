ungroup -all -flatten
change_names -hierarchy -rules verilog
write_sdf ../netlist/fully_connected_all.sdf
write -f verilog -hierarchy -output ../netlist/fully_connected_all.v
write_sdc ../netlist/fully_connected_all.sdc

