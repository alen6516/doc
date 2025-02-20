# Description
Configure kernel parameters at runtime

# Overview

# Options
-p[FILE], --load[=FILE]
    Load in sysctl settings from the file specified or /etc/sysctl.conf if none given.
    
# Example
$ sysctl -a
    * show all kernel parameters

$ sysctl -p
    * load the new configuration after modifying /etc/sysctl.conf

$ sysctl -w net.ipv4.conf.all.rp_filter=0
    * write config to memory right away
    * to permanently change the config, edit /etc/sysctl.conf
