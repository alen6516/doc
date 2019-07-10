# Description


# Overview

* DNS length is usually 

* RFC 1034, RFC 1035

* FQDN
    * FQDN = hostname + domain name
        * www + google.com
        * under the same LAN, we can ping target via hostname
    * a.bb.ccc.ddd
        * length = 12
            * max length of a FQDN is 253
        * 4 labels
            * max number of label is ?
     * FQDN is case insensitive


# Structure

    
    Header
        
        Length (2 octects)
        Transcation ID (2 octects)
        Flags (2 octects)

        Questions       (2 octects)
        Answer RRs      (2 octects)
        Authority RRs   (2 octects)
        Additional RRs  (2 octects)

        Queries                     (depends)
        Authoritative nameservers   (depends, response only)
        Additional Records          (depends)

## Field description
