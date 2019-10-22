ungroup -all -flatten
change_names -hierarchy -rules verilog
write_sdf ../netlist/myfir.sdf
write -f verilog -hierarchy -output ../netlist/myfir.v
write_sdc ../netlist/myfir.sdc

