#!/bin/bash

#file=${1:-"run.log"}
file=${1:-"run_nocondition.log"}
results=${2:-"results.log"}
length=${3:-6}
flags="-A${length} -E"

# indices=(8 32 128 256 512 1024)

names=(cg bcgs gmres_0 gmres_30 gmres_200)
indices=("ksp_type cg " "ksp_type bcgs " "ksp_type gmres .* \-ksp_gmres_restart (^30|^200|8|32|128|512|1024)$" "ksp_type gmres .* \-ksp_gmres_restart 30$" "ksp_type gmres .* \-ksp_gmres_restart 200$")
patterns_header=('\-m' '\-m' '\-m' '\-m' '\-m') 

{
for i in ${!indices[@]}
do
	name="${names[$i]}"
	initial="${indices[$i]}"
	pattern_header="${patterns_header[$i]}"
	patterns=("error" "iterations" "real")
	labels=("error" "iterations" "time")

	header="$(grep "${initial}" ${file} | sed -e "s%.*${pattern_header}[ ]*\([^ ]*\).*%\1%" | tr "\n" ","| sed -e "s/,$/\n/")"

#	echo ${name}
	for j in "${!patterns[@]}"
	do
		pattern="${patterns[$j]}"
		label="${labels[$j]}"
#		echo ${label}
		_file=$(echo ${results} | sed "s%\(.*\)\.\([^.]*$\)%${label}.csv%")
		if [[ ${i} == 0 ]]
		then
			echo "label,${header}" > ${_file}
		fi
		result="$(grep ${flags} "${initial}" ${file} | grep ${pattern} | sed -e "s%.*${pattern}[ ]*\([^ ]*\).*%\1%g" -e "s%[[:space:]]%%g" -e "s%\([0-9]*\)m\([0-9]*\)\.\([0-9]*\)s%\1:\2.\3%"  | tr "\n" ","| sed -e "s/,$/\n/")"
		echo "${name},${result}" >> ${_file}

	done
#	echo
done
} #2>&1 | tee ${results}
