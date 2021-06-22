# Description
Network packet generation tool

# Overview
This is a tool that will be installed together with nmap

# Options
## General
-c NUM
    * how many counts of packet to send
    * 0 means don't stop

--quiet
    * no output

-N
    * don't try to capture replies

## L1
-e INTF
    * interface

## L2
--source-mac MAC
--dest-mac MAC
    * set dst/src mac

--mtu SIZE

## IP layer
-4
-6
    * ipv4/v6 traffic

--dest-ip IP
--source-ip IP
    * set dst/src ip

## TCP/UDP/ICMP
--tcp
--udp
--icmp
    * set TCP/UDP/ICMP

-p PORT
    * set dst port

## Payload
--data-length LEN
    * set the length of a random bytes a payload


# Example
$ alias hping6="nping -6 --source-mac 2a:6e:e1:c1:fb:0e --dest-mac 98:e8:fa:00:00:2f --source-ip 2001:1::161 -e ens19 -c 0 -N"
$ hping6 --dest-ip 20.20.101.162 --udp -p 9000 --quiet

