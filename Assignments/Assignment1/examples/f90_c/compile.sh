#!/bin/bash

file=mduschen_Ex3B


#rm ${file}*.o
#rm ${file}*.out

gcc -c ${file}.c

#gfortran -c ${file}_f90.f90

gfortran -c ${file}_main.f90

#gfortran -o ${file}_main.out ${file}.o ${file}_f90.o ${file}_main.o
gfortran -o ${file}_main.out ${file}.o ${file}_main.o
