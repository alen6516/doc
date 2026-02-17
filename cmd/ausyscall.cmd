# Description
a program that allows mapping syscall names and numbers

# Overview

# Options

# Example
$ ausyscall --dump
    * show all system call with their numbers
    $ grep "__NR_" /usr/include/asm/unistd_64.h

$ ausyscall ioctl
    * get 16

$ ausyscall 149
    * mlock
