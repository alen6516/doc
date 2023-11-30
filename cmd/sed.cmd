# Description

# Overview

# Options
 -i
    edit files in place
    
# Example
$ sed -i "s/foo/bar/gI" file1 file2 file3
    * replace "foo, FOO, FoO, ..." with "bar" in file1, file2, file3
    * g means global replace
    * I means to match all cases of foo

$ sed -i '/^$/d' file.txt
    * remove blank lines from a file
    * d means delete line 

$ sed -i 's/[ \t]*$//' file
    * remove trailing spaces from a file
