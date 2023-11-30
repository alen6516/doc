# Description

# Overview

# Options
-sn
    ping scan

-sT
    TCP scan

-sU
    UDP scan

-F
    fast mode, scan fewer ports

-O
    OS discovery

-S <Address>
    sproof source IP

-e <iface>
    specify interface

-n
    don't do DNS resolution

-R
    always do DNS resolution

-oG <File>
    output the result to a grepable file

# Example
$ sudo nmap -sn 192.168.0.*
$ sudo nmap -sn 192.168.0.1/24
    * Ping scan LAN and show all hostname in LAN.

