# Description


# Overview
* Length of a ARP header is usually 28 octets

* RFC 826

* having dst's IP address and asking its MAC address

* the one who reply the request will also record the requester's MAC address

* gratutious ARP
    * No one ask my MAC address, but I activly broadcast to tell everyone my ARP entry, because OS may delete ARP entry which is expired

* IPv6 discard ARP and use neighbor discovery protocol (RFC 4861 and RFC 4862)

* An arp request packet:
    * if no such entry in my arp table
        * eth header
            * src mac: my mac
            * dst mac: ff:ff:ff:ff:ff:ff
        * arp header
            * src mac: my mac
            * dst mac: 00:00:00:00:00:00
    * if there is such entry in my arp table, just send request for update
        * eth header
            * src mac: my mac
            * dst mac: target's dst mac in my entry
        * arp header
            * src mac: my mac
            * dst mac: 00:00:00:00:00:00

# Structure

    Hardware type (2 octets)

    Protocol type (2 octets)

    Hardware size (1 octet)

    Protocol size (1 octet)

    Opcode (2 octets)

    Sender MAC address (6 octets)
    Sender IP address  (4 octets)

    Target MAC address (6 octets)
    Target IP address  (4 octets)


## Field description
* Hardware type
    * layer 2's type, eg. Ethernet => 0x0001

* Protocol type
    * layer 3's type
        * IPv4 => 0x0800
        * Remenber IPv6 does not require ARP.

* Hardware size
    * length of layer 2 address, MAC address is 6-byte long => 0x06

* Protocal size
    * length of layer 3 address, IPv4 address is 4-byte long => 0x04

* Opcode
    * operation code, request => 0x0001, reply => 0x0002

* Sender MAC address
* Sender IP address

* Target MAC address
* Target IP address


