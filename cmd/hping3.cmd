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

--rand-dest
    * --rand-dest 10.0.0.x, x will range from 0 to 255
    * if use x.x.x.x, better use --interface to make sure packet goes out from the desiring interface

-t TTL
    * specify TTL

-N NUM
--id NUM
    * specify ID of IP packet

-f
--frag
    * fragment the data into multiple packets, default MTU is 16 bytes

## TCP/UDP
-s PORT
    src port

-p PORT
    dst port

-w SIZE
    tcp window size

-k
    don't vary src port

-L ACK_NUM
    specify the ack number

## APP Layer
-d LEN
    * specify data length

# Example
