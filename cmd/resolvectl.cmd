# Description

# Overview

# Options
    
# Example
$ resolvectl status | grep "DNS Server"
    * find current DNS server ip

$ resolvectl query www.google.com
    * test a forward DNS

$ resolvectl query 127.0.0.1
    * test a reverse DNS

$ resolvectl flush-caches
    * clear the cache of systemd-resolved service
