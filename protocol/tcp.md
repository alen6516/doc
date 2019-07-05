# Description


# Overview
* Length of a ARP header is usually 20 octets

* RFC 793


# Structure

    src port (2 octets)
    dst port (2 octets)

    seq num (4 octets)
    ack num (4 octets)

    data offset (4 bits)

    reserved (4 bits)

    TCP flags (1 octet)

    window (2 octets)

    checksum (2 octets)

    urgent pointer (2 octets)

    TCP options (optional, variable)


## Field description
* src port
* dst port

* seq num
    * to tell the other side how many bytes I have sent, the ack num the other side replied must be this seq num + data len of this packet
    * in a SYN packet, seq num must not be 0

* ack num
    * to tell the other side how many bytes I have received from you, after I reply this ack num, seq num of the next packet the other send must be equal to this ack num.
    * ack num in a SYN packet must be 0

* data offset
    * represent TCP header length
    * unit is 4 octets, so this val multiple 4 is the true val

* reserved
    * 4 bits, must be 0

* TCP flag
    * C: 0x80 Congestion Window Reduced (CWR)

    * E: 0x40 ECN echo (ECE)
        * during the routing of this packet, nodes can turn this bit to tell the receiver network is congested

    * U: 0x20 URG
        * tell the other side the urgent pointer of this packet is meaningful

    * A: 0x10 ACK
        * tell the other side the ack num of this packet is meaningful

    * P: 0x08 PSH
        * ask the other side submit the data of this packet to application layer immidiately

    * R: 0x04 RST
        * shutdown the connection

    * S: 0x02 SYN
        * tell the other I am ready for transmission
        * must not ON together with FIN

    * F: 0x01 FIN
        * tell the other side I have sent all data
        * must not ON together with SYN

* windos
    * tell the other side the remaining size of my receiving buffer

* checksum
    * calculate the checksum of pseudo header and the entire TCP packet
    
* urgent pointer
    * if flag URG is on, then this column is meaningful, tell the other side the offset from the body of TCP of the LAST byte of urgent data
    * so if urgent pointer is 3, then the urgent data is from the 0 to 3 bytes of data



