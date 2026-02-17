# Description
find the given pattern in files

# Usage
grep [options] PATTERN [FILE...]

# Option
-V, --version
    Show version information.

-v
    select the non-matching lines

-r
    Recursively search in each directory (excluding symlinks)

-R
    Recursively search in each directory (including symlinks)

--include="*.conf"
    search specific file

-i
    ignore case

-I
    ingore binary files

-l
    print the matched file name

-n
    print line number

-o
    only print matched text

-m NUM
    Stop reading the file after NUM matches

-A NUM
    get surrounding lines (after the keyword)

-B NUM
    get surrounding lines (before the keyword)

-C NUM
    get surrounding line (both before and after the keyword)

-E
    Interpret PATTERNS as extended regular expressions

-H
    show file name along with the matched lines

# Example
$ grep -i -r --include=\*.c "pthread" ./
    * resursively search pattern in specific file name extension

$ grep -RIn --include=".{c,h}" "my_function" ./

$ grep "pattern1\|pattern2" file.txt
$ grep -E "pattern1|pattern2" file.txt
$ egrep "pattern1|pattern2" filx.txt
$ grep -e pattern1 -e pattern2 file.txt
    * grep A or B

$ grep "std.*[ch]" file.c
    * grep by default support regex, * is not wildcard

$ grep -E "pattern1.*pattern2|pattern2.*pattern1" file.txt
    * grep A and B

$ grep -Pzo "#ifdef __cplusplus\n.*\n#endif"
    * search multi-line pattern
        ```
        #ifdef __cplusplus
            extern "C" {
        #endif
        ```
