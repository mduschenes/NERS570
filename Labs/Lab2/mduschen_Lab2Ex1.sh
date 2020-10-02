#!/bin/bash


# Arguments
cwd=$(pwd)
src=${1:-http://www-personal.umich.edu/~bkochuna/NERS590/Lab2/Ex1.tar.gz}
inputs=(${2:-"nuclear_secrets(1|2).txt"})
outputs=(${3:-launch_code.txt jackpot_locations.txt})
extensions=(${4:-" " "* doc,xml txt"})
arguments=(${5:-" " "Jack[\ ]*pot"})
i=-1


# Data
zipped="$(echo ${src} | sed "s:.*/\([^/]*\)$:\1:")"
unzipped="$(echo "${zipped}" | sed "s:^\([^.]*\)\..*$:\1:")"
root=${unzipped}
#echo ${src} ${unzipped}
rm -rf ${zipped} ${unzipped}
wget -q ${src}
tar -xzf ${zipped}
cd ${root}


# Find
i=$(($i+1))
rm -fr ${outputs[$i]}
results=$(find . -maxdepth 2 -regextype posix-extended -regex "./.*${inputs[$i]}")
diff ${results[@]} > ${outputs[$i]}
#cat ${outputs[$i]}


# Search
i=$(($i+1))
rm -fr ${outputs[$i]}
read -a exts <<< ${extensions[$i]}

for j in ${!exts[@]}
do
	#echo START $j
	ext=${exts[$j]}
	if [[ $j != 2 ]]
	then
		args=$(echo "${arguments[$i]}" | sed "s:\[.*\]\*::g")
		opts="-r"
	else
		args="${arguments[$i]}" 
		opts="-ri"
	fi	
	cmd=( "grep" "--include=\*.{${exts[$j]},}" "--exclude=${outputs[$i]}" "${opts}" "${args}" "." ">>" "${outputs[$i]}" )
	#echo "${cmd[@]}"
	eval "${cmd[@]}"
	#echo DONE $(eval "${cmd[@]::${#cmd[@]}-2}" | wc -l)
	#echo >> ${outputs[$i]}
done
#cat ${outputs[$i]}


# Cleanup
cd ${cwd}
rm -r ${zipped}
