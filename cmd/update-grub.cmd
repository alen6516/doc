# Description

# Overview
* on ubuntu, update-grub2 is a symbolic link to update-grub
* on arch linux there is no such script, run this instead:
    $ sudo grub-mkconfig -o /boot/grub/grub.cfg

* files
    * /etc/default/grub
        * to config the style of grub menu
    * /boot/grub/grub
        * to check the bootable kernel list (menuentry)

# Options

# Example
