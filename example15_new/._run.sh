#!/bin/bash

function strlen(){
	a="$1"
	a=(${a[@]})
	echo ${#a[@]}
}

# Parameter Sweep


# Set Files
exe=ex15
declare -A files
files["log"]=${exe}.log
files["output"]=${exe}.csv
files["tmp"]=${exe}.tmp

# Set delimeters
declare -A delimeters
delimeters["flag"]="-"
delimeters["set"]=" "
delimeters["file"]=","

# Set parameters
declare -A flags
declare -A parameters
declare -A sizes
keys=(0 1)

key=0
flags[${key}]="ksp_type"
flags[${key},"gmres"]="ksp_gmres_restart"
parameters[${key}]="cg bcgs gmres"
parameters[${key},"gmres"]="'' 30 200"
sizes[${key}]=$(strlen "${parameters[${key}][@]}")
for param in ${parameters[${key}][@]}
do
	if [[ ! -z ${parameters[${key},${param}]} ]]
	then
		sizes[${key}]=$((${sizes[${key}]} - 1 + $(strlen "${parameters[${key},${param}][@]}")))
	fi
done


key=1
flags[${key}]="n m"
parameters[${key}]="8 32 128 256 512 1024"
sizes[${key}]=$(strlen "${parameters[${key}][@]}")
for param in ${parameters[${key}][@]}
do
	if [[ ! -z ${parameters[${key},${param}]} ]]
	then
		sizes[${key}]=$((${sizes[${key}]} - 1 + $(strlen "${parameters[${key},${param}][@]}")))
	fi
done

#key=0
#flags[${key}]="ksp_type"
#flags[${key},"gmres"]="ksp_gmres_restart"
#parameters[${key}]="cg bcgs gmres"
#parameters[${key},"gmres"]="'' 30 200"
#sizes[${key}]=$(strlen ${parameters[${key}]})
#for param in ${parameters[${key}][@]}
#do
#	if [[ -z ${parameters[${key},${param}]} ]]
#	then
#		sizes[${key}]=$((${sizes[${key}]} - 1 + $(strlen ${parameters[${key}[@]})))
#	fi
#done


# Set output files
patterns=(error iterations)
headers=()
values=()
outputs=()

for pattern in ${patterns[@]}
do
	outputs+=($(echo ${files["output"]} | sed "s%\.\([^.]*$\)%_${pattern}.\1%"))
done




header=${flags[${keys[1]}]}
header=(${header[@]})
header=${header[0]}

OLDIFS="${IFS}"	
export IFS=","
headers+=(${header})
export IFS="${OLDIFS}"

for key in "${keys[@]::1}"
do
	header=()
	for flag in ${flags[${key}][@]}
	do
		header=()
	#	OLDIFS="${IFS}"	
	#	export IFS=","
	#	header+=(${flag})
	#	export IFS="${OLDIFS}"

		for param in ${parameters[${key}][@]}
		do
	        	if [[ ! -z ${parameters[${key},${param}]} ]]
			then
				for subparam in ${parameters[${key},${param}][@]}
				do
					header+=("${param}_${flags[${key},${param}]}")
				done
			else
				header+=(${param})
			fi
		done
		OLDIFS="${IFS}"	
		export IFS=","
		headers+=("${header[*]}")
		export IFS="${OLDIFS}"
	done
done




echo ${#headers[@]}


## Set Parameters
#i=0
#_params0=(${params0[@]})
#params0=()
#for j in ${#_params0[@]}
#do
#	p=()
#	p+=("${delimeter_flag}${parameters[${key}]}${delimeter_set}${_params0[@]}")
#	if [[ ${#subparameters0[@]} == 3 ]]
#	then
#
#		for k in $(seq 0 3 ${#subparameters0[@]})
#		do
#			if [[ ${params0[$j]} == ${subparameters0[$k]} ]]
#			then
#				for l in $(seq $k 1 $(($k+${subparameters0[$1]})))
#				do
#					params		
#					params0+=("${p[*]} ${delimeter_flag}${subparameters0[${key}]}${delimeter_set}${_params0[)
#				
#
#	${params0[$j]} = "
#	else
#		
#	params0+=(${p[@]})
#	params0+=(${p[@]})
#
#
#header+=(size)
#for ksp_type in ${ksp_types[@]}
#do
#	for restart in ${restarts[@]}
#	do	
#		if [[ "${ksp_type}" == "gmres" ]] ||  [[ "${restart}" == 0 ]]
#		then
#			header+=("${ksp_type}_${restart}")
#		fi
#	done
#done
#
#for pattern in ${patterns[@]}
#do
#	_output=$(echo ${output} | sed "s%\.%_${pattern}\.%")
#	echo ${header} > ${_output}
#	outputs+=(${_output})
#
#done
#
#echo ${outputs[@]}
#
#cmd=()
#for ksp_type in ${ksp_types[@]}
#do
#	for size in ${sizes[@]}
#	do
#		OLDIFS="${IFS}"
#		export IFS="${delimeter}"
#		echo "${header[*]}" >> ${output}
#		export IFS="${OLDIFS}"
#		echo "${values[*]}" >> ${output}
#echo $	
#		for restart in ${restarts[@]}
#		do
#			cmd=()
#			cmd+=("./${exe}")
#		
#			cmd+=("-ksp_type ${ksp_type}")
#		
#			if [[ "${ksp_type}" == "gmres" ]] && [[ "${restart}" != 0 ]]
#			then
#				cmd+=("-ksp_gmres_restart ${restart}")
#			elif [[ "${restart}" != 0 ]]
#			then
#				continue	
#			fi
#		
#			cmd+=("-m ${size} -n ${size}")
#			
#			echo ${cmd[@]}
#		done
#	done		
#done	
#



# Cleanup
#rm ${tmp}	
