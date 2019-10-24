create_clock -name "clk" -period 10 {clk}

# Reads data from backward.saif file...
# THE CLOCK IN THE TESTBENCH MUST BE THE SAME AS THE CLOCK 'CK' 
# DECLARED UNDER DESIGN VISION!!
read_saif -input ../backward.saif -instance tb_fc/UUT -unit ns -scale 1




