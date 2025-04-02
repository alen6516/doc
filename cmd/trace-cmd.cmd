# Description

# Overview

# Options

# Example
$ trace-cmd convert -i trace-7.dat -o trace-6.dat --file-version 6
    * covert trace log format to version 6

$ sudo trace-cmd record --file-version 6 -e amdgpu_sched_run_job -l amdgpu_job_submit -l <first_caller_in_stack> -p function --func-stack sleep 5
$ trace-cmd report trace.dat
