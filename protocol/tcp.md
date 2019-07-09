# Description


# Overview
* Length of a ARP header is usually 20 octets

* RFC 793

* flow control
    - 接收端能向發送端協調發送的 rate，不要讓接收端 buffer 爆掉
    - sliding window 是 flow control 的主要機制

* congestion control
    - 包括多算法來達成
    - 因為 ”其他流量” 的關係，導致這個 tcp connection 掉包 => 偵測到 congestion => 我將我的流速放慢 (靠 TCP congestion-avoidance algorithm 達成)

* stop-and-wait operation
    - 每送一個封包，等收到 reply 才送下一個，等待 RTT+L/R 的時間
    - 使用 pipelining ，一次送好多個，以提升頻寬用率

* RTO
    * the interval for the client to retransmit a packet

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
    * 32-bit word, so this val multiple 4 is the true val

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

* windows
    * tell the other side the remaining size of my receiving buffer
    * implementation of flow control
    * max is 65535, but is usually not large enough for modern services, so it depends on optional column to support it

* checksum
    * calculate the checksum of pseudo header and the entire TCP packet
    
* urgent pointer
    * if flag URG is on, then this column is meaningful, tell the other side the offset from the start of TCP body to the LAST byte of urgent data
        * so if urgent pointer is 3, then the urgent data is from the 0 to 3 bytes of data


* options
    * structure
        * kind: 1-byte
        * len: 1-byte
        * value: depends
    
    * kind
        * window scaling
            * if this val =x, and windows val = N, then the true window size is N * (2^x) bytes
        * MSS
            * in order to avoid the data being fragmented in transport, the 2 end negotiate a MSS val to use
            * MTU test packet is layer 3 method to determine to proper MTU value
            * MSS negotiate is layer 4 method, so it can only utilize the sender & receiver’s MTU and choose the smaller one.

        * selective acknowledgement

        * timestamp

