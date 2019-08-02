# Description

# Overview
* use git clone https://github.com/secdev/scapy.git to obtain scapy, not apt install
    * run scapy/run_scapy

# Options

    
# Example
$ lsc()
    * show avaliable command

$ ls(IP)
    * find parameters of IP protocol

$ help(PacketSend)
    * see how to use PacketSend

$ p = IP(dst="8.8.8.8")/TCP(dport=80)/"GET / HTTP/1.1"

$ send(p)

$ res = sr(p)
    * send packet p and receive the reply in res
    * res store both the sent packet and its reply in a nested list, using type() to analyze this structure
