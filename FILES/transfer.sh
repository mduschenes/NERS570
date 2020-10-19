#!/bin/bash

FILEPATH="Labs/Lab2/Ex2"
ENDPOINTS=("greatlakes" "$(pwd)")
ENDPOINTS=("caen" "$(pwd)")

DELIMETERS=(":" "/")

#FILES=("${1:-Private/NERS570/${FILEPATH}/history.txt}" "${2:-${FILEPATH}/}")
FILES=("${1:-Private/NERS570/${FILEPATH}}" "${2:-${FILEPATH}}")

PATHS=()
for i in ${!FILES[@]}
do
	PATHS+=("${ENDPOINTS[${i}]}${DELIMETERS[$i]}${FILES[$i]}")
done

if [[ ${ORDER} == 1 ]]
then
	STNIOPDNE=()
	SRETEMILED=()
	SELIF=()
	SHTAP=()
	for (( i=${#FILES[@]}-1; i>=0; i-- ))
	do
		STNIOPDNE+=(${ENDPOINTS[$i]})
		SRETEMILED+=(${DELIMETERS[$i]})
		
		SHTAP+=(${PATHS[$i]})
	done
	ENDPOINTS=${STNIOPDNE[@]}
	DELIMETERS=${SRETEMILED[@]}
	FILES=${SELIF[@]}
	PATHS=${SHTAP[@]}
fi

#PROTOCOL="scp"
#OPTIONS="-r"
PROTOCOL="rsync"
OPTIONS="-a"

#function mkdir_cmd(){
#	path="${1}"
#	root=$(basename "${path}")
#	echo $path
#	if [[ -d ${root} ]]
#	then
#		mkdir -p ${path}
#	fi
#}



MKDIR_CMD="mkdir -p"

for i in ${!FILES[@]}
do
	if [[ "${DELIMETERS[$i]}" == ":" ]]
	then
		#ssh "${ENDPOINTS[$i]}" "${MKDIR_CMD} ${FILES[$i]}"
		:
	elif [[ "${DELIMETERS[$i]}" == "/" ]]
	then
		${MKDIR_CMD} ${FILES[$i]}
	fi
done

echo ${#FILES[@]}
for i in $(seq 0 2 $((${#FILES[@]}-1)))
do
	${PROTOCOL} ${OPTIONS} "${PATHS[$i]}" "${PATHS[$i+1]}"
done
