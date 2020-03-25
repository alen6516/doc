# Description
List files open by each process

# Overview

# Options
-p PID
    * list files opened by porcess with pid PID

-c PROGRAM
    * list files opened by program PROGRAM
    
# Example
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
