# Description

# Overview
* ping echo request on linux may carry a 8-byte timestemp and 48-byte data in ICMP packet
* in the stdout, the length means ICMP packet's length

# Options
-I INTERFACE
    assign an interface to send echo request

-i 0.5
    assign the interval of sending request (unit is sec), only admin can set less then 0.2 sec
    

-c COUNT
    assign how many requests to send

-s SIZE
    * assign packet data size in bytes
    * 理論上不能超過 65507 bytes ( IP tatol length max is 65535 = ip header 20 bytes + icmp header 8 bytes + icmp data 65507)
    
# Example

