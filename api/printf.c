#include <stdio.h>

int printf(const char *format, ...);
    // sample

int sprintf(char *str, const char *format, ...);
    // write to a char string

int fprintf(FILE *stream, const char *format, ...);
    // print to a specific file descriptor, instead of an std stream
