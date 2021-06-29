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
    * the interval for the sender to retransmit a packet

* when sending tcp packet, usually use send()

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
        * which also means TCP header length must be a multiple of 32 bits, when it is not, using Padding (NOP) to fill it

* reserved
    * 4 bits, must be 0

* TCP flag
    * C: 0x80 Congestion Window Reduced (CWR)

    * E: 0x40 ECN echo (ECE)
        * during the routing of this packet, nodes can turn on this bit to tell the receiver network is congested

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
        * must not be ON together with FIN

    * F: 0x01 FIN
        * tell the other side I have sent all data
        * must not ON together with SYN

* windows
    * tell the other side the remaining size of my receiving buffer
    * implementation of flow control
    * max is 65535, but is usually not large enough for modern services, so it depends on optional column to support it

* checksum
    * calculate the checksum of pseudo header and the entire TCP segment
    
* urgent pointer
    * if flag URG is on, then this field is meaningful, telling the other side the offset from the start of TCP body to the LAST byte of urgent data
        * so if urgent pointer is 3, then the urgent data is from the 0 to 3 bytes of data


* options
    * structure
        * kind: 1-byte
        * len: 1-byte
        * value: depends
    
    * kind
        * 0: End of Options List
        * 1: No Operation (NOP, Pad)

        * 2: MSS
			* it's an end-to-end thing, which TCP layer tells the counterpart "I accept at most X bytes of data"
            * MTU test packet is layer 3 method to determine to proper MTU value
			* it is not a negotiation, the 2 directions of the connection can use different mss
			* according to RFC 879, the default mss is 536

        * 3: window scaling
            * if this val = x, and windows val = N, then the true window size is N * (2^x) bytes
            * if one side doesn't use this option, then both sides don't use


        * 4: selective acknowledgement

        * 5: timestamp

## TCP action when receive different flag (Note they may be different on different OS)

* SYN (seq=x, ack=0)
    * port open
        * send SYN/ACK back (seq=y, ack=x+1)
    * port closed
        * send RST back (seq=?, ack=?)
* FIN (seq=?, ack=?) 
    * port open
        * no response
    * port close
        * send RST/ACK back (seq=?, ack=?) (according RFC 793 defining actions when open/closed port received FIN packet)
* Xmas scan (send FIN/URG/PSH) (seq=?, ack=?)
    * port open
        * no response
    * port closed
        * send RST/ACK back (seq=?, ack=?) (according RFC 793 defining actions when open/closed port received FIN packet)
* Null scan (no flags) (seq=?, ack=?)
    * port open
        * no response
    * port closed
        * send RST/ACK back (seq=?, ack=?)
* IP TTL scan the server behind a filter
    * already knows the hop-counts from client to server (eg. 4), setting the TTL val as 4 and send to server
    * port open
        * server reply TTL time exceed
    * port closed
        * packet dropped by the firewall and no response
    * if the filter is a network firewall, then it method is useful, if it is a proxy, then this method will not work because proxy will create a new packet and destroy old TTL
