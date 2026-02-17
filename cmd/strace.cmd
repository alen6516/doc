# Description
trace system calls and signals

# Overview

# Options
-f
    also list the system calls executed by the child process

-e SYSCALL
    only list SYSCALL, multiple functions can be assigned

-e trace={network,signal}
    * trace network related system calls like socket, connect, getsockopt, ...
    * trace signal related system calls

-k
    will try to show kernel stacktrace for each system call (linux 4.1+ and debug symbols are required)

-T
    print time spent on each call

-r
    print timestamp of each call

-t
    print clock time of each call

-o FILE
    output to FILE

-c
    count number of each system call

-k
    print stack trace

-p PID
    trace PID

-s SIZE
    adjust the length of output log

-v
    show arguments

# Example
$ strace -f -e open ps
    * trace which file does ps command get process' information

$ strace -f -e open man ps 2>&1 | grep open | grep ps
    * trace where is the document that man command lookup

$ strace -f -e open bash -c "echo hello"
    * trace whether bash script will read config file
    * the result is no

$ strace -f ./firefox -o strace.log > run.txt 2>&1
    * strace outputs to strace.log
    * firefox outputs to run.txt

$ strace -e trace=write,open ls
$ strace -e ioctl ./app
    * trace a particular system calls

$ strace -k -e trace=ioctl ./app
    * print stack trace of the system call
