# Description
list symbols from object files

# Overview

# Options
-D
    display only dynamic symbols (provided by shared libraries)

-u
    display only undefined symbols

--defined-only
    display only defined symbols

-g 
    display only external symbols

-a
    display debugger symbol as well

-C
    force nm to decode low-level symbol names into user-level names

-n
    sort all symbols by its address, not alphabetically
# Symbol type
T
    * the symbol is in text (code) section, and it is global
    * linker will fail if it detects global symbol redefination
t
    * the symbol is in text (code) section, and it is local
    
# Example
$ nm obj_file
    * display symbol value, symbol type, synbol name

$ nm -A obj_file
    * add file name in front of each symbol output line

$ nm -Du /bin/ls
    * display undefined symbols needed to be provided by shared lib

$ nm -f sysv a.o
    * see variable belong to which memory segment
