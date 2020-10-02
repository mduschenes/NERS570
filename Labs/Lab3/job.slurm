#!/bin/bash

#SBATCH --account=ners570f20_class
#SBATCH --job-name=ex1
#SBATCH --partition=standard
#SBATCH --mail-user=mduschen@umich.edu
#SBATCH --mail-type=END
#SBATCH --nodes=1
#SBATCH	--time=00:05:00
#SBATCH	--ntasks-per-node=36


for i in {1..5}
do
	echo "Hello World! ${i}" >> job.stdout
	echo "SLURM_NNODES=${SLURM_NNODES}"
	sleep 5
done
