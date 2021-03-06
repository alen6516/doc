# Description

# Overview

    use -h to see help information

# Options
-b
    skip rewriting broadcast/multicast IPv4/IPv6 pkt
-i
    input file

-o
    output file

--enet-dmac=DST_MAC
    rewrite dmac to DST_MAC

--enet-dmac=DST_MAC_A,DST_MAC_B
    rewrite dmac from DST_MAC_A to DST_MAC_B

-S IP_A:IP_B
    rewrite src ip from IP_A to IP_B

-D IP_A:IP_B
    rewrite dst ip from IP_A to IP_B

-r PORT_A:PORT_B
    rewrite TCP/UDP port from PORT_A to PORT_B

-C
    Force recalculation of IPv4/TCP/UDP header checksums

#eExample
$ tcprewrite -i result.pcap -o result.pcap --enet-dmac=00:0c:29:e6:18:0b
    * rewrite dmac to 00:0c:29:e6:18:0b
