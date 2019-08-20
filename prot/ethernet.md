# Description


# Overview

* Ethernet header length is usually 14 bytes

* Min length of a ethernet frame is 64 bytes
    * header + trailer = 18 bytes (14 bytes + 4 bytes)
    * Minimum payload = 46 bytes
    * 不夠的部分用 00000... 的 padding 補在 frame 的最後

* MTU
    * Maximum Transmission Unit
    * ethernet header + tail = 14 + 4 bytes
    * payload max is 1500 bytes => called "MTU is 1500 bytes"
    * so max total length of a frame is 1518 bytes

* Layer 2 is responsible for detecting and correcting error

* Layer 2 has 2 sublayer    
    * mac layer: 
        * detect if media is busy
    
    * logical link control:
        * CRC32
        * do checksum, and record RX error count

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
            * 0x0800 => IPv4
            * 0x0806 => ARP
            * 0x86dd => IPv6
    * else
        * Length, indicate the size of the payload on octets (except padding)

* FCS
    * usually called ethernet tail
    * filled with CRC32 to detect bit error
    * processed by hardware
    * can not be seen on wireshark
