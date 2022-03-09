# Description

# Overview

# Options
    
# Example
cdecl> declare gg as array of pointer to function returning pointer to function returning char
char (*(*gg[])())()

cdecl> explain void *(*a[])(int)
declare a as array of pointer to function (int) returning pointer to void
