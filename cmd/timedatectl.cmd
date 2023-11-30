# Description
Replace ntp/ntpdate to control system date and time.
If install ntp/ntpdate, ubuntu will fallback and use ntp/ntpdate

# Overview

* config:
    * /etc/systemd/timesyncd.conf
        * specify the time server as NTP=xxxxx
    * /etc/systemd/timesyncd.conf.d

# Options

    
# Example
$ timedatectl
    * see time and config info

$ sudo timedatectl set-ntp true
    * enable "System clock synchronized"

* set the system clock to arbitrary date and time
    $ sudo timedatectl set-ntp off
    $ sudo date -s "10 JAN 2023 12:00:00"

$ sudo timedatectl set-timezone Asia/Taipei
    
$ systemctl status systemd-timesyncd.service
    * check the status
