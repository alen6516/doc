# Description
after installing new module, if the module is included in initramfs, we need to update initramfs

# Overview

# Options


# Example
$ update-initramfs -c -k `uname -r`
    * update the initramfs image of a specific kernel

$ update-initramfs -c -k all
    * update the initramfs image for all kernels

$ update-initramfs -u -k "$(uname -r)"
    * update the initramfs image of current kernel

$ update-initramfs -u -k all
    * update the initramfs for all kernels

$ lsinitramfs /boot/initrd.img-5.18.0xxxx
    * We can use this command to check if modules are included in a initramfs image
    * if so, then everytime we update the module, we need to update-initramfs

$ lsinitcpio /boot/initramfs-6.16.0xxxx.img
    * check modules included in a initramfs image

$ mkinitcpio -P
    * regenerate initramfs images based on all existing presets /etc/mkinitcpio.d/linuxXXX.preset

$ mkinitcpio -k 6.x.x-custom -g /boot/initramfs-6.x.x-custom.img
    * mkinitcpio will try to find /usr/lib/modules/6.x.x-custom and generate img
