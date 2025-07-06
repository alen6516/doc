# install .img.gz file to a disk
$ sudo umount /media/alan/xxxx
    * need to umount the disk in use
$ zcat win.img.gz | dd of=/dev/sda
    * confirm /dev/sda is the target disk

# install .img file to a disk
$ dd if=/dev/backup.img of=/dev/sda bs=4M status=progress oflag=sync
