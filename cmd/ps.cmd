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

$ ps -o nlwp <pid>
$ ps -o thcount <pid>
    * check how many threads used by a process, nlwp stands for Number of Light Weight Processes.

$ ps -o  ppid= 9487
    * find the parent pid of process 9487

$ ps -eo nlwp | tail -n +2 | awk '{ num_threads += $1 } END { print num_threads }'
    * check the snm of all threads running in the system.

$ ps -T -p `pidof mpv`
    PID    SPID TTY          TIME CMD
  35684   35684 pts/0    00:00:00 mpv
  35684   35685 pts/0    00:00:00 mpv/terminal
  35684   35686 pts/0    00:00:00 mpv/lua script
  35684   35687 pts/0    00:00:00 mpv/lua script
  35684   35688 pts/0    00:00:00 mpv/lua script
  35684   35689 pts/0    00:00:00 mpv/lua script
  35684   35691 pts/0    00:00:00 mpv/SO plugin (
  35684   35692 pts/0    00:00:00 mpv/SO plugin (
  35684   35693 pts/0    00:00:00 mpv/lua script
  35684   35694 pts/0    00:00:00 gmain
  35684   35695 pts/0    00:00:00 pool
  35684   35696 pts/0    00:00:00 gdbus
  35684   35698 pts/0    00:00:00 mpv/demux
  35684   35699 pts/0    00:00:00 mpv/worker
  35684   35700 pts/0    00:00:00 mpv/vo
  35684   35701 pts/0    00:00:00 mpv:cs0
  35684   35702 pts/0    00:00:00 mpv:disk$0
  35684   35703 pts/0    00:00:00 mpv:sh0
  35684   35704 pts/0    00:00:00 mpv:shlo0
  35684   35705 pts/0    00:00:00 mpv:sh1
  35684   35706 pts/0    00:00:00 mpv:sh2
  35684   35707 pts/0    00:00:00 mpv:sh3
  35684   35708 pts/0    00:00:00 mpv:sh4
  35684   35709 pts/0    00:00:00 ao-pipewire
  35684   35710 pts/0    00:00:00 mpv
  * show how mpv uses its threads

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

* show per thread name
$ ps -eLl
$ ps -eTl
    * -f option will replace thread name with full command line which is the same for all threads of a process
