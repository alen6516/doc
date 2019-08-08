# Description

# Overview

* usage: $ find PATH -name FILE_NAME

# Options

-name
    * find file name

-iname
    * find file name, case insensitive

-type d/f/l/s/p
    * specify the type of target (dir, file, link, ...)
    
-exec CMD
    * for the result, execute CMD

-empty
    * find empty file or dir (by assigning -type f/d)

-size SIZE
    * specify size of the target


# Example
$ find . -type f -name "*.php"
    * find all .php file under current dir

$ find . -type f -name ".mp3" -exec rm -f {} \;
    * {} means the result
    * \; is a ending char

$ find . -type f -name ".*"
    * find hidden file

$ find . -size +50M -size -100M
    * find taget which size is between 50MB and 100MB

$ find ./ -name "*.c" -exec grep -wl main {} \;
    * find .c file which contains "main"
