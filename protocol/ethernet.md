# Description


# Overview
* detect and correct error

* 2 sublayer    
    * mac layer: 
        * detect if media is busy
    
    * logical link control:
        * CRC32
        * do checksum, and record RX error count

* Min length is 64 bytes
    * Ethernet header = 18 bytes (dst MAC 6 bytes + src MAC 6 bytes + Length 2 bytes + CRC 4 bytes)
    * Minimum payload = 46 bytes

* MTU
    * Maximum Transmission Unit
    * ethernet header + tail = 14 + 4 bytes
    * payload max is 1500 bytes => called MTU is 1500
    * so max total length of a frame is 1518 bytes


# Structure

    (Hide): Preamble (7 octets) + STD (1 octet)
    
    (Show): dst MAC (6 octets) + src MAC (6 octets)

    (Optional): 802.1Q tag (4 octets) 

    (Show): Type or Length (2 octets)

    Payload

    (Hide): FCS (4 bytes)

    (Show): Padding (depends)

    // Hide means this field is hided on wireshark
    // Show means this field is shown on wireshark if it exists


## Field description
* Preamble: 7 bytes of 10101010... for synchronization
* SFD: start frame delimiter

* MAC address
    * unicast mac address
        * the least significant bit of an address's first octect is 0
        * eg. 00:11:22:33:44:55
    * muticast mac address
        * the least significant bit of an address's first octect is 1
        * eg. 01:11:22:33:44:55
    * broadcast mac address
        * all bits are 1
        * eg. FF:FF:FF:FF:FF:FF
    * OUI
        * Organization Unique Identify
        * 前 24 bit 代表網卡製造商

* Type or Length
    * if this value >= 1536
        * Type, indicate which protocol OS encap in the payload
            * eg. 0x0800 => IPv4, 0x0806 => ARP
    * else
        * Length, indicate the size of the payload on octets (except padding)

* FCS
    * usually called ethernet tail
    * filled with CRC32 to detect bit error
    * processed by hardware
