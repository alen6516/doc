# Description
recursively find a target from the specified path

# Usage
find PATH -name FILE_NAME

# Overview


# Options

-name
    * find file name

-iname
    * find file name, case insensitive

-type d/f/l/s/p
    * specify the type of target (dir, file, link, ...)
    
-exec CMD {} \;
    * for every single result, execute CMD one time
    * {} is the single result of find
    * \; ending char

-empty
    * find empty file or dir (by assigning -type f/d)

-size SIZE
    * specify size of the target

-atime +DAY
    * specify file that hasn't be accessed for more than DAY days

-amin -MIN
    * specify file that has been accessed for less than MIN minutes 

-ctime +DAY
    * specify file that has been created for more than DAY days

-user USER
    * specify the file which belongs to USER

-o CONDITION
    * if want to find files with multiple conditions, use -o to cascade conditions

# Example
$ find . -type f -name "*.php"
    * find all .php file under current dir

$ find . -type f -name ".mp3" -exec rm -f {} \;
    * {} means the result
    * \; is used to terminate the "-exec" option

$ find . -type f -exec sed -i 's/XXX/OOO/g' {} \;
    * find and replace string XXX to OOO in files

$ find . -type f -name ".*"
    * find hidden file

$ find . -size +50M -size -100M
    * find taget which size is between 50MB and 100MB

$ find ./ -name "*.c" -exec grep -wl main {} \;
    * find .c file which contains "main"

$ find ./ -name "*.mp3" -o -name "*.mp4"

$ find . -name "*.[ch]" | xargs wc -l
    * find the total line count of *.c *.h file
