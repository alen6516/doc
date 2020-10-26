# Description
trace system calls and signals

# Overview

# Options
-f
    also list the system calls executed by the child process

-e FUNCTION
    only list FUNCTION, multiple functions can be assigned

-s SIZE
    adjust the length of output log

-o FILE
    output to FILE

-p PID
    trace PID
    
# Example
$ strace -f -e open ps
    * trace where does ps command get process' information

$ strace -f -e open man ps 2>&1 | grep open | grep ps
    * trace where is the document that man command lookup

$ strace -f -e open bash -c "echo hello"
    * trace whether bash script will read config file
    * the result is no
