# Description
vlan

# Overview

* a end device can also send pkt with vlan tag, but generally it won't, and the tag is added by the switch after receiving the pkt

* port can be tagged & untagged port
    * tagged port
        * tagged port can receive/send packet with/without certain vlan tag. These ports are usually connect to another switch
    * untagged port
        * untagged port can receive/send pkt without tag, and will add the specified tag to the pkt. These ports are usually connect to end hosts who don't know vlan.
    * so generally, for a port on switch, if it is trunk port, it will be tagged port which allows multiple vlan tag; if it is access port, it will be untagged vlan id 1 and maybe several tagged ids
        * if pkt is from end host, it doesn't have tag, so switch will add it with tag id 1
        * if pkt is is from end host and has tag, it will switch the pkt by this tag id 

# Structure


## Field description
