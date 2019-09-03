# Description

# Overview
* RX, TX 的值是存在網卡裡，所以下 ifconfig 的指令時，會去網卡撈 register

# Options
    
# Example
$ ifconfig lo:10 87.87.87.87 netmask 255.255.255.0 up
    * add a new loopback interface

$ ifconfig lo:10 down
    * remove the interface
