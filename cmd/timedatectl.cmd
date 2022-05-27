# Description
Replace ntp/ntpdate to control system date and time.
If install ntp/ntpdate, ubuntu will fallback and use ntp/ntpdate

# Overview

* config:
    * /etc/systemd/timesyncd.conf
        * specify the server
    * /etc/systemd/timesyncd.conf.d

# Options

    
# Example
$ timedatectl
    * see time and config info  

$ sudo timedatectl set-ntp true
    * enable "System clock synchronized"

$ systemctl status systemd-timesyncd.service
    * check the status
