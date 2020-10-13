# SLURMManager.jl

## Usage
### 1. make a file for sbatch list  
This is a text file that lists the paths of .sh files (sbatch files) you'd like to run.

Example `2020-10-12 sbatch manifest.txt`
```bash
/path_to_script/sbatch1.sh
/path_to_script/sbatch2.sh
/path_to_script/sbatch3.sh
/path_to_script/sbatch4.sh
```
### 2. define an sbatch script to run the manager
Example `2020-10-12 sbatch submit.sh`
```bash
#!/bin/bash
#SBATCH --job-name=yourjobname
#SBATCH --output=/path_to_your_log_dir/jobsubmit_%j.txt
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --time=03:00:00:00
#SBATCH --mem=500

julia -e "using SLURMManager; submit_scripts("path_to_your_script_list/2020-10-12 sbatch manifest.txt")
```

### 3. submit the manager sbatch script
```bash
sbatch 2020-10-12 sbatch submit.sh
```
