# Description

# Overview
* 送的速度預設是照pcap檔每個封包的timestamp，但若有指定發送速度(--pps)，則直接忽略timestamp，而按指定平率平均發送

# Options
-l NUM
    * repeat NUM times

    
# Example
$ tcpreplay -i ens33 result.pcap

