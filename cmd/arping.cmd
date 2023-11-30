# Description

# Overview

# Options
-I <iface>
    specify interface

-D <IP addr>
    detect mode, check if the specified ip addr is used in LAN
    return 0 means yes

-c N
    specify how many packets to send

# Example
* Check if 192.168.0.1 is in use
    $ sudo arping -D 192.168.0.1 -c 5
    $ echo $?
    * 0 means yes
