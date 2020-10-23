#!/bin/bash

# Files
#file=${1:-"run.log"}
file=${1:-"run_condition.log"}
results=${2:-"_results.log"}
delimeter=","

# Search Options
#flag="-A6"
flag="-n"


# Search Names
declare -A flags

flags[0]="\-ksp_type "
flags[1]="\-pc_type "
flags[2]=""

types0=(cg gmres)
types1=(none jacobi sor ilu icc gamg)
types2=("max/min" "error" "iterations" "real")
types_="\-m "

labels0=(cg gmres)
labels1=(none jacobi sor ilu icc gamg)
labels2=("condition" "error" "iterations" "time")
labels_="size"



# Search Patterns
names0=()
patterns0=()

for i0 in ${!types0[@]}
do
	for i1 in ${!types1[@]}
	do
		patterns0+=("${flags[0]}${types0[$i0]}.*${types_}.*${flags[1]}${types1[$i1]}")
		names0+=("${labels0[$i0]}_${labels1[$i1]}")
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

	result_="$(grep "${pattern0}" ${file} | sed -e "s%.*${patterns_}[ ]*\([^ ]*\).*%\1%" | tr "\n" "${delimeter}"| sed -e "s/${delimeter}$/\n/")"

	for i1 in ${!patterns1[@]}
	do
		pattern1=${patterns1[$i1]}
		name1=${names1[$i1]}

				_file=$(echo ${results} | sed "s%\(.*\)\.\([^.]*$\)%_${name1}.csv%")		

				if [[ ${i0} == 0 ]]
				then
						echo "${labels_}${delimeter}${result_}" > ${_file}
				fi

		if [[ ${name1} == "condition" ]]
		then
			

			_pattern="${patterns_}"
			_patterns=($(echo "${result_}" | tr "${delimeter}" "$IFS"))

			result=()
			for k in ${!_patterns[@]}
			do
				_temp="${_pattern}${_patterns[$k]}"
				_temp="$(echo "${pattern0}" | sed "s%${_pattern}%${_temp}%")"
				echo ---temp "$_temp"
				echo ---fake "\$(sed ${flag} "/${_temp}/,/${patterns1[$i1+1]}/p" ${file})"
				# _result=$(sed ${flag} "/${_temp}/,/${patterns1[$i1+1]}/p" ${file})
				# echo ---result ${_result}
				result+=($(sed ${flag} "/${_temp}/,/${patterns1[$i1+1]}/p" ${file} | grep ${pattern1} | sed -e "s%.*${pattern1}[ ]*\([^ ]*\).*%\1%g" -e "s%[[:space:]]%%g" -e "s%\([0-9]*\)m\([0-9]*\)\.\([0-9]*\)s%\1:\2.\3%" | sort -nr | head -n1))
			done

			result="$(echo "${result[@]}" | tr "$IFS" "${delimeter}" | sed -e "s/${delimeter}$/\n/")"
			
#			key="1.000000000000e+00"
#			#result=$(echo ${result} | tr "${delimeter}" "\n" | grep -B1 "{key}" | grep -v "${key}\|--"  | tail -n +2 | tr "\n" "${delimeter}")
#			result=$(echo ${result} | tr "${delimeter}" "\n" | grep -B1 "\-\-" | tail -n +2 | tr "\n" "${delimeter}")
#			sed ${flags} "/${initial}/,/${patterns[${#patterns[@]}-1]}/p" ${file} | grep ${pattern}
		else
			result="$(sed ${flag} "/${pattern0}/,/${patterns1[${#patterns1[@]}-1]}/p" ${file} | grep ${pattern1} | sed -e "s%.*${pattern1}[ ]*\([^ ]*\).*%\1%g" -e "s%[[:space:]]%%g" -e "s%\([0-9]*\)m\([0-9]*\)\.\([0-9]*\)s%\1:\2.\3%"  | tr "\n" "${delimeter}"| sed -e "s/${delimeter}$/\n/")"
		fi
		echo "${name0}${delimeter}${result}" >> ${_file}
	done
done


# for ksp_type in ${ksp_types[@]}
# do
# 	for pc_type in ${pc_types[@]}
# 	do
# 		names0+=(${ksp_type}_${pc_type})
# 		patterns0+=("-ksp_type ${ksp_type}

# names=(cg_none cg_jacobi cg_sor cg_ilu cg_icc cg_gamg gmres_none gmres_jacobi gmres_sor gmres_ilu gmres_icc gmres_gamg) 
# indices=("\-ksp_type gmres .* \-m .* \-pc_type none") # "\-ksp_type cg .* \-m .* \-pc_type jacobi"  "\-ksp_type cg .* \-m .* \-pc_type sor" "\-ksp_type cg .* \-m .* \-pc_type ilu" "\-ksp_type cg .* \-m .* \-pc_type icc" "\-ksp_type cg .* \-m .* \-pc_type gamg" "\-ksp_type gmres .* \-m .* \-pc_type none" "\-ksp_type gmres .* \-m .* \-pc_type jacobi" "\-ksp_type gmres .* \-m .* \-pc_type sor" "\-ksp_type gmres .* \-m .* \-pc_type ilu" "\-ksp_type gmres .* \-m .* \-pc_type icc" "\-ksp_type gmres .* \-m .* \-pc_type gamg")


# patterns_header=('\-m' '\-m' '\-m' '\-m' '\-m' '\-m' '\-m' '\-m' '\-m' '\-m' '\-m' '\-m') 

# echo ${file}

# {
# for i in ${!indices[@]}
# do
# 	name="${names[$i]}"
# 	initial="${indices[$i]}"
# 	pattern_header="${patterns_header[$i]}"
# 	patterns=("max/min" "error" "iterations" "real")
# 	labels=("condition" "error" "iterations" "time")

# 	header="$(grep "${initial}" ${file} | sed -e "s%.*${pattern_header}[ ]*\([^ ]*\).*%\1%" | tr "\n" "${delimeter}"| sed -e "s/${delimeter}$/\n/")"
# 	echo header ${header}
# #	echo ${name}
# 	for j in "${!patterns[@]}"
# 	do
# 		pattern="${patterns[$j]}"
# 		label="${labels[$j]}"
# #		echo ${label}
# 		_file=$(echo ${results} | sed "s%\(.*\)\.\([^.]*$\)%_${label}.csv%")
# 		if [[ ${i} == 0 ]]
# 		then
# 			echo "label${delimeter}${header}" > ${_file}
# 		fi
# 		#result="$(grep ${flags} "${initial}" ${file} | grep ${pattern} | sed -e "s%.*${pattern}[ ]*\([^ ]*\).*%\1%g" -e "s%[[:space:]]%%g" -e "s%\([0-9]*\)m\([0-9]*\)\.\([0-9]*\)s%\1:\2.\3%"  | tr "\n" "${delimeter}"| sed -e "s/${delimeter}$/\n/")"
# 		result="$(sed ${flags} "/${initial}/,/${patterns[${#patterns[@]}-1]}/p" ${file} | grep ${pattern} | sed -e "s%.*${pattern}[ ]*\([^ ]*\).*%\1%g" -e "s%[[:space:]]%%g" -e "s%\([0-9]*\)m\([0-9]*\)\.\([0-9]*\)s%\1:\2.\3%"  | tr "\n" "${delimeter}"| sed -e "s/${delimeter}$/\n/")"
# 		if [[ ${label} == "condition" ]]
# 		then

						
# 			_patterns0=(${patterns_header[@]})
# 			_patterns1=($(echo ${header} | tr "${delimeter}" "$IFS"))
# 			result=()
# 			echo ${_patterns1[@]}
# 			for k in ${!_patterns1[@]}
# 			do
# 				_temp="${_patterns0[$k]} ${_patterns1[$k]}"
# 				_temp="$(echo "${initial}" | sed "s%${_patterns0[$k]}%${_temp}%")"
# 				echo temp "$_temp"
# 				echo "\$(sed ${flags} "/${_temp}/,/${patterns[$j+1]}/p" ${file})"
# 				result+=($(sed -n "/${_temp}/,/${patterns[$(($j+1))]}/p" ${file} | grep ${pattern} | sed -e "s%.*${pattern}[ ]*\([^ ]*\).*%\1%g" -e "s%[[:space:]]%%g" -e "s%\([0-9]*\)m\([0-9]*\)\.\([0-9]*\)s%\1:\2.\3%" | sort -nr | head -n1))
# 			done

# 			echo result="$(echo "${result[@]}" | tr " " "${delimeter}" | sed -e "s/$/\n/")"
			
# #			key="1.000000000000e+00"
# #			#result=$(echo ${result} | tr "${delimeter}" "\n" | grep -B1 "{key}" | grep -v "${key}\|--"  | tail -n +2 | tr "\n" "${delimeter}")
# #			result=$(echo ${result} | tr "${delimeter}" "\n" | grep -B1 "\-\-" | tail -n +2 | tr "\n" "${delimeter}")
# #			sed ${flags} "/${initial}/,/${patterns[${#patterns[@]}-1]}/p" ${file} | grep ${pattern}
# 		fi
# 		echo "${name}${delimeter}${result}" >> ${_file}

# 	done
# #	echo
# done
# } #2>&1 | tee ${results}
