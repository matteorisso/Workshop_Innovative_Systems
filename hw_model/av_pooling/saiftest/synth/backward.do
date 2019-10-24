create_clock -name "clock" -period 5 {ck}

# Reads data from backward.saif file...
# THE CLOCK IN THE TESTBENCH MUST BE THE SAME AS THE CLOCK 'CK' 
# DECLARED UNDER DESIGN VISION!!
read_saif -input ../backward.saif -instance tbinccomp/DUT -unit ns -scale 1




