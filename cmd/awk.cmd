# Description

# Overview
* can use " or ' after awk
* space between ' and { is not necessary

# Options
-F
    set field-separator

-v
    set a local variable

# Example
$ awk 'NR==2{ print; }' filename
    * print line 2 of the file

$ awk '{ printf NR "%s\n", $0 }' << file
    * print the file and add line number in front of each line
    * can use NR-1 if want the line number to be 0-base

$ echo $PATH | awk -F: '{ print $1, $4 }'
    * set ':' as the field-separator and print the 1st and 4th field

$ awk -va=1 '{print $1,$1+a}' log.txt
    * set a=1 as local variable

$ awk '/foo/ {print FNR $0; exit}' log.txt
    * search foo in log.txt and print file number and the line of the first match

$ awk NF file.txt
    * NF only set on non-blank lines, so this command will print non-blank linee
