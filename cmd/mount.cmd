# Description

# Overview

# Options

# Example
* Boot from usb to reset user password
    $ sudo mount /dev/nvme0n1p0 /mnt/myroot     # mount / in the nvme SSD system
    $ sudo chroot /mnt/myroot
    $ passwd $USERNAME
    $ exit
    $ sudo umount /mnt/myroot

* mount a disk connected on usb
    * identify the disk device, usually /dev/sda
    $ sudo fdisk -l /dev/sda2
        * usually sda2 is the linux system
    $ sudo mkdir /mnt/disk
    $ sudo mount /dev/sda2 /mnt/disk
