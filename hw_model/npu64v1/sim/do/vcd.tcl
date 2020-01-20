set NETLIST_DIR "../netlist"
set SRC_DIR "../src"
#set TEST_DIR "../sim"
set TB_DIR "tb/"
#"../sim/tb"
set DESIGN "dp" 
set DUT "dp_inst"
set TB "test"
set CLK 4

vlib work
vmap work

# Compile sources

# package
vcom -93 -work work ${SRC_DIR}/pkg/globals.pkg.vhd
# SV package
vlog -sv ${TB_DIR}/pkg/globals.pkg.sv
# modules
set f [open ${SRC_DIR}/hier.txt r]
foreach src [split [read $f] "\n"] {
	if { $src ne "" } { 
	vcom -93 -work work -novopt -source -rangecheck -check_synthesis +cover=ft ${SRC_DIR}/${src}}
}

# DUT
vlog ${NETLIST_DIR}/${DESIGN}.v

# Test
vlog -sv ${TB_DIR}/${TB}.sv

# Simulate (link Cells and Standard Delay File)

vsim -L /software/dk/nangate45/verilog/msim6.2g -sdftyp ${TB}/${DUT}=${NETLIST_DIR}/${DESIGN}.sdf work.${TB}

# Write VCD

vcd file ../vcd/${DESIGN}.vcd
vcd add /${TB}/${DUT}/*

# Run sim.
run -all
