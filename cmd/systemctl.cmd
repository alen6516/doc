# Description

# Overview

Services:
    * gdm3
        * Gnome display manager
        * config file is /etc/gdm3/custom.conf

    * lightdm
        * another display manager
        * we can use pstree | egrep "lightdm|gdm" to see which are in use

    * NetworkManager (network-manager)
        * Gnome default network manager
        * config files are /etc/netplan/*

    * systemd-networkd
        * yet another network manager
        * disable by default on Ubuntu
        * config files are /etc/systemd/network/*

    * systemd-resolved
        * an independent domain resolution service on linux
        * entries in /etc/hosts has the highest priority for lookup
        * config file is /etc/systemd/resolved.conf
            * if using DHCP, DHCP server will tell host which DNS server to use when doing lookup
            * otherwise, host will use DNS server specified in this file
        * resolvectl is a tool to test if systemd-resolved is working

# Options
    
# Example
$ sudo systemctl list-units --type=service
    * list all services under systemctl

$ sudo systemctl --type=service --state=active
    * list services/daemons handled by systemd

$ sudo systemctl isolate multi-user.target
	* switch to run-level 3

$ systemctl isolate graphical
	* switch to run-level 5

$ systemctl status network-manager
    * this is the network manger for gnome
    * we can replace it with systemd-networkd
    
$ systemctl status systemd-resolved
    * check the status of network name resolution
    * to lookup domain name, linux will first check /etc/hosts, if not found then check the config in /etc/resolv.conf and access DNS server
    * the config of systemd-resolved is in /etc/systemd/resolved.conf, below is an example
        ```
        # 指定 DNS 伺服器，以空白分隔，支援 IPv4 或 IPv6 位置
        DNS=192.168.35.1 fd7b:d0bd:7a6e::1

        # 備用 DNS 伺服器
        FallbackDNS=8.8.8.8

        # 設定搜尋域名
        Domains=your.com.tw

        # 設定 LLMNR 是否啟用，可用的選項有 yes、no、resolve
        LLMNR=yes

        # 設定 MulticastDNS 是否啟用，可用的選項有 yes、no、resolve
        MulticastDNS=yes

        # 設定 DNSSEC 是否啟用，可用的選項有 yes、no、allow-downgrade
        DNSSEC=yes

        # 設定快取是否啟用，可用的選項有 yes、no、no-negative
        Cache=no-negative
        ```
    * resolvectl is a tool to test if systemd-resolved is working

$ systemctl restart systemd-logind
    * logout
