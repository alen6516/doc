# Description

# Overview
* just append filter condition at hte end of command
    * filter's syntax follows BPF (Berkeley Packet Filter)
    * for complicated fileter, we can use '(condition a) and (condition b)', remenber () most in '', or () will be caught by bash and not work

# Options
-i INTERFACE
    assign the network interface to listen

-w FILENAME
    write to a pcap file

-e
    show ethernet mac address

-v
    show more detail information

-vv
    show more more detail information

# Example
$ tcpdump -i ens33 -w icmp.pcap
    * listen on ens33 and write to icmp.pcap

$ tcpdump -i ens33 dst host 192.168.87.87
    * only capture packets whose dst IP addr is 192.168.87.87

## BPF example
$ dst host HOST
$ src host HOST
$ host HOST
$ ip broadcast

$ ether dst MAC
$ ether src MAC
$ ether host MAC
$ ether broadcast
$ ether proto PROTOCOL
    * PROTOCOL: ip, ipv6, arp

$ vlan VLAN_ID


$ gateway HOST

$ dst net NET
$ src net NET
$ net NET
$ net NET mask NETMASK
$ net NET_LEN

$ dst port PORT
$ src port PORT
$ port PORT
$ dst portrange PORT1-PORT2
$ src portrange PORT1-PORT2
$ portrange PORT1-PORT2

$ less LENGTH
$ greater LENGTH

$ ip proto PROTOCOL
    * PROTOCOL: tcp, udp, icmp

$ ip6 proto PROTOCOL

$ tcp[tcpflags] & (tcp-syn|tcp-fin) != 0
    * tcp packets with SYN or FIN flag

$ icmp[icmptype] != icmp-echo and icmp[icmptype] != icmp-echoreply
    * capture all ICMP packets that are not echo requests/replies
