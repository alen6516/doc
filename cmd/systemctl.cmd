# Description

# Overview

# Options
    
# Example
$ sudo systemctl isolate multi-user.target
	* switch to run-level 3

$ systemctl isolate graphical
	* switch to run-level 5

$ systemctl status network-manager

$ systemctl status systemd-resolved
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
