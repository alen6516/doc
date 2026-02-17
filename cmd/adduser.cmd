# Description

# Overview

# Options

# Example
$ sudo adduser alan
    * add the user to sudoer
        $ sudo usermod -aG sudo alan
        $ sudo usermod -aG wheel alan
            * for manjaro
    * make sudo without password
        $ sudo visudo
            * or edit /etc/sudoers
        * %sudo   ALL=(ALL:ALL) NOPASSWD: ALL
