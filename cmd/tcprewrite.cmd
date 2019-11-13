# Description

# Overview

    use -h to see help information

# Options
-i
    input file

-o
    output file

--enet-dmac=DST_MAC
    rewrite dmac to DST_MAC

-D IP_A:IP_B
    rewrite dst ip from IP_A to IP_B

-r PORT_A:PORT_B
    rewrite TCP/UDP port from PORT_A to PORT_B
    
# Example
$ tcprewrite -i result.pcap -o result.pcap --enet-dmac=00:0c:29:e6:18:0b
    * rewrite dmac to 00:0c:29:e6:18:0b
