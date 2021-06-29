# Description


# Overview
* ref
    * http://bigpxuan.blogspot.com/2017/03/ipv6-extended-header.html


* IPv6 header length is always 40 bytes
* Instead of using flags and offset to represent ip frag, ipv6 introduce carry fragment information in extended header

# Structure


    Version (4 bits)

    Traffic Class (6 + 2 bits)

    Flow Label (20 bits)

    Payload Length (16 bits)

    Next Header (1 octect)

    Hop Limit (1 octect)

    Source Address (16 octects)

    Destination Address (16 octects)


## Field description
* Version
    * the constant of 6 (bit sequence 0110)

* Traffic Class

* Payload Length
    * tell the length of its payload
        * unlike ipv4, this payload length doesn't include ipv6 header's length
        * payload includes extension headers and upper layer data
        * with 16 bits, up to 65535 bytes can be indicated, but if the Extension Headers contain Hop-by-Hop Extension Header, then the payload may exceed 65535 bytes and this field is set to 0.

* extended header
    * ipv6 header can be followed by a chain of extended headers to carry more information
    * if there are many extended headers, they should be put in certain order

    Header Type     |    Order    |    Next Header
    ---------------:|------------:|---------------
    ipv6 header     |    1        |    41
    hop-by-hop      |    2        |    0
    Destination     |    3,8      |    60
    Routing         |    4        |    43
    Fragment        |    5        |    44
    Authentication  |    6        |    51
    ESP             |    7        |    50
    Mobility (MIPv6)|    9        |    135
    No Next Header  |    Last     |    59
    ICMPv6          |    Last     |    58
    TCP             |    Last     |    6
    UDP             |    Last     |    17


