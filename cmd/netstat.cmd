# Description

# Overview

# Options
-t
    show TCP connections

-u
    show UDP connections

-s
    * show statistics for each protocol (IP, TCP, UDP, ICMP)
    * -st: display the statistics for only TCP ports

-p 
    display the PID and program name

-i
    display information about NIC

-r
    routing table

-n
    using numerical address
    
# Example
$ netstat -tuna
    * display all TCP and UDP connections using numerical addresses
    * column description:
        * Proto: protocol (TCP or UDP).
        * Recv-Q: the bytes of data in the queue to be sent to the user program that established the connection. This value should be 0 or close to 0.
***        * Send-Q: the bytes in the queue to be sent to the remote program. This value should also be 0 or close to 0.
        * Local Address: the IP address of the local computer and the port number being used. An asterisk is shown for the host if the server is listening on all interfaces.
        * Foreign Address: the IP address and port number of the remote computer. If the port is not yet established, the port number is shown as an asterisk (*).
        * State: the state of a TCP connection.

