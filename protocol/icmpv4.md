# Description


# Overview
* Length of a ARP header is usually 28 octets

* RFC 792 (one of Internet Protocol)

* use to return an error msg or analysis of route, an ICMP error msg always covers source data to return to the sender

* unreliable

* structure of a ICMP echo request: Type + Code + Checksum + ID + Seq num + Timestamp (8 bytes) + data (48 bytes)

# Structure

    Header

        Type (1 octect)

        Code (1 octect)

        Checksum (2 octect)

        Rest of Header (depends on Type and Code)
            [ ID (2 octects) ]
            [ Sequence (2 octects) ]
            [ Timestamp (8 octects) ]

    Data


## Field description
* Type
    * specify the type of the error msg

* Code
    * further explain the reason of error under this error type

    * Type-Code example
        * 0:  Echo reply
            * 0:  echo reply
        * 1:  reserved
        * 2:  reserved
        * 3:  Destination unreachable
            * 0:  destination network unreachable
            * 1:  destination host unreachable
            * 2:  destination protocol unreachable
            * 3:  destination port unreachable
        * 8:  Echo request
            * 0:  echo reply
        * 11: Time exceed
            * 0:  TTL expire in transit
            * 1:  Fragment reassembly time exceeded

* Rest of Header
    * the structure varied depends on the Type of the ICMP msg
    * some example element of this column
        * ID: identify this icmp session, echo requests/responses of the same session obtains the same ID.
        * Sequence: a number which is incremantal by 1 from 0, indicating the order of packet in the same icmp session

* Data
    * includes a copy of the entire IPv4 header, plus at least the first eight bytes of data from the IPv4 packet that caused the error message
