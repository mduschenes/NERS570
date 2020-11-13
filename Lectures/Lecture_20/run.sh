#!/bin/bash


THREAD_MAX=36
THREADS=(1 2 5 10 $THREAD_MAX)

PROG=pi_threads2

PATTERN=".*in \([^ ]*\) seconds.*"

FILE="data.dat"

make ${PROG}.c

for THREAD in ${THREADS[@]}
do
	export OMP_NUM_THREADS=$THREAD
	time=$(./${PROG}.out | awk "NF" | sed "s%${PATTERN}%\1\n%")

	echo $OMP_NUM_THREADS $time >> $FILE
done
