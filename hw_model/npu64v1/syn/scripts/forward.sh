#!/usr/bin/env bash

if (($#!=2)); then
    echo "$0 usage : [syn|pnr] [netlist|innovus]"
    exit 1
fi

dir="set dir2 \"${2}\""
step="set step \"${1}\""
sed -i -E "/set\s+dir2\s+/c\\${dir}" forward.do
sed -i -E "/set\s+step\s+/c\\${step}" forward.do

rm -dr work
vsim -c -do forward.do > forward-transcript_${1}

if (($?!=0)); then 
    echo " ERROR : simulation was not succesful."
    exit 1
else
    echo; echo "VCD saved. ";echo;
fi

diff -q results.txt ../../../../fixpt/results.txt 
[[ $? -eq "0" ]] && echo "KUDOS, C-model and HDL model results are equal.";echo 

exit 0
