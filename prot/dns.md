# Description


# Overview


* RFC 1034, RFC 1035

* FQDN
    * FQDN = hostname + domain name
        * www + google.com
        * under the same LAN, we can ping target via hostname
    * a.bb.ccc.ddd
        * length = 12
            * max length of a FQDN is 253
        * 4 labels
            * max length of a label is 63
     * FQDN is case insensitive


# Structure

    
    Header
        
        Transcation ID  (2 octects)
        Flags           (2 octects)

        Questions      (QDCount) (2 octects)
        Answer RRs     (ANCount) (2 octects)
        Authority RRs  (NSCount) (2 octects)
        Additional RRs (ARCount) (2 octects)
    
    Body

        Queries                     (depends)
        Authoritative nameservers   (depends, response only)
        Additional Records          (depends)

## Field description
* Length
    * not every DNS packet carries carry this column, need more investigation

* Transcation ID
    * a ID for matching a query with its corresponding response

* Flags
    * structure:
        QR     (1 bit) : 0 for request; 1 for response
        Opcode (4 bits): Specifies the kinds of query in the msg. use 0 for a standard query.
        AA     (1 bit) : Only meaningful in responses, specifying the responding name server is an authority for the domain name in question section.
        TC     (1 bit) : Specifies that this message was truncated or not.
        RD     (1 bit) : Recursion desired. ask the name server to do query recursively or not.
        RA     (1 bit) : Only meaningful in responses.
        Z      (1 bit) : Reserved, should be 0.
        RCODE  (4 bits): Response code, only meaningful in response, val and its meaning are below:
            0: No error condition.
            1: Format error, the name server can not interpret the query.
            2: Server failure, server was unable to process with a problem.
            3: Name error, meaningful only for response from an authoritative name server, this code signifies the domain name referenced in the quesy does not exist.
            4: Not implemented, the name server does not support the requested kind of query.
            5: Refused, the name server refused to perform the specified operation for policy reasons.

        
    * OpCode (comman values)
        * 0. Query      : reqular query
        * 4. Notify     
        * 5. Update
    
    * RCODEs (common values)
        * 0. NoError
        * 1. FormErr    : Format Error
        * 2. ServFail   : Server Failure
        * 3. NXDomain   : Non-existent Domain
        * 4. NotImp     : Not Implemented
        * 5. Refused    : Query Refused
