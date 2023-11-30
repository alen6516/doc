# Description

# Overview
* Usually the gateway is also the dhcp server of your LAN

* When dhcp client is booted or its NIC is restarted, it will send DHCP client request to every host in the LAN.
    * To let every host reveice the packet, the srcip is set to 0.0.0.0, dstip is set to 255.255.255.255.
    * non-DHCP-server host will drop this packet.
    * DHCP-server will first check the srcMac to see if the src host should be configured with a static IP, if not, then DHCP will dispatch a IP with a duedate.
    * client will send arp packets in the LAN to make sure this IP is not possessed, if client accept the assigned IP, it will reply an ack, and server will record.
    * Whenever the client is off or IP addr is expired, client needs to request a IP again.

# Structure


## Field description
