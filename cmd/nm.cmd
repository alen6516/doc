# Description
list symbols from object files

# Overview

# Options
-D
    display only dynamic symbols (provided by shared libraries)

-u
    display only undefined symbols

    
# Example
$ nm -Du /bin/ls
    * display undefined symbols needed to be provided by shared lib

$ nm -f sysv a.o
    * see variable belong to which memory segment
