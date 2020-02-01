set NETLIST_DIR "../netlist"
set SRC_DIR "../src"
#set TEST_DIR "../sim"
set TB_DIR "tb/"
#"../sim/tb"
set DESIGN "dp" 
set DUT "dp_inst"
set TB "test"
set CLK 4

file delete -force -- wor

vlib work
vmap work

# Compile 

# package
vcom -93 -work work ${SRC_DIR}/pkg/globals.pkg.vhd
vlog -sv ${TB_DIR}/pkg/globals.pkg.sv

# TB
vlog -sv ${TB_DIR}/${TB}.sv

# DUT
vlog ${NETLIST_DIR}/${DESIGN}.v

# Simulate (link Cells and Standard Delay File)

vsim -L /software/dk/nangate45/verilog/msim6.2g -sdftyp ${TB}/${DUT}=${NETLIST_DIR}/${DESIGN}.sdf work.${TB}

# Write VCD

vcd file ../vcd/${DESIGN}.vcd
vcd add /${TB}/${DUT}/*

add wave * 
add wave sim:/fsm_inst/*
add wave sim:/dp_inst/*

# Run sim.
run -all

