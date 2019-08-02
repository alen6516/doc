# Description
宣告變數類型

# Overview

# Options
-a ARR
    將後面名為 variable 的變數定義成為陣列 (array) 類型

-i INT
    將後面名為 variable 的變數定義成為整數數字 (integer) 類型

-x VAR
    用法與 export 一樣，就是將後面的 variable 變成環境變數；

-r VAR
    將變數設定成為 readonly 類型，該變數不可被更改內容，也不能 unset
    
# Example
$ declare -i sum=100+200+300; echo $sum
    * 允許數學運算

$ declare -A RFC=(          \
    ["arp"]="826"           \
    ["ipv4"]="791"          \
    ["ipv6"]="2460"         \
    ["icmp"]="792"          \
    ["udp"]="768"           \
    ["tcp"]="793"           \
)
    * iterate key
        ```
        for key in ${!RFC[@]}
        do
            echo $key
        done
        ```
