# Description

# Overview

# Options
-T
    show threads, possibly with SPID column
    SPID is thread id, thread ID and Process ID on Windows are allocated from the same pool, so they will be unique.

    
# Example
$ ps aux | grep PROCESS
    * show pid of the process

$ ps -efj | grep PROCESS
    * show pid, ppid of the process

$ ps -p 677 -T 
  PID  SPID TTY          TIME CMD
  677   677 ?        00:00:00 mysqld
  677   678 ?        00:00:00 mysqld
  677   679 ?        00:00:00 mysqld
  677   680 ?        00:00:00 mysqld
  677   681 ?        00:00:00 mysqld
  677   682 ?        00:00:00 mysqld
  677   683 ?        00:00:00 mysqld
  677   684 ?        00:00:00 mysqld
  677   685 ?        00:00:00 mysqld
  677   686 ?        00:00:00 mysqld
