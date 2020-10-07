## 靜態檔
* $ vim /etc/network/interfaces
    * 改完需要重啟網路服務殘會生效，只重啟網卡似乎不會
```bash
auto eth0

# ipv4
iface eth0 inet static
    address 192.168.1.9
    netmask 24
    #network 192.168.1.0
    #broadcast 192.168.1.255
    gateway 192.168.1.1
    dms-nameservers 8.8.8.8
    
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


## 網路指令
* ping
    * ping 廣播域
        * $ ping -b 192.168.1.0

    * 指定 interval
        * $ ping -i 0.5 $IP
            * 單位是秒，預設是 1 秒發一次封包，只有 root 可以設定 0.2 秒以內

    * 指定總封包數
        * $ ping -c 5 $IP

    * 指定從哪個 interface 出去
        * $ ping -I $DEV $IP

* ifup/ifdown: 啟動/關閉網卡
    * 啟動網卡
         * $ ifup eth0
            * 建議不要用這個指令，改用 ifconfig up

    * 關閉網卡
        * $ ifdown eth0
            * 建議不要用這個指令，改用 ifconfig down，因為若以 ifconfig eth0 .... 來設定或者是修改了網路介面後， 那就無法再以 ifdown eth0 的方式來關閉了！因為 ifdown 會分析比對目前的網路參數與靜態檔是否相符，不符的話，就會放棄該次動作。

* ifconfig: 網路介面相關
    * 觀察所有網卡
        * $ ifconfig

    * 觀察特定網卡
        * $ ifconfig eth0

    * 啟動網卡
        * $ ifconfig eth0 up

    * 關閉網卡
        * $ ifconfig eth0 down

    * 設定網卡 IP (立即生效)
        * $ ifconfig eth0 192.168.1.1 netmask 255.255.255.0

    * 設定網卡為混亂模式
        * $ ifconfig eth0 promisc
            * 用 ifconfig eth0 確認

* route:  路由相關
    * -n: 以數字表示 IP，不做 DNS 反查
    * -ee: 詳細顯示

    * IPv4 路由的增加與刪除
        * $ route add -net 1.1.1.0 netmask 24 gw 192.168.1.1 dev ens33
        * $ route del -host 1.1.1.1 gw 192.168.1.1 dev ens33
            * -net: 表示後面接的路由為一個網域
            * -host: 表示後面接的為連接到單部主機的路由
            * 如果需要從 gateway 轉送的話，務必要指定 gateway IP，不能只有放 dev，因為該 dev 上可能有多個 IP，Linux 不知道要用哪個送

    * IPv6 路由的增加與刪除
        * $ route add inet6 2001:2::/32 gw 2001:1::163 dev ens33 

* ip: 網路有關
    * 網卡
        * 取得所有網卡列表
            * $ ip link | grep -E '^[0-9]' | awk -F: '{print $2}'
        * 顯示網卡訊息
            * $ ip link
                * 顯示更加詳細的設備訊息
                    * $ ip -s link
        * 啟動/關閉網卡
            * $ ip link set eth0 up/down
        * 啟動/關閉網卡的混亂模式
            * $ ip link set eth0 promisc on/off
                * 用 ifconfig INTERFACE 來檢查網卡是否在混亂模式
        * 設定網卡 MTU
            * $ ip link set eth0 mtu 1400
        * 改變網路卡名稱(要先關閉界面)
            * $ ip link set eth0 down
            * $ ip link set eth0 HP-eth0
        * 改變MAC位址
            * $ ip link set eth0 address aa:aa:aa:aa:aa:aa
        * 新增虛擬網卡(?)
            * $ ip address add 192.168.1.1/24 broadcast 192.168.1.255 dev eth0 label eth0:HP
        * 刪除網卡(?)
            * $ ip address del 192.168.1.1/24 dev eth0
    * ARP entry
        * 顯示 arp entry
            * $ ip nei
        * 新增 arp entry
            * $ ip nei add 192.168.1.1 lladdr aa:aa:aa:aa:aa:aa
    * IPv4 位址
        * 顯示網卡 IPv4 訊息
            * $ ip addr
        * 設定網卡 IPv4 位址
            * $ ip addr add 192.168.0.1/24 dev eth0
        * 刪除網卡 IPv4 位址
            * $ ip addr del 192.168.0.1/24 dev eth0
        * IPv4 指令之 ip 換成 ip -6
    * IPv4 路由
        * 顯示 IPv4 路由
            * $ ip route
        * 設定 default route
            * $ ip route add default via 192.168.1.1 dev eth0
        * 刪除 default route
            * $ ip route del default
        * 設定路由
            * $ ip route add 192.168.1.0/24 via 192.168.2.1 dev eth0
                * 192.168.2.1 就是 next hop, 這個 IP address 必須位於 routing table 裡 eth0 直接相接的網段
        * 刪除路由
            * $ ip route del 192.168.1.0/24 dev eth0
    * IPv6 
        * 上述 IPv4 指令之 ip 換成 ip -6 即可

## /proc/sys/net
    * IPv4
        * 設定 server 不回 ICMP echo
            $ echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_all
