# Description

# Overview

# Options

    
# Example
$ nc -u 127.0.0.1 8787
    * Open a TCP port and print the received data to terminal

$ nc -v 127.0.0.1 8787
    * Test TCP port is open or not

$ nc -lu 127.0.0.1 5000
    * Open a UDP port and print the received data to terminal

$ echo -n "foo" | nc -u -w1 127.0.0.1 5000
    * Send UDP packet to remote server
    * -w1 means timeout is 1 sec

* copy file between 2 machine
    $ nc -l 5000 > my.jpg
    $ nc server_ip 5000 < my.jpg
