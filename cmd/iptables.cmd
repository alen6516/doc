# Description

# Overview

4 tables:
    * filter
        * default table
        * provide general filter functionality
    * nat
        * provide nat function like port/addr translation
    * mangle
        * used to modify specific packet
    * raw
        * with the highest priority
        * only used in PREROUTING and OUTPUT chain
        * usually it is set to get rid of the iptables tracking to a packet, on order to enhance the performance

* priority of the tables: raw > mangle > nat > filter

5 chains:
    * PREROUTING:   pkts before entering a routing table
    * INPUT:        pkts sent to this host
    * FORWARD:      pkts that sent to remote host and go through this host (usually when this host is a router or NAT)
    * OUTPUT:       pkts generated and sent from this host
    * POSTROUTING:  pkts before being sent out to NIC

3 actions:
    * ACCEPT
    * DROP:   drop the connection and don't return error
    * REJECT: drop the connection and return error

after configturation, need to save to disk otherwise it will disappear after poweroff
    * sudo /sbin/iptables-save

# Options
-A CHAIN
    * add rule to CHAIN (like INPUT/OUTPUT/FORWARD)

-s SRC_IP
    * assign the src ip

-j ACTION
    * assign the action

-p PROTOCOL
    * assigne the protocol, like tcp

--dport PORT
    * assigne the dst port of the pkt 
    
# Example
$ iptables -nvL
    * show all rules

$ iptables -A INPUT -p tcp --dport ssh -s 1.2.3.4/24 -j DROP
    * drop the input pkts of tcp dst port 22 from 1.2.3.4/24

$ iptables -D INPUT 1
    * delete the 1st rule from INPUT chain

$ iptables -I OUTPUT -p icmp --icmp-type destination-unreachable -j DROP
    * prevent ICMP port unreachable being sent by dropping  them using iptables
