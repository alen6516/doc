# Description

# Overview

# Options
-c
    * only compile, but not link
    * .c -> .o

-E
    * only do preprocess, will print output to std

-o
    * link file (.o -> .out)

-I  PATH
    * specify header file's path

-fno-inline
    * do not inline function

-save-temps
    * get all intermediate files in current directory
        * .i file: preprocesser output
        * .s file: compiler output
        * .o file: assembler output
        * .out file: linker output

-std=STD
    * -std=c89 -std=c99 -ansi -std=iso9899:1990
        * these std are all the same, but note gcc doesn't totally support the C standard
        * check https://gcc.gnu.org/onlinedocs/gcc/Standards.html
    * -std=gnu90
        * c90 plus some extensions by GNU
    * to check the default -std argument, use --verbose
    
# Example
$ gcc -E -dD a.c
    * show Macro Define
