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

* Manually config DNS server
    * the config of systemd-resolved is in /etc/systemd/resolved.conf, below is an example
        ```
        # 指定 DNS 伺服器，以空白分隔，支援 IPv4 或 IPv6 位置
        DNS=165.204.219.249 fd7b:d0bd:7a6e::1
        ```
