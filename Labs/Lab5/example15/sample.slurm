#!/bin/bash

#SBATCH --account=ners570f20_class
#SBATCH --job-name=ex15
#SBATCH --partition=standard
#SBATCH --mail-user=mduschen@umich.edu
#SBATCH --mail-type=END
#SBATCH --nodes=1
#SBATCH	--time=01:00:00
#SBATCH	--ntasks-per-node=3

# Setup
module purge
module restore petsc-build

./sample.sh

