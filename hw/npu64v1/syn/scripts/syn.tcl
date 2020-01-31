pwd 

file delete -force -- work

set DIR "../"
set DESIGN "dp" 
set CLK 2

# Analyze source files

analyze -f vhdl -l work ${DIR}/src/pkg/globals.pkg.vhd
analyze -f sverilog -l work ${DIR}/sim/tb/pkg/globals.pkg.sv

set f [open ${DIR}/src/hier.txt r]
foreach src [split [read $f] "\n"] {
	if { $src ne "" } { 
	    analyze -f vhdl -l work ${DIR}/src/${src}
	}
}
set power_preserve_rtl_hier_names true
set power_cg_flatten true 

# Elaborate design

elaborate -lib work ${DESIGN} > ./elaborate.txt 

uniquify 
link

create_clock -name MY_CLK -period ${CLK} ck

set_dont_touch_network MY_CLK

# Set constraints

# clock jitter
set_clock_uncertainty 0.07 [get_clocks MY_CLK] 


# input signal delay
set_input_delay 0.5 -max -clock MY_CLK [remove_from_collection [all_inputs] ck]


# output signal delay
set_output_delay 0.5 -max -clock MY_CLK [all_outputs]


# output load : BUF_X4 gate capacitance 
set OLOAD [load_of NangateOpenCellLibrary/BUF_X4/A]
set_load $OLOAD [all_outputs]

# Compile 

compile -gate_clock
#compile_ultra ; optimize_registers -- DC : REGISTERS NOT MOVED -- VSIM-SDF-3444 FAILURE

# Reports

report_timing > timing.rpt
report_area > area.rpt
report_power > power.rpt
report_clock > clock.rpt

# Verilog netlist

ungroup -all -flatten

# verilog rules for the names of the internal signals
change_names -hierarchy -rules verilog

# save netlist delay 
write_sdf ${DIR}/netlist/${DESIGN}.sdf

# save netlist
write -f verilog -output ${DIR}/netlist/${DESIGN}.v

# save i/o constraints
write_sdc ${DIR}/netlist/${DESIGN}.sdc

#quit
