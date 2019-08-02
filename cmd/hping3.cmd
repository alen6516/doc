# Description
packet maker

# Overview

# Options

## General
-i INTERVAL
    * INTERVAL set u1000 means 1 ms

-d DATA_SIZE
    * payload's size, not including any kinds of protocol header

-c COUNT

## IP
-a IP_addr
    * use a specified IP addr as my src_ip (spoofing)
    
--rand-source
    * random the src IP

## TCP/UDP
-p PORT
    dst port

-k
    don't vary src port
    
# Example
