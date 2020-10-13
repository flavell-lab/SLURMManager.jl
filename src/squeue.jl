"""
    run_parse_int(pipe)

Parse str result from pipeline to Int
"""
function run_parse_int(pipe)
    str_ = readchomp(pipe, String)
    parse(Int, str_)
end

"""
    squeue_n_pending(user)

Get num of pending jobs
"""
function squeue_n_pending(user)
    run_parse_int(pipeline(`squeue -u $user -h -r --start`, `wc -l`))
end

"""
    squeue_n_running(user)

Get num of running jobs
"""
function squeue_n_running(user)
    run_parse_int(pipeline(`squeue -u $user --states RUNNING -h -r`, `wc -l`))
end

"""
    squeue_submit_sbatch(path_sh)

Submits `path_sh` to the queue and returns the jobid
"""
function squeue_submit_sbatch(path_sh)
    jobid = run_parse_int(pipeline(`sbatch $path_sh`, `awk '{ print $4 }'`))
    return jobid
end