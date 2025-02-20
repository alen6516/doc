# Description

# Overview

# Options
-b -NUM
    * show last Nth boot journal

-u SERVICE
    * show journal of specific service

-k
    * show kernel message

-p LEVEL
    * show specific log level
        * 0: emergency
        * 1: alert
        * 2: critical
        * 3: error
        * 4: warning
        * 5: notice
        * 6: info
        * 7: debug

# Example
$ sudo journalctl -k -o short-monotonic
    * capture whole dmesg logs

$ sudo journalctl --list-boots
    * show all-time boot list. 0 means current boot, -1 means last boot, ...

$ sudo journalctl -k -o short-monotonic -b -1
    * capture whole dmesg logs during last bootup
