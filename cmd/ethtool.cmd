# Description
show/modify configuration of NIC and NIC's driver

# Overview
* TSO (TCP-segmentation-offload)
    * NIC help TCP layer to do TCP segmentation, if this bit is on, TCP layer will not do segmentation and directly encapsulate TCP header then pass to lower layer
    * How do TCP layer know that NIC can segment data for it?
        * socket layer abstracts under layers for users; however, under layers can still know each other's information

* GSO (Generic-segmentation-offload)
    * hardware function

* GRO (Generic-receive-offload)
    * NIC help reassemble data for TCP layer



# Options
-k NIC
    show information of NIC

-S NIC
    show counters of NIC

    
# Example
$ ethtool -k eth1
    * show information of eth1

$ ethtool -K eth0 tx off rx off
    * disable TCP checksum offload
        * Linux may offload tcp checksum and let NIC to calc and fill it, one can use this command to disable linux to do so
