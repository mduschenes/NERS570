#!/bin/bash
{
echo time mpiexec -n 2 ./ex15 -ksp_type cg -n 8 -m 8 -pc_type none -ksp_monitor_singular_value 
time mpiexec -n 2 ./ex15 -ksp_type cg -n 8 -m 8 -pc_type none -ksp_monitor_singular_value 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type cg -n 8 -m 8 -pc_type jacobi -ksp_monitor_singular_value 
time mpiexec -n 2 ./ex15 -ksp_type cg -n 8 -m 8 -pc_type jacobi -ksp_monitor_singular_value 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type cg -n 8 -m 8 -pc_type sor -ksp_monitor_singular_value 
time mpiexec -n 2 ./ex15 -ksp_type cg -n 8 -m 8 -pc_type sor -ksp_monitor_singular_value 
sleep 1
echo 

echo time ./ex15 -ksp_type cg -n 8 -m 8 -pc_type ilu -ksp_monitor_singular_value 
time ./ex15 -ksp_type cg -n 8 -m 8 -pc_type ilu -ksp_monitor_singular_value 
sleep 1
echo 

echo time ./ex15 -ksp_type cg -n 8 -m 8 -pc_type icc -ksp_monitor_singular_value 
time ./ex15 -ksp_type cg -n 8 -m 8 -pc_type icc -ksp_monitor_singular_value 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type cg -n 8 -m 8 -pc_type gamg -ksp_monitor_singular_value 
time mpiexec -n 2 ./ex15 -ksp_type cg -n 8 -m 8 -pc_type gamg -ksp_monitor_singular_value 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type cg -n 32 -m 32 -pc_type none -ksp_monitor_singular_value 
time mpiexec -n 2 ./ex15 -ksp_type cg -n 32 -m 32 -pc_type none -ksp_monitor_singular_value 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type cg -n 32 -m 32 -pc_type jacobi -ksp_monitor_singular_value 
time mpiexec -n 2 ./ex15 -ksp_type cg -n 32 -m 32 -pc_type jacobi -ksp_monitor_singular_value 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type cg -n 32 -m 32 -pc_type sor -ksp_monitor_singular_value 
time mpiexec -n 2 ./ex15 -ksp_type cg -n 32 -m 32 -pc_type sor -ksp_monitor_singular_value 
sleep 1
echo 

echo time ./ex15 -ksp_type cg -n 32 -m 32 -pc_type ilu -ksp_monitor_singular_value 
time ./ex15 -ksp_type cg -n 32 -m 32 -pc_type ilu -ksp_monitor_singular_value 
sleep 1
echo 

echo time ./ex15 -ksp_type cg -n 32 -m 32 -pc_type icc -ksp_monitor_singular_value 
time ./ex15 -ksp_type cg -n 32 -m 32 -pc_type icc -ksp_monitor_singular_value 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type cg -n 32 -m 32 -pc_type gamg -ksp_monitor_singular_value 
time mpiexec -n 2 ./ex15 -ksp_type cg -n 32 -m 32 -pc_type gamg -ksp_monitor_singular_value 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type cg -n 128 -m 128 -pc_type none -ksp_monitor_singular_value 
time mpiexec -n 2 ./ex15 -ksp_type cg -n 128 -m 128 -pc_type none -ksp_monitor_singular_value 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type cg -n 128 -m 128 -pc_type jacobi -ksp_monitor_singular_value 
time mpiexec -n 2 ./ex15 -ksp_type cg -n 128 -m 128 -pc_type jacobi -ksp_monitor_singular_value 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type cg -n 128 -m 128 -pc_type sor -ksp_monitor_singular_value 
time mpiexec -n 2 ./ex15 -ksp_type cg -n 128 -m 128 -pc_type sor -ksp_monitor_singular_value 
sleep 1
echo 

echo time ./ex15 -ksp_type cg -n 128 -m 128 -pc_type ilu -ksp_monitor_singular_value 
time ./ex15 -ksp_type cg -n 128 -m 128 -pc_type ilu -ksp_monitor_singular_value 
sleep 1
echo 

echo time ./ex15 -ksp_type cg -n 128 -m 128 -pc_type icc -ksp_monitor_singular_value 
time ./ex15 -ksp_type cg -n 128 -m 128 -pc_type icc -ksp_monitor_singular_value 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type cg -n 128 -m 128 -pc_type gamg -ksp_monitor_singular_value 
time mpiexec -n 2 ./ex15 -ksp_type cg -n 128 -m 128 -pc_type gamg -ksp_monitor_singular_value 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type cg -n 256 -m 256 -pc_type none -ksp_monitor_singular_value 
time mpiexec -n 2 ./ex15 -ksp_type cg -n 256 -m 256 -pc_type none -ksp_monitor_singular_value 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type cg -n 256 -m 256 -pc_type jacobi -ksp_monitor_singular_value 
time mpiexec -n 2 ./ex15 -ksp_type cg -n 256 -m 256 -pc_type jacobi -ksp_monitor_singular_value 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type cg -n 256 -m 256 -pc_type sor -ksp_monitor_singular_value 
time mpiexec -n 2 ./ex15 -ksp_type cg -n 256 -m 256 -pc_type sor -ksp_monitor_singular_value 
sleep 1
echo 

echo time ./ex15 -ksp_type cg -n 256 -m 256 -pc_type ilu -ksp_monitor_singular_value 
time ./ex15 -ksp_type cg -n 256 -m 256 -pc_type ilu -ksp_monitor_singular_value 
sleep 1
echo 

echo time ./ex15 -ksp_type cg -n 256 -m 256 -pc_type icc -ksp_monitor_singular_value 
time ./ex15 -ksp_type cg -n 256 -m 256 -pc_type icc -ksp_monitor_singular_value 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type cg -n 256 -m 256 -pc_type gamg -ksp_monitor_singular_value 
time mpiexec -n 2 ./ex15 -ksp_type cg -n 256 -m 256 -pc_type gamg -ksp_monitor_singular_value 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type cg -n 512 -m 512 -pc_type none -ksp_monitor_singular_value 
time mpiexec -n 2 ./ex15 -ksp_type cg -n 512 -m 512 -pc_type none -ksp_monitor_singular_value 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type cg -n 512 -m 512 -pc_type jacobi -ksp_monitor_singular_value 
time mpiexec -n 2 ./ex15 -ksp_type cg -n 512 -m 512 -pc_type jacobi -ksp_monitor_singular_value 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type cg -n 512 -m 512 -pc_type sor -ksp_monitor_singular_value 
time mpiexec -n 2 ./ex15 -ksp_type cg -n 512 -m 512 -pc_type sor -ksp_monitor_singular_value 
sleep 1
echo 

echo time ./ex15 -ksp_type cg -n 512 -m 512 -pc_type ilu -ksp_monitor_singular_value 
time ./ex15 -ksp_type cg -n 512 -m 512 -pc_type ilu -ksp_monitor_singular_value 
sleep 1
echo 

echo time ./ex15 -ksp_type cg -n 512 -m 512 -pc_type icc -ksp_monitor_singular_value 
time ./ex15 -ksp_type cg -n 512 -m 512 -pc_type icc -ksp_monitor_singular_value 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type cg -n 512 -m 512 -pc_type gamg -ksp_monitor_singular_value 
time mpiexec -n 2 ./ex15 -ksp_type cg -n 512 -m 512 -pc_type gamg -ksp_monitor_singular_value 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type cg -n 1024 -m 1024 -pc_type none -ksp_monitor_singular_value 
time mpiexec -n 2 ./ex15 -ksp_type cg -n 1024 -m 1024 -pc_type none -ksp_monitor_singular_value 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type cg -n 1024 -m 1024 -pc_type jacobi -ksp_monitor_singular_value 
time mpiexec -n 2 ./ex15 -ksp_type cg -n 1024 -m 1024 -pc_type jacobi -ksp_monitor_singular_value 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type cg -n 1024 -m 1024 -pc_type sor -ksp_monitor_singular_value 
time mpiexec -n 2 ./ex15 -ksp_type cg -n 1024 -m 1024 -pc_type sor -ksp_monitor_singular_value 
sleep 1
echo 

echo time ./ex15 -ksp_type cg -n 1024 -m 1024 -pc_type ilu -ksp_monitor_singular_value 
time ./ex15 -ksp_type cg -n 1024 -m 1024 -pc_type ilu -ksp_monitor_singular_value 
sleep 1
echo 

echo time ./ex15 -ksp_type cg -n 1024 -m 1024 -pc_type icc -ksp_monitor_singular_value 
time ./ex15 -ksp_type cg -n 1024 -m 1024 -pc_type icc -ksp_monitor_singular_value 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type cg -n 1024 -m 1024 -pc_type gamg -ksp_monitor_singular_value 
time mpiexec -n 2 ./ex15 -ksp_type cg -n 1024 -m 1024 -pc_type gamg -ksp_monitor_singular_value 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type gmres -n 8 -m 8 -pc_type none -ksp_monitor_singular_value  -ksp_gmres_restart 
time mpiexec -n 2 ./ex15 -ksp_type gmres -n 8 -m 8 -pc_type none -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type gmres -n 8 -m 8 -pc_type jacobi -ksp_monitor_singular_value  -ksp_gmres_restart 
time mpiexec -n 2 ./ex15 -ksp_type gmres -n 8 -m 8 -pc_type jacobi -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type gmres -n 8 -m 8 -pc_type sor -ksp_monitor_singular_value  -ksp_gmres_restart 
time mpiexec -n 2 ./ex15 -ksp_type gmres -n 8 -m 8 -pc_type sor -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time ./ex15 -ksp_type gmres -n 8 -m 8 -pc_type ilu -ksp_monitor_singular_value  -ksp_gmres_restart 
time ./ex15 -ksp_type gmres -n 8 -m 8 -pc_type ilu -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time ./ex15 -ksp_type gmres -n 8 -m 8 -pc_type icc -ksp_monitor_singular_value  -ksp_gmres_restart 
time ./ex15 -ksp_type gmres -n 8 -m 8 -pc_type icc -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type gmres -n 8 -m 8 -pc_type gamg -ksp_monitor_singular_value  -ksp_gmres_restart 
time mpiexec -n 2 ./ex15 -ksp_type gmres -n 8 -m 8 -pc_type gamg -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type gmres -n 32 -m 32 -pc_type none -ksp_monitor_singular_value  -ksp_gmres_restart 
time mpiexec -n 2 ./ex15 -ksp_type gmres -n 32 -m 32 -pc_type none -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type gmres -n 32 -m 32 -pc_type jacobi -ksp_monitor_singular_value  -ksp_gmres_restart 
time mpiexec -n 2 ./ex15 -ksp_type gmres -n 32 -m 32 -pc_type jacobi -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type gmres -n 32 -m 32 -pc_type sor -ksp_monitor_singular_value  -ksp_gmres_restart 
time mpiexec -n 2 ./ex15 -ksp_type gmres -n 32 -m 32 -pc_type sor -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time ./ex15 -ksp_type gmres -n 32 -m 32 -pc_type ilu -ksp_monitor_singular_value  -ksp_gmres_restart 
time ./ex15 -ksp_type gmres -n 32 -m 32 -pc_type ilu -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time ./ex15 -ksp_type gmres -n 32 -m 32 -pc_type icc -ksp_monitor_singular_value  -ksp_gmres_restart 
time ./ex15 -ksp_type gmres -n 32 -m 32 -pc_type icc -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type gmres -n 32 -m 32 -pc_type gamg -ksp_monitor_singular_value  -ksp_gmres_restart 
time mpiexec -n 2 ./ex15 -ksp_type gmres -n 32 -m 32 -pc_type gamg -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type gmres -n 128 -m 128 -pc_type none -ksp_monitor_singular_value  -ksp_gmres_restart 
time mpiexec -n 2 ./ex15 -ksp_type gmres -n 128 -m 128 -pc_type none -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type gmres -n 128 -m 128 -pc_type jacobi -ksp_monitor_singular_value  -ksp_gmres_restart 
time mpiexec -n 2 ./ex15 -ksp_type gmres -n 128 -m 128 -pc_type jacobi -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type gmres -n 128 -m 128 -pc_type sor -ksp_monitor_singular_value  -ksp_gmres_restart 
time mpiexec -n 2 ./ex15 -ksp_type gmres -n 128 -m 128 -pc_type sor -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time ./ex15 -ksp_type gmres -n 128 -m 128 -pc_type ilu -ksp_monitor_singular_value  -ksp_gmres_restart 
time ./ex15 -ksp_type gmres -n 128 -m 128 -pc_type ilu -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time ./ex15 -ksp_type gmres -n 128 -m 128 -pc_type icc -ksp_monitor_singular_value  -ksp_gmres_restart 
time ./ex15 -ksp_type gmres -n 128 -m 128 -pc_type icc -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type gmres -n 128 -m 128 -pc_type gamg -ksp_monitor_singular_value  -ksp_gmres_restart 
time mpiexec -n 2 ./ex15 -ksp_type gmres -n 128 -m 128 -pc_type gamg -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type gmres -n 256 -m 256 -pc_type none -ksp_monitor_singular_value  -ksp_gmres_restart 
time mpiexec -n 2 ./ex15 -ksp_type gmres -n 256 -m 256 -pc_type none -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type gmres -n 256 -m 256 -pc_type jacobi -ksp_monitor_singular_value  -ksp_gmres_restart 
time mpiexec -n 2 ./ex15 -ksp_type gmres -n 256 -m 256 -pc_type jacobi -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type gmres -n 256 -m 256 -pc_type sor -ksp_monitor_singular_value  -ksp_gmres_restart 
time mpiexec -n 2 ./ex15 -ksp_type gmres -n 256 -m 256 -pc_type sor -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time ./ex15 -ksp_type gmres -n 256 -m 256 -pc_type ilu -ksp_monitor_singular_value  -ksp_gmres_restart 
time ./ex15 -ksp_type gmres -n 256 -m 256 -pc_type ilu -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time ./ex15 -ksp_type gmres -n 256 -m 256 -pc_type icc -ksp_monitor_singular_value  -ksp_gmres_restart 
time ./ex15 -ksp_type gmres -n 256 -m 256 -pc_type icc -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type gmres -n 256 -m 256 -pc_type gamg -ksp_monitor_singular_value  -ksp_gmres_restart 
time mpiexec -n 2 ./ex15 -ksp_type gmres -n 256 -m 256 -pc_type gamg -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type gmres -n 512 -m 512 -pc_type none -ksp_monitor_singular_value  -ksp_gmres_restart 
time mpiexec -n 2 ./ex15 -ksp_type gmres -n 512 -m 512 -pc_type none -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type gmres -n 512 -m 512 -pc_type jacobi -ksp_monitor_singular_value  -ksp_gmres_restart 
time mpiexec -n 2 ./ex15 -ksp_type gmres -n 512 -m 512 -pc_type jacobi -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type gmres -n 512 -m 512 -pc_type sor -ksp_monitor_singular_value  -ksp_gmres_restart 
time mpiexec -n 2 ./ex15 -ksp_type gmres -n 512 -m 512 -pc_type sor -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time ./ex15 -ksp_type gmres -n 512 -m 512 -pc_type ilu -ksp_monitor_singular_value  -ksp_gmres_restart 
time ./ex15 -ksp_type gmres -n 512 -m 512 -pc_type ilu -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time ./ex15 -ksp_type gmres -n 512 -m 512 -pc_type icc -ksp_monitor_singular_value  -ksp_gmres_restart 
time ./ex15 -ksp_type gmres -n 512 -m 512 -pc_type icc -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type gmres -n 512 -m 512 -pc_type gamg -ksp_monitor_singular_value  -ksp_gmres_restart 
time mpiexec -n 2 ./ex15 -ksp_type gmres -n 512 -m 512 -pc_type gamg -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type gmres -n 1024 -m 1024 -pc_type none -ksp_monitor_singular_value  -ksp_gmres_restart 
time mpiexec -n 2 ./ex15 -ksp_type gmres -n 1024 -m 1024 -pc_type none -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type gmres -n 1024 -m 1024 -pc_type jacobi -ksp_monitor_singular_value  -ksp_gmres_restart 
time mpiexec -n 2 ./ex15 -ksp_type gmres -n 1024 -m 1024 -pc_type jacobi -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type gmres -n 1024 -m 1024 -pc_type sor -ksp_monitor_singular_value  -ksp_gmres_restart 
time mpiexec -n 2 ./ex15 -ksp_type gmres -n 1024 -m 1024 -pc_type sor -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time ./ex15 -ksp_type gmres -n 1024 -m 1024 -pc_type ilu -ksp_monitor_singular_value  -ksp_gmres_restart 
time ./ex15 -ksp_type gmres -n 1024 -m 1024 -pc_type ilu -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time ./ex15 -ksp_type gmres -n 1024 -m 1024 -pc_type icc -ksp_monitor_singular_value  -ksp_gmres_restart 
time ./ex15 -ksp_type gmres -n 1024 -m 1024 -pc_type icc -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

echo time mpiexec -n 2 ./ex15 -ksp_type gmres -n 1024 -m 1024 -pc_type gamg -ksp_monitor_singular_value  -ksp_gmres_restart 
time mpiexec -n 2 ./ex15 -ksp_type gmres -n 1024 -m 1024 -pc_type gamg -ksp_monitor_singular_value  -ksp_gmres_restart 
sleep 1
echo 

} 2>&1 | tee ./run.log
