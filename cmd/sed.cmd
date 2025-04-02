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

$ sed '${NUM}q;d' $file
$ sed -n '${NUM}p' < $file
    * print the ${NUM}-th line of $file

$ bash script.sh | sed -n '2 p'
    * print the 2nd line of the script output

$ sed -n '10,33p' < $file
    * print line 10 to line 33 of $file

$ sed -n '1p;3p' < $file
    * print line 1 and line 3 of $file
