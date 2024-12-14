# Description

# Overview
* default read from stdin

# Options
-A FILE
    * use ^I to represent Tab in FILE
    
# Example
$ cat /proc/cpuinfo
    * show cpu info

$ cat /proc/meminfo
    * show mem info

$ cat > dst_file.txt << eof
> this is
> the content
> of file
> eof
