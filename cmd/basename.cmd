# Description
Strip directory and suffix from filenames

# Overview

# Options
-s WORD
    strip the suffix WORD

# Example
$ basename /usr/bin/sort
    * sort

$ basename /usr/include/stdio.h .h
    * stdio

$ basename -s .h /usr/include/stdio.h
    * stdio
