#!/bin/bash --login
#PBS -l walltime=00:10:00
#PBS -l select=1:ncpus=2
#PBS -N gg_denovo_cda
#PBS -A d411-training

cd $PBS_O_WORKDIR

# Load modules and qiime
module load miniconda/python2

# Setting temporary directory
mkdir -p ~/qiime_tmp
export TMPDIR=~/qiime_tmp

# Loading virtualenv
echo "loading virtualenv"
# NB qiime1 and not qiimel (number one not letter l)
source activate qiime1

# Procrustes analysis on weighted and unweighted UniFrac PCoA matrices
time transform_coordinate_matrices.py \
-i unweighted_unifrac_dm.txt,weighted_unifrac_dm.txt \
-r 999 \
-o /lustre/home/d411/alorax1/data/2018/procrustes_output

# Generating a Procrustes plot
time make_emperor.py \
-c \
-i /lustre/home/d411/alorax1/data/2018/procrustes_output/ \
-o /lustre/home/d411/alorax1/data/2018/procrustes_output/plots \
-m /lustre/home/d411/alorax1/test/all/allyears_map.txt

source deactivate
