#!/bin/bash

#PBS -l select=1:ncpus=6:mem=100gb
#PBS -l walltime=150:00:00
source /home/safa.maddouri/miniconda3/bin/activate

# ----- Parameters ----- #
SCRIPT=/store/EQUIPES/SSFA/MEMBERS/safa.maddouri/kamscan/scripts/perform_stat_test_var_top_perc_or_int_2.py
INPUT=/store/EQUIPES/SSFA/MEMBERS/safa.maddouri/kamscan/1Mmono
OUT=/store/EQUIPES/SSFA/MEMBERS/safa.maddouri/kamscan/RESULTS
DESIGN=/store/EQUIPES/SSFA/MEMBERS/safa.maddouri/kamscan/3cond
DESIGN_CPM=/store/EQUIPES/SSFA/MEMBERS/safa.maddouri/kamscan/design_kmers_nb_per_patient
#NORM_FACTORS=
CHUNK=10000
TOP=100
THREADS=12
TEST=ttest
# ----- Parameters ----- #


/usr/bin/time -v python3 $SCRIPT -i $INPUT -o $OUT -d $DESIGN -t $TOP -c $CHUNK -p $THREADS -m $DESIGN_CPM --test_type $TEST 

