set NETLIST_DIR "../netlist"
set SAIF_DIR "../saif"
set DESIGN "dp" 
set TB "test"
set DUT "dp_inst"
set CLK 4

file delete -force -- work

read_verilog -netlist ${NETLIST_DIR}/${DESIGN}.v
read_saif -input ${SAIF_DIR}/${DESIGN}.saif -instance ${TB}/${DUT} -unit ns -scale 1
create_clock -name MY_CLK -period ${CLK} ck

report_power > saif-power.rpt

quit
