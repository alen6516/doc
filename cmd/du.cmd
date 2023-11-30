# Description

# Overview
* estimate file space usage

# Options
-h
    human-readable
    
# Example
$ du -h --max-depth=1

$ du -sh /var
    * check the size of /var folder

$ du /* -s 2>/dev/null | sort -n
    * check disk usage of folders under /
