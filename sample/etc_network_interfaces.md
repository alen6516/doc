# Description
Set static network configuration in Ubuntu 16.04

# Code
* $ vim /etc/network/interfaces
    * 改完需要重啟網路服務才會生效，只重啟網卡似乎不會
```bash
auto eth0

# ipv4
iface eth0 inet static
    address 192.168.1.9
    netmask 24
    #network 192.168.1.0
    #broadcast 192.168.1.255
    gateway 192.168.1.1
    dns-nameservers 8.8.8.8
    
# ipv4 route
up route add -net 20.20.20.0/24 gw 192.168.1.2 dev eth0
up ip -4 route add 20.20.20.0/24 via 192.168.1.2 dev eth0

# ipv6
iface eth0 inet6 static
address xxxx:xxxx::xxxx
netmask 64

# ipv6 route
up ip -6 route add ::/0 via xxxx:xxxx::yyyy dev eth0
down ip -6 route del ::/0 via xxxx:xxxx::yyyy dev eth0
```
