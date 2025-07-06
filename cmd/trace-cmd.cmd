# Description

# Overview
* also check man page of
    * trace-cmd-record

* check what events, functions are supported
    /sys/kernel/tracing/available_events
    /sys/kernel/tracing/available_filter_functions_addrs
    /sys/kernel/tracing/available_filter_functions
    /sys/kernel/tracing/available_tracers

* ref
    * https://blog.csdn.net/zmjames2000/article/details/88410484
    * https://blog.csdn.net/weixin_44410537/article/details/103587609

# Options

# Example
$ trace-cmd convert -i trace-7.dat -o trace-6.dat --file-version 6
    * covert trace log format to version 6

$ sudo trace-cmd record --file-version 6 -e amdgpu_sched_run_job -l amdgpu_job_submit -l <first_caller_in_stack> -p function --func-stack sleep 5
$ sudo trace-cmd record --file-version 6 -e amdgpu_sched_run_job -l amdgpu_job_submit -l amdgpu_vm_sdma_commit -p function --func-stack sleep 5
$ sudo trace-cmd report trace.dat

$ sudo trace-cmd record --file-version 6 \
  -e "amdgpu:amdgpu_cs_ioctl" \
  -e "amdgpu:amdgpu_sched_run_job" \
  -e "*fence:*fence_signaled" \
  -e "drm:drm_vblank_event"

$ sudo trace-cmd stream -p function -l amdgpu_dm_atomic_check --func-stack sleep 2
    * steam means directly output to stdout
    * -p function means trace function
    * -l specifies the function
    * --func-stack prints the callstack

$ sudo trace-cmd stream -e amdgpu_dm:adgpu_dm_atomic_commit_tail_begin -l amdgpu_dm_atomic_commit_tail

$ sudo trace-cmd stream -e amdgpu:amdgpu_sched_run_job sleep 2

$ trace-cmd record -p function_graph -g 'amdgpu_dm_atomic_commit_tail' -g 'dm_hw_init' --module 'amdgpu'
$ trace-cmd report trace.dat
$ trace-cmd report --profile trace.dat
    * -p function_graph can check time spent in a function
