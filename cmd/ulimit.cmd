# Description

# Overview

* the overall system's ulimit config is stored in /etc/security/limits.conf

# Options

    
# Example
$ ulimit -u
    * check how many processes this user can open

$ ulimit -u 512
    * limit the number of process the user can open to 512

$ cat /proc/6791/limits
    * check resources that process with pid 6791 can use

$ ulimit -c
    * check the limit of the size of core file, 0 means Linux won't generate core file when the process receive SIGSEGV (segmentation fault)

$ ulimit -c 1024
    * set the limit of generated core file to be 1024 KB

$ ulimit -n 4096
    * set the limit of files that a process can open to 4096

$ ulimit -n unlimited
    * set the limit of files that a process can open to unlimited
