#!/bin/bash

#SBATCH --account=ners570f20_class
#SBATCH --job-name=NERS570_Lab8
#SBATCH --partition=standard
#SBATCH --mail-user=mduschen@umich.edu
#SBATCH --mail-type=END
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=3000m 
#SBATCH	--time=01:00:00
#SBATCH	--ntasks-per-node=1
#SBATCH	--cpus-per-task=36


./run.sh

