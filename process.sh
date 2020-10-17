#!/bin/bash

file=${1:-"run.log"}
length=${2:-6}

# indices=(8 32 128 256 512 1024)
indices=(cg bcgs gmres)

for i in ${indices[@]}
do
	pattern0="-ksp_type ${i}"
	patterns=("error " "iterations " "real")
	echo ${i}
	for pattern in "${patterns[@]}"
	do
		echo ${pattern}
		grep "${pattern0}" ${file} | grep "${pattern}"

	echo

