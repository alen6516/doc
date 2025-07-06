# Description

# Overview

# Options

# Example
* build kernel with PKGBUILD
    $ git clone https://gitlab.manjaro.org/packages/core/linux69.git
    $ cd linux69
    * edit PKGBUILD to apply patches or change config options
    $ makepkg -s
        * this will download sources, compile the kernel, and create a .pkg.tar.zst package
    $ sudo pacman -U linux66-6.6.X-1-x86_64.pkg.tar.zst
        * manjaro usually auto-regenerate GRUB and initramfs on kernel install using hooks in /etc/mkinitcpio.d
    $ sudo update-grub
