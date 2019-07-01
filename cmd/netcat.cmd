# Description

# Overview

# Options
-l
    start a daemon to listen

-u
    use UDP

# Example
$ nc -l -u 87.87.87.87 5000 > to_receive.txt
    Start a UDP socket listen on address 87.87.87.87, port 5000, and save received data to save.txt

$ nc -u 87.87.87.87 5000 < to_send.txt
    Use UDP socket to send data from file to_send.txt to address 87.87.87.87 port 5000

