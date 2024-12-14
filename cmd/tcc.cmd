# Description
Tiny C compiler

# Overview

# Options

# Example
$ tcc -run a.c arg1
    * compile and run a.c with arg1

$ tcc -c a.c
    * compile a.c and generate object file

$ echo 'main(){puts("hello");}' | tcc -run -
    * read from stdin and execute

$ cat << EOF | tcc -run -
> #include <stdio.h>
> main(){
> printf("123\n");
> }
> EOF
    * here string as the input to run C code like interpreter
