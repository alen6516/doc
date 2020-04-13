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


# Options

    
# Example
$ systemctl list units
    * display all units

$ systemctl start/stop/restart/status/kill/reload sshd.service
    * kill: kill sshd and all its child processes
    * reload: reload the configuration of sshd

