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

* no such command on arch system, add by:
    $ sudo echo "grub-mkconfig -o /boot/grub/grub.cfg" > ~/.local/bin/update-grub

# Options

# Example
