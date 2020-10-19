#!/bin/bash
{
echo time mpiexec -n 2 ./ex15 -ksp_type gmres -n 1024 -m 1024 -pc_type none -ksp_gmres_restart 1024
time mpiexec -n 2 ./ex15 -ksp_type gmres -n 1024 -m 1024 -pc_type none -ksp_gmres_restart 1024
sleep 2 
echo

} 2>&1 | tee test.log
