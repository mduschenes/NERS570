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
				# echo ---temp "$_temp"
				# echo ---fake "\$(sed ${flag} "/${_temp}/,/${patterns1[$i1+1]}/p" ${file})"
				# echo "result+=($(sed ${flag} "/${_temp}/,/${patterns1[$i1+1]}/p" ${file} | grep ${pattern1} | sed -e "s%.*${pattern1}[ ]*\([^ ]*\).*%\1%g" -e "s%[[:space:]]%%g" -e "s%\([0-9]*\)m\([0-9]*\)\.\([0-9]*\)s%\1:\2.\3%" | sort -nr | head -n1))"
				result+=($(sed ${flag} "/${_temp}/,/${patterns1[$i1+1]}/p" ${file} | grep ${pattern1} | sed -e "s%.*${pattern1}[ ]*\([^ ]*\).*%\1%g" -e "s%[[:space:]]%%g" -e "s%\([0-9]*\)m\([0-9]*\)\.\([0-9]*\)s%\1:\2.\3%" | perl -e 'print sort { $a<=>$b } <>' | tail -1))
			done

			# echo "result="\$\(echo "${result[@]}" \ \| tr "$IFS" "${delimeter}" \| sed -e "s/${delimeter}$/\n/"\)""
			result="$(echo "${result[@]}" | tr "$IFS" "${delimeter}" | sed -e "s/${delimeter}$/\n/")"
			
		else
			result="$(sed ${flag} "/${pattern0}/,/${patterns1[${#patterns1[@]}-1]}/p" ${file} | grep ${pattern1} | sed -e "s%.*${pattern1}[ ]*\([^ ]*\).*%\1%g" -e "s%[[:space:]]%%g" -e "s%\([0-9]*\)m\([0-9]*\)\.\([0-9]*\)s%\1:\2.\3%"  | tr "\n" "${delimeter}"| sed -e "s/${delimeter}$/\n/")"
		fi
		echo RESULT "${name0}${delimeter}${result}"
		echo "${name0}${delimeter}${result}" >> ${_file}
	done
done

