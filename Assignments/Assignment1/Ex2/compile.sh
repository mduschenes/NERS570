#!/bin/bash

type=${1:-0}
N=${2:-4}
user=${3:-mduschen}



if [[ ${type} -eq 1 ]]
then
	gcc -c -o ${user}_Ex2A_main.o ${user}_Ex2A_main.c 
	gcc -c -o ${user}_Ex2A.o ${user}_Ex2A.c 
	gcc -o ${user}_Ex2A_main.out ${user}_Ex2A_main.o
	./${user}_Ex2A_main.out ${N}
elif [[ ${type} -eq 2 ]]
then
	gfortran -c -o ${user}_Ex2B.o ${user}_Ex2B.f90 
	gfortran -c -o ${user}_Ex2B_main.o ${user}_Ex2B_main.f90 
	gfortran -o ${user}_Ex2B_main.out ${user}_Ex2B.o ${user}_Ex2B_main.o
	./${user}_Ex2B_main.out ${N}
elif [[ ${type} -eq 3 ]]
then
	gcc -c ${user}_Ex3A_main.c 
	gfortran -c ${user}_Ex3A.f90
	gfortran -o ${user}_Ex3A_main.out ${user}_Ex3A.o ${user}_Ex3A_main.o
	./${user}_Ex3A_main.out ${N}
elif [[ ${type} -eq 4 ]]
then
	gcc -c -o ${user}_Ex3B.o ${user}_Ex3B.c
	gfortran -c -o ${user}_Ex3B_main.o ${user}_Ex3B_main.f90
	gfortran -o ${user}_Ex3B_main.out ${user}_Ex3B.o ${user}_Ex3B_main.o
	./${user}_Ex3B_main.out ${N}
else
	:
fi

	