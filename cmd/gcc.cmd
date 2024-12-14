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
    * specify header file's path, the search priority is higher than system header files

-l library
    Search the library named library when linking.

-Ldir
    Add directory dir to the list of directories to be searched for -l.

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

-O0
    * still do optimization: Reduce compilation time and make debugging produce the expected results
-O3
    * enable highest optimization
-Og
    * starting with gcc 4.8, it enables -O1 optimizations that do not interfere with debugging
    * recommend for edit-compile-debug cycle

# Example
$ gcc -E -dD a.c
    * show Macro Define

* build shared lib from .o file
    $ gcc -shared *.o -o libavfilter.so

* build shared lib from static lib
    $ ar -x lib***.a
    $ gcc -shared *.o -o lib***.so

$ gcc query_vcnip.c -I/opt/amdgpu/include/libdrm/ -o query_vcnip -L/opt/amdgpu/lib/x86_64-linux-gnu -ldrm_amdgpu
    * -I/opt/amdgpu/include/libdrm specifies the path containing header files included by the .c file
    * -ldrm_amdgpu specifies libdrm_amdgpu.so to be linked with
    * -L/opt/amdgpu/lib/x86_64-linux-gnu specifies the path to libdrm_amdgpu.so
