# Description


# Overview
* Length of a UDP header is 8 octets

* RFC 768

* no session, no state => connectionless
    * each UDP segment is handled independently from another
    * Datagram socket

* udp payload max = 65535 - 20 (IP header len) - 8 (UDP header len) = 65507

# Structure

    Source port (2 octets)

    Destination port (2 octets)

    Length (2 octets)

    Checksum (2 octets)

## Field description
* Source port

* Destination port

* Length
    * length of the entire UDP segment, including UDP header and payload

* Checksum
    * checksum of the entire UDP segment and pseudo header
        * pseudo header is 12-byte long, including
            * Src IP address (4 bytes):
            * Dst IP address (4 bytes):
            * Zero           (1 byte) : 0000...
            * PTCL           (1 byte) : 0x11 for UDP
            * UDP length     (2 bytes)
        * why we need pseudo header in TCP/UDP checksum?
            * historical reasons, it is designed to examine if IP addresses have been modified during transmission or not
            * in IPv6, IP header doesn't do header checksum, it requires TCP/UDP to do
