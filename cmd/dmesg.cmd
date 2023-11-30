# Description

# Overview

# Options

    
# Example
$ dmesg -wH
    * check dmesg output as it changes

$ dmesg -c
    * show dmesg and clear it

$ dmesg -T
    * human readable time format

$ echo "test" > /dev/kmesg
    * write string to dmesg

* new linux distribution needs sudo to print dmesg, we can disable it by:
    $ sysctl -w kernel.dmesg_restrict=0
    * and let it take effect at boot by:
        $ echo kernel.dmesg_restrict=0 | sudo tee -a /etc/sysctl.d/99-dmesg.conf

    * when we build kernel, we can set CONFIG_SECURITY_DMESG_RESTRICT=n in .config to avoid it
