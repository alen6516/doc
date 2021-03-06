#include <stdio.h>

int fgetc (FILE *stream);
    
    // read next char from stream and return it as an unsigned char cast to an int, or EOF on end of file error


char*  fgets (char *s, int size, FILE *stream);

int getc (FILE *stream);
    
    // is equivalent to fgetc() except that it may be implemeted as a macro

int getchar (void);

char* gets (char *s);


// Briefly, f-start API means this API is implemented by function rather than Macro.
// However, in GUN C, these f-start API are also implemented by function, and just use a Macro to wrap it.

