# Description

# Overview

# Options

    
# Example
$ sed -i "s/old_string/new_string/g" file1 file2 file3
    * replace "old_string" with "new_string" in file1, file2, file3
    * if no -i, the command just output the result to cli

$ sed -i '/^$/d' file.txt
    * remove blank lines from a file

$ sed -i 's/[ \t]*$//' "$1"
    * remove trailing spaces from a file
