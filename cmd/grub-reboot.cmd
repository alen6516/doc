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
$ grub-reboot "1>2"
$ grub-reboot "Windows Boot Manager (on /dev/nvme0n1p1)"
    * GRUB will boot once into the selected entry, then revert to the default on next boot.
    * variable is stored in /boot/grub/grubenv

$ grub-editenv list
    * will see `next_entry="1>2"`

sudo grub-editenv /boot/grub/grubenv set next_entry="3"
    * manually set variable in grubenv

* how to use grub-reboot to select next-boot kernel
    $ grep "menuentry " /boot/grub/grub.cfg | cut -d"'" -f2
        * see something like:
        ```
        Manjaro Linux
        Manjaro Linux (Kernel: 6.10.12-1-MANJARO)
        Manjaro Linux (Kernel: 6.6.52-1-MANJARO)
        Advanced options for Manjaro Linux>Manjaro Linux (Kernel: 6.10.12-1-MANJARO)
        Advanced options for Manjaro Linux>Manjaro Linux (Kernel: 6.6.52-1-MANJARO)
        ```
    $ sudo grub-reboot "Advanced options for Manjaro Linux>Manjaro Linux (Kernel: 6.6.52-1-MANJARO)"
        * have to copy the exact same string (case sensitive)
    $ sudo reboot
        * only affect the next boot

* set permannent default kernel
    * in /etc/default/grub
        ```
        GRUB_DEFAULT=saved
        ```
    $ sudo grub-set-default "Advanced options for Manjaro Linux>Manjaro Linux (Kernel: 6.6.52-1-MANJARO)"
