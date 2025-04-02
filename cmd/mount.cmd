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
