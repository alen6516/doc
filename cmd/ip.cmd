* ip: 網路有關
    * NIC
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
    
    * IPv4 addr
        * 顯示網卡 IPv4 訊息
            * $ ip addr
        * 設定網卡 IPv4 位址
            * $ ip addr add 192.168.0.1/24 dev eth0
        * 刪除網卡 IPv4 位址
            * $ ip addr del 192.168.0.1/24 dev eth0
        * IPv4 指令之 ip 換成 ip -6
    
    * IPv4 route
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

    * IPv4 source route
        * there are 3 routing table: default, main, local
            * local table can not be modified
            * new route will be added to main table by default

        * we can add a new table and specify traffic with certain ip lokup the new table

        1. create a new routing table
            $ echo 200 my_table >> /etc/iproute2/rt_tables
        
        2. add route to the new table
            $ ip route add default via 192.168.1.1 dev eth0 table my_table
            * to apply it after reboot, write the following to /etc/network/interfaces
                $ post-up ip route add default via 192.168.1.1 dev eth0 table my_table

        3. config to let specific src ip traffic lookup the new table
            $ ip rule add from 10.10.10.10 lookup my_table
            * to apply it after reboot, write the following to /etc/network/interfaces
                $ post-up ip rule add from 10.10.10.10 lookup my_table

        * check the route in the new table
            $ ip route show table my_table

        * check the rule
            $ ip rule list
            
    * IPv6 
        * 上述 IPv4 指令之 ip 換成 ip -6 即可
        * 有 IPv4 addr 的網卡要再設 IPv6 addr 時，習慣 20:20:20:161/24 => 2001:20:20:20::161/64
