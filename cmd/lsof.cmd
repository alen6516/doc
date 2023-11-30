# Description
List files open by each process

# Overview

# Options
-p PID
    * list files opened by porcess with pid PID

-c PROGRAM
    * list files opened by program PROGRAM
    
# Example
$ lsof .file.txt.swp
    * list processes who opened file.txt

$ lsof -i
    * list all network connection

$ lsof -i tcp
    * list all TCP connections

$ lsof -i tcp:8000
    * list connections to tcp port 8000

$ lsof -i :1-1024
    * list connections to port 1 to 1024

$ lsof -i TCP -s TCP:LISTEN
    * list all listening TCP connections

$ lsof -i TCP -s TCP:ESTABLISHED
    * list all established TCP connections
    
$ lsof -u root
    * list files opened by user root

$ lsof -u ^root
    * list files not opened by user root

$ lsof -u root -c java
    * list files opened by user root "or" opened by program java

$ lsof -a -u root -c java
    * list files opened by user root "and" opened by program java
    
$ lsof -c mpv
    * when mpv is running, this command is useful to check which .so files are used by mpv

$ lsof -p 1234,5678
    * list the the files opened by process with pid 1234 and 5678
