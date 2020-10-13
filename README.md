# SLURMManager.jl
If you have not installed Julia on OpenMind, please check [OpenMind Julia](https://github.com/flavell-lab/FlavellLabWiki/wiki/OpenMind-Julia#installing-julia-on-openmind)

## Usage
### 1. Make a file for sbatch list  
This is a text file that lists the paths of .sh files (sbatch files) you'd like to run.

Example `2020-10-12 sbatch manifest.txt`
```bash
/path_to_script/sbatch1.sh
/path_to_script/sbatch2.sh
/path_to_script/sbatch3.sh
/path_to_script/sbatch4.sh
```
### 2. Define an sbatch script to run the manager
Example `2020-10-12 sbatch submit.sh` (make sure to change `--job-name`, `--output` and the path to your script list file)  
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

### 3. Submit the manager sbatch script
```bash
sbatch 2020-10-12 sbatch submit.sh
```
## Notification feature
Doc TBD
