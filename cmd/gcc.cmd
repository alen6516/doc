# Description

# Overview

# Options
-c
    * only compile, but not link (.c -> .o)

-o
    * link file (.o -> .out)

-I  PATH
    * specify header file's path

-save-temps
    * get all intermediate files in current directory
        * .i file: preprocesser output
        * .s file: compiler output
        * .o file: assembler output
        * .out file: linker output

    
# Example
$ gcc -E -dD a.c
    * show Macro Define
