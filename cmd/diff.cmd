# Description

# Overview

# Options

# Example
$ diff -U 0 file1 file2 | grep ^@ | wc -l
    * compare 2 files and count how many diff lines
    * -U 0 means output 0 lines in unified context
    * grep ^@ means search lines start with @
