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
    * specify total pkt count

-1
    * using ICMP

-2
    * using UDP

## Layer 1
-I INTF
    * specify emit interface

## Layer 2
-m MTU 
    * specify MTU

## IP
-a IP_addr
    * use a specified IP addr as my src_ip (spoofing)
    
--rand-source
    * random the src IP

-t TTL
    * specify TTL

-N NUM
--id NUM
    * specify ID of IP packet

-f
--frag
    * fragment the data into multiple packets, default MTU is 16 bytes

## TCP/UDP
-p PORT
    dst port

-k
    don't vary src port

## APP Layer
-d LEN
    * specify data length

# Example
