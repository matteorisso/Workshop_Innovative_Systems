#!/usr/bin/env bash

cd src

ls=$(ls *.vhd)
declare -a list

i=0
for file in $ls; do
    list[$i]=$file
    ((i=i+1))
done

echo ${list[*]}
[[ -f hier.txt ]] && rm -f hier.txt || touch hier.txt
for file in ${list[@]}; do
    wc=$(grep "entity work.${file%.vhd}" ${list[*]}|wc -l)
    echo $wc "${file}"
done >> hier.txt

sort -r hier.txt | cut -d " " -f 2 > tmp.txt
mv tmp.txt hier.txt
