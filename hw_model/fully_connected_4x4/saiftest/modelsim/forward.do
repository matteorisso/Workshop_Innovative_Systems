# Loads the technological library and the SDF, resolution is ps
vsim -voptargs=+acc -L /software/dk/nangate45/verilog/msim6.5c -sdftyp /tb_fc/UUT=../fully_connected_all.sdf work.tb_fc -t ps

#add wave *

# Generates the VCD file and add all the DUT signals
vcd file ../fully_connected_all.vcd
vcd add /tb_fc/UUT/*

# runs the simulation
run 1600ns
