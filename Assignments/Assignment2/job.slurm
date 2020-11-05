#!/bin/bash

#SBATCH --account=ners570f20_class
#SBATCH --job-name=HW2_Ex1
#SBATCH --partition=standard
#SBATCH --mail-user=mduschen@umich.edu
#SBATCH --mail-type=END
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=8000m 
#SBATCH	--time=03:00:00
#SBATCH	--ntasks-per-node=3

# Setup
module purge
module restore petsc-build

./run.sh

