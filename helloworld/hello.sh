#!/bin/bash
#SBATCH --get-user-env
#SBATCH --ntasks 1 --time 0:0:10
#SBATCH --qos bbshort
#SBATCH --mail-type "END"
#SBATCH --mail-type "FAIL"
#SBATCH --export NONE
#SBATCH --output "logs/hello-%j.out"

# output format
# normal job: --output "hello-%j.out"  # %j: job ID
# array job: --output "hello-%A_%a.out"  # %A: job ID; %a: array index

unset SLURM_EXPORT_ENV
set -e
module purge
module load bluebear

mkdir -p logs

module load apps/python3/v3.3.0
python3 helloworld.py
