#!/bin/bash

prog="/proc/cpuinfo"
field="cpu MHz"
pattern="s%.*: \([^ ]*\).*$%\1%" 
trials=5000

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
avg=$(echo "scale=3 ; $avg / $N" | bc)

echo Avg\(N=${N},Trials=${trials}\)  :  ${avg}

rm ${file}
