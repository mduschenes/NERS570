#!/bin/bash

# Files
#file=${1:-"run.log"}
file=${1:-"run_condition.log"}
results=${2:-"_results.log"}

# Search Options
#flags="-A6"
flag="-n"


# Search Names
declare -A flags

flags[0]="\-ksp_type "
flags[1]="\-pc_type "
flags[2]=""

types0=(cg gmres)
types1=(none jacobi sor ilu icc gamg)
types2=("max/min" "error" "iterations" "real")
types_="\-m"

labels0=(cg gmres)
labels1=(none jacobi sor ilu icc gamg)
labels2=("max/min" "error" "iterations" "time")
labels_="size"



# Search Patterns
names0=()
patterns0=()

for i0 in ${!types0[@]}
do
	for i1 in ${!types1[@]}
	do
		patterns0+=("${flags[0]}${types0[$i0]}.*${flags[1]}${types1[$i1]}")
		names0+=("${labels0[$i0]}_${labels[$i1]}")
	done
done

patterns1=(${types2[@]})
names1=(${labels2[@]})

patterns_="${types_}"
names_="${labels_}"


# Search

for i0 in ${!patterns0[@]}
do
	pattern0=${patterns0[$i0]}
	name0=${names0[$i0]}

	result_="$(grep "${pattern0}" ${file} | sed -e "s%.*${patterns_}[ ]*\([^ ]*\).*%\1%" | tr "\n" ","| sed -e "s/,$/\n/")"

	for i1 in ${!patterns1[@]}
	do
		pattern1=${patterns1[$i1]}
		name1=${names1[$i1]}

                _file=$(echo ${results} | sed "s%\(.*\)\.\([^.]*$\)%_${name1}.csv%")		

                if [[ ${i} == 0 ]]
                then
                        echo "label,${result_}" > ${_file}
                fi




for ksp_type in ${ksp_types[@]}
do
	for pc_type in ${pc_types[@]}
	do
		names0+=(${ksp_type}_${pc_type})
		patterns0+=("-ksp_type ${ksp_type}

names=(cg_none cg_jacobi cg_sor cg_ilu cg_icc cg_gamg gmres_none gmres_jacobi gmres_sor gmres_ilu gmres_icc gmres_gamg) 
indices=("\-ksp_type gmres .* \-m .* \-pc_type none") # "\-ksp_type cg .* \-m .* \-pc_type jacobi"  "\-ksp_type cg .* \-m .* \-pc_type sor" "\-ksp_type cg .* \-m .* \-pc_type ilu" "\-ksp_type cg .* \-m .* \-pc_type icc" "\-ksp_type cg .* \-m .* \-pc_type gamg" "\-ksp_type gmres .* \-m .* \-pc_type none" "\-ksp_type gmres .* \-m .* \-pc_type jacobi" "\-ksp_type gmres .* \-m .* \-pc_type sor" "\-ksp_type gmres .* \-m .* \-pc_type ilu" "\-ksp_type gmres .* \-m .* \-pc_type icc" "\-ksp_type gmres .* \-m .* \-pc_type gamg")


patterns_header=('\-m' '\-m' '\-m' '\-m' '\-m' '\-m' '\-m' '\-m' '\-m' '\-m' '\-m' '\-m') 

echo ${file}

{
for i in ${!indices[@]}
do
	name="${names[$i]}"
	initial="${indices[$i]}"
	pattern_header="${patterns_header[$i]}"
	patterns=("max/min" "error" "iterations" "real")
	labels=("condition" "error" "iterations" "time")

	header="$(grep "${initial}" ${file} | sed -e "s%.*${pattern_header}[ ]*\([^ ]*\).*%\1%" | tr "\n" ","| sed -e "s/,$/\n/")"
	echo header ${header}
#	echo ${name}
	for j in "${!patterns[@]}"
	do
		pattern="${patterns[$j]}"
		label="${labels[$j]}"
#		echo ${label}
		_file=$(echo ${results} | sed "s%\(.*\)\.\([^.]*$\)%_${label}.csv%")
		if [[ ${i} == 0 ]]
		then
			echo "label,${header}" > ${_file}
		fi
		#result="$(grep ${flags} "${initial}" ${file} | grep ${pattern} | sed -e "s%.*${pattern}[ ]*\([^ ]*\).*%\1%g" -e "s%[[:space:]]%%g" -e "s%\([0-9]*\)m\([0-9]*\)\.\([0-9]*\)s%\1:\2.\3%"  | tr "\n" ","| sed -e "s/,$/\n/")"
		result="$(sed ${flags} "/${initial}/,/${patterns[${#patterns[@]}-1]}/p" ${file} | grep ${pattern} | sed -e "s%.*${pattern}[ ]*\([^ ]*\).*%\1%g" -e "s%[[:space:]]%%g" -e "s%\([0-9]*\)m\([0-9]*\)\.\([0-9]*\)s%\1:\2.\3%"  | tr "\n" ","| sed -e "s/,$/\n/")"
		if [[ ${label} == "condition" ]]
		then

						
			_patterns0=(${patterns_header[@]})
			_patterns1=($(echo ${header} | tr "," "$IFS"))
			result=()
			echo ${_patterns1[@]}
			for k in ${!_patterns1[@]}
			do
				_temp="${_patterns0[$k]} ${_patterns1[$k]}"
				_temp="$(echo "${initial}" | sed "s%${_patterns0[$k]}%${_temp}%")"
				echo temp "$_temp"
				echo "\$(sed ${flags} "/${_temp}/,/${patterns[$j+1]}/p" ${file})"
				result+=($(sed -n "/${_temp}/,/${patterns[$(($j+1))]}/p" ${file} | grep ${pattern} | sed -e "s%.*${pattern}[ ]*\([^ ]*\).*%\1%g" -e "s%[[:space:]]%%g" -e "s%\([0-9]*\)m\([0-9]*\)\.\([0-9]*\)s%\1:\2.\3%" | sort -nr | head -n1))
			done

			echo result="$(echo "${result[@]}" | tr " " "," | sed -e "s/$/\n/")"
			
#			key="1.000000000000e+00"
#			#result=$(echo ${result} | tr "," "\n" | grep -B1 "{key}" | grep -v "${key}\|--"  | tail -n +2 | tr "\n" ",")
#			result=$(echo ${result} | tr "," "\n" | grep -B1 "\-\-" | tail -n +2 | tr "\n" ",")
#			sed ${flags} "/${initial}/,/${patterns[${#patterns[@]}-1]}/p" ${file} | grep ${pattern}
		fi
		echo "${name},${result}" >> ${_file}

	done
#	echo
done
} #2>&1 | tee ${results}
