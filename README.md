# Kamscan
# Perform parallel statistical tests:
## Description:
This script performs various statistical tests on a k-mer count matrix using parallel processing. It allows to rank the statistical results and select the top results in output files.The script supports different types of statistical tests, including t-test, pi-test, variance, Wilcoxon test and zero inflated wilcoxon test.

## Usage:
```
python3 perform_stat_test.py [options]
```
## Arguments:
- `-i, --input`  
  Input file path containing the k-mer matrix  

- `-o, --output_folder`  
  Folder path where the statistical test results will be stored. (You don't have to create the folder)  

- `-t, --top_tags`  
  The number of top elements to be selected based on the best test statistics. Default: 200,000.
  - If the value of `--top_tags` is between 0 and 1 (e.g., 0.9), it will select the corresponding percentage of the best results (e.g., 0.9 will select the top 90%).
  - If the value is greater than 1 (e.g., 100), it will select the exact number of top results (e.g., 100 will select the top 100 results).  

- `-c, --chunk_size`  
  The size of each data chunk for parallel processing. Default: 10,000.  

- `-p, --processes`  
  The number of CPUs used for parallel processing. Default: Number of available CPUs.  

- `-d, --condition_folder`  
  Folder path containing the design files that will be processed.  

- `-m, --cpm`  
  Perform Counts Per Million (CPM) normalization using a file containing the total number of k-mers for each patient.  

- `--test_type`  
  Specify the type of statistical test to be performed.  
  Choices: ttest (t-test), pitest (pi-test), wilcoxon (Wilcoxon signed-rank test), variance  
  Default: ttest.  

## Example Usage:
```
python3 perform_stat_test.py -i kmer_count_matrix -o results_folder -t 10000 -c 5000 -p 8 -d condition_folder -m normalization_file.txt --test_type ttest
```
## Note:
- Make sure to provide the correct condition folder to store the design files. The script accepts various design files as input, each containing a table with the patient_id in the first column and their corresponding condition in the second column. For example, condition can be normal or tumoral.
- The script uses parallel processing with multiple CPUs to speed up the computation of statistical tests.
- The number of top tags meeting the statistical criteria  will be selected and stored in a file in the output folder.
- If `--cpm  normalization_file.txt` is provided, the script will perform Counts Per Million (CPM) normalization using this file, otherwise, the statistical test is performed without normalization.

## Dependecies:
To run this script, you will need the following Python packages:
    
    pandas
    numpy
    scipy
    multiprocessing
    argparse
    functools
    shutil
    glob
    os
    statistics
    math
