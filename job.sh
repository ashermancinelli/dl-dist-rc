#!/bin/bash
#SBATCH -A ops
#SBATCH -p dlt
#SBATCH -t 10:00
#SBATCH --gres=gpu:4
#SBATCH -n 4
#SBATCH -N 1
#SBATCH --exclusive

module load gcc/7.3.0
module load cuda/10.2.89
module load openmpi/3.1.3
module load python/miniconda3
source source /share/apps/python/miniconda3.8/etc/profile.d/conda.sh
conda activate mlops-torch-source-mpi

mpirun -np 4 python mnist-default.py --epochs 1
