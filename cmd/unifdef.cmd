# Description
* https://www.ibm.com/docs/zh-tw/aix/7.3?topic=u-unifdef-command
remove preprocessor conditionals from code

# Overview
unifdef can identify the following keywords:
- ifdef
- ifndef
- else
- endif
- elif

Cannot handle the following cpp case:
- #if defined(X) || defined(Y)
- #elif X
- #elif defined(X) || defined(Y)

# Options

# Example
$ unifdef -DA original.c > modified.c
    * read original.c and remove #ifdef A line, preserve #ifdef part and remove the associated #elif/#else part.

$ unifdef -UA original.c > modified.c
    * read original.c and remove #ifdef A part, preserve #elif/#else part.
