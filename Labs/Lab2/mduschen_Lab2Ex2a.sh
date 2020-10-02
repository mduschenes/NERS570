#!/bin/bash


# Arguments
cwd=$(pwd)
N=${1:-100}
src="${2:-http://www-personal.umich.edu/~bkochuna/NERS570/Lab2/thermo_water}"
param0=(${3:-400 600 800})
param1=(${4:-0 100})
props=(${5:-temperature[K] pressure[MPa] density[g/ml] viscosity[Pa\*s] enthalpy[kJ/kg]})  
output=${6:-"water_prop_%d.csv"}
scale=${7:-10}

# Executable
root="Ex2"
mkdir -p ${root}
cd ${root}

exe=$(echo ${src} | sed "s:^.*/\(.*\)$:\1:g")
rm -fr ${exe}
wget -q ${src}
chmod +x ${exe}

# Simulation
param1step=$(echo "scale=${scale};(${param1[1]}-${param1[0]})/${N}" | bc)
param1[0]="$(echo "scale=${scale};${param1[0]}+${param1step}" | bc)"
param1=($(seq ${param1[0]} ${param1step} ${param1[1]}))
for i in ${!param1[@]}
do
	param1[$i]=$(echo "scale=${scale};${param1[$i]}*1" |bc)
done


header=""
names=()
units=()
for i in "${!props[@]}"
do	
	names+=($(echo ${props[$i]} | sed "s:\(.*\)\[\(.*\)\]:\1:"))
	units+=($(echo ${props[$i]} | sed "s:\(.*\)\[\(.*\)\]:\2:"))

	if (( $i > 0 )); then header+="\"${names[$i]} [${units[$i]}]\"";fi
	if (( $i > 0 && $i < ${#props[@]}-1 ));then header+=",";fi
done


echo Params
echo ${param0[@]}
echo ${param1[@]}

for p0 in ${param0[@]}
do

	path=${p0}${units[0]}
	file=${path}/$(echo "${output}" | sed "s:%d:${N}:g")

	mkdir -p ${path}
	rm -f ${file}
	echo ${header} > ${file}	

	echo $file
	for p1 in ${param1[@]}
	do
		line="${p1}"
		for name in ${names[@]:2}
		do
			cmd=("./${exe}" "${p0}" "${p1}" "${name}")
			echo "${cmd[@]}"
			val="$(eval "${cmd[@]}")"
			line+=",${val}"
		done
		echo "${line[@]}" >> ${file}
	done
	#echo ${file} 
	#echo cat ${file}
	#echo
done



# Cleanup
cd ${cwd}
