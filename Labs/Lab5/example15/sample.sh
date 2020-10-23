#!/bin/bash
{
#echo time mpiexec -n 2 ./ex15 -ksp_type cg -n 32 -m 32 -pc_type icc -ksp_monitor_singular_value  -mat_type seqaij
echo time mpiexec -n 2 ./ex15 -ksp_type cg -n 32 -m 32 -pc_type none -ksp_monitor_singular_value
time mpiexec -n 2 ./ex15 -ksp_type cg -n 512 -m 512 -pc_type none -ksp_monitor_singular_value
sleep 1
echo

echo time ./ex15 -ksp_type cg -n 32 -m 32 -pc_type none -ksp_monitor_singular_value
time ./ex15 -ksp_type cg -n 512 -m 512 -pc_type none -ksp_monitor_singular_value
#time ./ex15 -ksp_type cg -n 32 -m 32 -pc_type icc -ksp_monitor_singular_value -mat_type aij
sleep 1
echo 

} 2>&1 | tee ./sample.log
