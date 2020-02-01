#!/usr/bin/env  bash

sed -i -E "s/CLK = [0-9]/CLK = $1/g" sim/tb/test.sv 
sed -i -E "s/CLK [0-9]/CLK $1/g" sim/do/*.tcl
sed -i -E "s/CLK [0-9]/CLK $1/g" syn/scripts/*.tcl
