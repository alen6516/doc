# Description

# Overview

# Options

# Example
$ crontab -l
    * list my crontab

$ sudo crontab -u <USER> -l
    * list a user's crontab

$ crontab -e
    * edit my crontab
    ```
    ## Format
    # Min Hour Dom Mon Dow Cmd
    # Min: minute (0~59)
    # Hour: hour (0~23)
    # Dom: date (1~31)
    # Dow: weekday (Mon~Sun)
    # Cmd: command
    
    ## special word
    # *: wildcard
    # ,: seperate many time point, eg. 3,6,9 means 3 o'clock, 6 o'clock and 9 o'clock
    # -: start-end time
    # /n: n is a number, means every n min/hour/...

    ## Remind
    # ┌───────────── 分鐘   (0 - 59)
    # │ ┌─────────── 小時   (0 - 23)
    # │ │ ┌───────── 日     (1 - 31)
    # │ │ │ ┌─────── 月     (1 - 12)
    # │ │ │ │ ┌───── 星期幾 (0 - 7，0 是週日，6 是週六，7 也是週日)
    # │ │ │ │ │
    # * * * * * /path/to/command
    30 08 * * * /home/gtwang/script.sh --your --parameter
    # 每天早上 8 點 30 分執行

    30 18 * * 0 /home/gtwang/script.sh --your --parameter
    # 每週日下午 6 點 30 分執行

    30 18 * * Sun /home/gtwang/script.sh --your --parameter
    # 每週日下午 6 點 30 分執行

    30 08 10 06 * /home/gtwang/script.sh --your --parameter
    # 每年 6 月 10 日早上 8 點 30 分執行

    30 21 1,15,29 * * /home/gtwang/script.sh --your --parameter
    # 每月 1 日、15 日、29 日晚上 9 點 30 分各執行一次

    */10 * * * * /home/gtwang/script.sh --your --parameter
    # 每隔 10 分鐘執行一次

    00 09-18 * * * /home/gtwang/script.sh --your --parameter
    # 從早上 9 點到下午 6 點，凡遇到整點就執行

    @reboot sleep 10; ping 10.98.34.139
    # Run at boot
    ```
