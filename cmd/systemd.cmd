# Description

# Overview
* systemd is not a command but a set of commands
    * systemctl: manage system service
    * systemd-analyze: check time consume when booting
    * hostnamectl: display host information
    * localectl: display locale setting
    * timedatectl: display time-zone setting
    * loginctl: display currently loggined users

* unit
    * in systemd, unit means different resources that could be managed by systemd
    * have different types:
        * service
        * socket
        * target
        * path
        * snapshot
        * timer


# Options

    
# Example
$ systemctl list-units
    * display all units
    * --all
        * display all active & inactive units
    * --state=inactive
        * display all inactive serivces
    * --type=service
        * display service

$ systemctl list-denpendencies sshd.service
    * show dependencies

$ systemctl cat sshd.service
    * show internal config file

$ systemctl show sshd.service
    * show config value

$ systemctl start/stop/restart/status/kill/reload sshd.service
    * kill: kill sshd and all its child processes
    * reload: reload the configuration of sshd

$ systemctl restart sshd.service
    * restart ssh

$ systemctl restart networking/network-manager
    * restart network of ubuntu server/desktop

$ sudo systemd-resolve --flush-caches
    * clear dns cache in the system
    * if command not found, use this instead
        $ resolvectl flush-caches
