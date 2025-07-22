# Description

# Overview

# Options
-p PID
    * the target process

-C CPU_ID
    * tha target cpu

sleep SEC
    * how many sec to watch

# Example
$ perf list
    * show all supported metric

$ perf stat -C 1 sleep 1

$ perf record -C 10 sleep 1
$ perf report

$ perf top -C 10

$ perf annotate
    * show how many percetage of cpu-cycle is used by every instruction in a function

$ perf record -e syscalls:sys_enter_openat -g ./your_program
$ perf report
