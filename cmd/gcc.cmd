# Description

# Overview

# Options
-c
    * only compile, but not link (.c -> .o)

-o
    * link file (.o -> .out)

-I  PATH
    * specify header file's path, the search priority is higher than system header files

-l library
    Search the library named library when linking.

-Ldir
    Add directory dir to the list of directories to be searched for -l.

-save-temps
    * get all intermediate files in current directory
        * .i file: preprocesser output
        * .s file: compiler output
        * .o file: assembler output
        * .out file: linker output

    
# Example
$ gcc -E -dD a.c
    * show Macro Define
