# Description


# Overview

* IPv6 header length is usually 40 bytes

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

