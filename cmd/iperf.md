# Description

# Overview

# Options
-c
    use as a client

-u 
    use UDP

-p PORT
    specify TCP/UDP port

-i SEC
    specify the interval in seconds for iperf to show statistic message

-b BANDWIDTH
    specify the bandwidth to pure
    
# Example
* $ iperf -c 20.20.101.162 -u -p 8787 -i 1 -b 1m
    * be a client to send UDP packet to 20.20.101.162 port 8787 with bandwidth 1Mbytes
