# Description
after installing new module, if the module is included in initramfs, we need to update initramfs

# Overview

# Options

    
# Example
$ update-initramfs -c -k `uname -r`
    * update the initramfs image of a specific kernel

$ udpate-initramfs -u
    * update the initramfs image of current kernel

$ lsinitramfs /boot/initrd.img-5.18.0xxxx
    * We can use this command to check if modules are included in a initramfs image
    * if so, then everytime we update the module, we need to update-initramfs
