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
    Recursively search in each directory.

--include="*.conf"
    search specific file

-i 
    ignore case

-A NUM
    get surrounding lines (after the keyword)

-B NUM
    get surrounding lines (before the keyword)

-C NUM
    get surrounding line (both before and after the keyword)
    
# Example
$ grep -i -r --include=\*.c "pthread" ./
    * resursively search pattern in specific file name extension
