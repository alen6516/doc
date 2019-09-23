# Description


# Overview

* ICMPv6 header is 

* RFC

* Use neighbor solicitation/advertisement as neighbor discovery for IPv6 (RFC 4861)
    * solicitation msg also provide sender's link-layer addr for target
    * replaces ARP
    * IPv6 addr of the solicitation msg
        * src IP: sender's IP
        * dst IP: multicast addr or target's IP addr
        * src mac: sender's mac
        * dst mac: IPv6 muticast mac addr or 


# Structure

    Type (1 octect)

    Code (1 octect)

    Checksum (2 octects)
    
    Reserved | Flags  | Identifier (4 octects)

    Target Address (16 octects, depends on Type 135 Neighbor Solicitation)

    ICMPv6 Option (varied length, optional)
        Type    (1 octect)
        Length  (1 octect)
        Data    (varied, depends on Length)

## Field description
* Type
    
* Code

* Checksum

* Reserved | Flags  | Identifier | ...
    * this field may be one of the followed
    * Reserved
        * all zero
        * in Neighbor Solicitation
    * Flags
        * in Neighbor Advertisement
    * Identifier
        * in Echo request/reply

* Target Address
    * IPv6 addr of the target
