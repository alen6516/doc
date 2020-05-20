# Description

# Overview

# Options
-a condition:NUM
    Stop capture after duration:NUM (seconds), files:NUM, filesize:NUM (kB), or packets:NUM. files condition requires -w.

-b condition:NUM
    Rotate to a new file after duration:NUM (seconds), interval:NUM (seconds), files:NUM, filesize:NUM (kB), or packets:NUM. Requires -w.

-c NUM
    Stop of after N packets. -c NUM <=> -a duration:NUM.

-s NUM
    Chop each packet at NUM bytes (SnapLen). 0 is read as the max, 262144. If used before -i, can be per interface.
    
# Example
$ tshark -i ens19 -a duration:45 -w trace.pcap
    * captue packets for 45 sec
