# Description
Display or manipulate a disk partition table.

# Overview

# Options

# Example
$ sudo fdisk -l /dev/nvme0n1
Disk nvme0n1: 931.51 GiB, 1000204886016 bytes, 1953525168 sectors
Disk model: CT1000P2SSD8
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: D33526C3-10F7-4BC8-933C-586EF2B87398

Device       Start        End    Sectors   Size Type
nvme0n1p1     2048    2099199    2097152     1G EFI System
nvme0n1p2  2099200 1953523711 1951424512 930.5G Linux root (x86-64)

$ sudo fdisk -l /dev/nvme0n1p
nvme0n1p1  nvme0n1p2

$ sudo fdisk -l /dev/nvme0n1p1
Disk nvme0n1p1: 1 GiB, 1073741824 bytes, 2097152 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x00000000

$ sudo fdisk -l /dev/nvme0n1p2
Disk nvme0n1p2: 930.51 GiB, 999129350144 bytes, 1951424512 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes

# init a linux data disk
$ sudo fdisk -l
$ sudo mkfs -t ext4 <DISK_DEVICE>
$ sudo mkdir <DIRECTORY>
$ sudo mount <DISK_DEVICE> <DIRECTORY>
$ df -h

# install img file to a disk
$ sudo umount /media/alan/xxxx
$ zcat win.img.gz | dd of=/dev/sda
