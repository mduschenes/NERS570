#!/bin/bash


# Cache Sizes

CACHE_NUM=4

UNITS="kB"
FACTOR=$((1024))

CACHE_SIZE=()
CACHE_LINESIZE=()



echo Cache Info

for N in $(seq 1 $CACHE_NUM)
do
	if  [[ $N -le 1 ]]
	then
		CMD_SIZE=LEVEL${N}_DCACHE_SIZE
		CMD_LINESIZE=LEVEL${N}_DCACHE_LINESIZE
	else
		CMD_SIZE=LEVEL${N}_CACHE_SIZE
		CMD_LINESIZE=LEVEL${N}_CACHE_LINESIZE
	fi
	CACHE_SIZE+=($(($(getconf $CMD_SIZE)/${FACTOR})))
	CACHE_LINESIZE+=($(getconf $CMD_LINESIZE))
	
	echo Cache L${N} Size: ${CACHE_SIZE[$N-1]} $UNITS
	echo Cache L${N} Line Size: ${CACHE_LINESIZE[$N-1]} B
	echo
done






echo
echo
echo


# CPU Speed

UNITS="MHz"
FACTOR=1

prog="/proc/cpuinfo"
field="cpu MHz"
pattern="s%.*: \([^ ]*\).*$%\1%" 
trials=100

file=tmp1234.tmp
rm -f ${file}


for i in $(seq 1 ${trials})
do
	#echo Trial: $i
	grep "${field}" ${prog} | sed "${pattern}" >> ${file}
	sleep 0.00000001
done

N=$(wc -l ${file} | sed "s:\([^ ]*\).*:\1:")
avg=$(paste -sd+ ${file} | bc)
avg=$(echo "scale=3 ; ${avg} / (${N}*${FACTOR})" | bc)

Nproc=$((${N}/${trials}))

echo CPU Info

echo CPU Cores: ${Nproc}

echo CPU Speed:  ${avg} ${UNITS}

rm ${file}
