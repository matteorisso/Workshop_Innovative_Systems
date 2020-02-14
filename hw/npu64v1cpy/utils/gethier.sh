#!/usr/bin/env bash

cd src

ls=$(ls *.vhd)

function gethier () {

    local list=($@)

    [[ -f gethier.tmp ]] && rm -f gethier.tmp || touch gethier.tmp
    
    for file in ${list[@]}; do
	cnt=$(grep "entity work.${file%.vhd}" ${list[*]} | wc -l)
	echo $cnt "${file}"
    done >> gethier.tmp
}

i=0
for file in $ls; do
    list[$i]=$file
    ((i=i+1))
done

# pass 1: sort by instances

gethier ${list[@]}
sort -r gethier.tmp > pass1.txt 

# pass 2: search for wrappers 

[[ -f hier.txt ]] && rm -f hier.txt || touch hier.txt

while read line; do 

    cnt=$(echo $line | cut -d " " -f1) 
    list=($(grep "$cnt " "pass1.txt" | cut -d " " -f2))

    if ((cnt!=cnt_1)); then
	cnt_1="$cnt"
	if ((${#list[@]}!=1)); then 
	    gethier ${list[@]} 
	    sort -r gethier.tmp | cut -d " " -f2 >> hier.txt     
	else
	    echo ${list[@]} >> hier.txt
	fi	
    fi
done < pass1.txt
rm gethier.tmp pass1.txt 
