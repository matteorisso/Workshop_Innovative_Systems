# Loads the technological library and the SDF, resolution is ps
vsim -voptargs=+acc -L /software/dk/nangate45/verilog/msim6.5c -sdftyp /tb_pool/UUT=../avr_pooling.sdf work.tb_pool -t ps

#add wave *

# Generates the VCD file and add all the DUT signals
vcd file ../avr_pooling.vcd
vcd add /tb_pool/UUT/*

# runs the simulation
run 300ns
