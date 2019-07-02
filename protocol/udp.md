# Description


# Overview
* Length of a UDP header is usually  octets

* having dst's IP address and asking its MAC address

# Structure

    Source port (4 octets)

    Destination port (4 octets)

    Length (4 octet)

    Checksum (4 octet)

## Field description
* Source port

* Destination port

* Length
    * length of the entire UDP segment, including UDP header and payload

* Checksum
    * checksum of the entire UDP segment and pseudo header
        * pseudo header is 12-byte long, including
            * Source IP address (4 bytes)
            * Destinatioin IP address (4 bytes)
            * Zero (1 byte)
            * PTCL (1 byte)
            * UDP length (2 bytes)
        * why we need pseudo header in TCP/UDP checksum?
            * historical reasons, it is designed to examine if IP addresses have been modified during transmission or not
            * in IPv6, IP header doesn't do header checksum, it requires TCP/UDP to do
