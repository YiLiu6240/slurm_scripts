#!/bin/bash
#SBATCH --get-user-env
#SBATCH --ntasks 2 --time 0:0:40
#SBATCH --qos bbshort
#SBATCH --mail-type "END"
#SBATCH --mail-type "FAIL"
#SBATCH --export NONE
#SBATCH --output "mp-2-%j.out"

unset SLURM_EXPORT_ENV
set -e
module purge
module load bluebear

module load apps/R/v3.4.0
Rscript mp.R --n_cores 2
