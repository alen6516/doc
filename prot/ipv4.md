# Description


# Overview
* Length of a IPv4 header is usually 20 octets

* RFC 791

# Structure

    Version (4 bits)

    Internet Header Length (4 bits)

    Differentiated Services Code Point (6 bits)

    Explicit Congestion Notification (2 bits)

    Total length (2 bytes)

    Identification (2 bytes)

    Flags (3 bits)

    Fragment Offset (13 bits)

    Time To Live (1 byte)

    Protocol (1 byte)

    Header Checksum (2 bytes)

    Source IP address (4 bytes)

    Destination IP address (4 bytes)

    Optional (depends, optional)


## Field description
* Version

* Internet Header Length (IHL)
    * measure in 4-byte word

* Differentiated Services Code Point (DSCP)
    * defined in RFC 2474, update in RFC 3167, RFC 3260
    * for QoS, such as VoIP

* Explicit  Congestion Notification (ECN)
    * RFC 3168
    * allows end-to-end notification of network congestion
    * need support of the underlay network, when router routing this packet, it can mark on ECN to notify the ends if there is a congestion.
    
* Total length
    * Total length of IP datagram, or IP framgment if fragmented. Measured in bytes.

* Identification (ID)
    * fragments from the same IP packet obtain the same ID value
    * in transmission, usually this val becomes larger
        * so if see in the same session of transmission, somehow this ID become smaller, then it may indicate there is multiple machine in the server side (behind a load balancer)

* Flags
    * bit 0: Reserved; must be zero
    * bit 1: Don't fragment (DF)
    * bit 2: More Fragments (MF)
    * (bit 3~15 are Fragment Offset bits)

* Fragment Offset
    * Fragment offset from the start of IP datagram. Measure in 8 bytes increments. If IP datagram is fragmented, fragment's total length must be a multiple of 8 bytes.

* Time To Live

* Protocol
    * upper layer portocol, 0x06 for TCP, 0x11 for UDP

* Header Checksum
    * Checksum of entire IP header

* Source IP address

* Destination IP address

* Optional
