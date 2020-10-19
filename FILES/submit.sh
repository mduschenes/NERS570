#!/bin/bash

evaluate=${1:-0}
script=${2:-"mduschen_Lab2Ex2a.sh"}
for n in {1..4}; 
do 
	N=$((10**${n}))
	cmd=("./${script}" "${N}")
	echo "${cmd[@]}"
	if [[ ${evaluate} -eq 1 ]]
	then
		eval "${cmd[@]}"
	fi
done
