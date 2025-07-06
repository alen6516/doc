# Description
* On manjora or arch linux, we use pacman instead of apt
* https://wiki.archlinux.org/title/Pacman/Rosetta

# Overview

# Options

# Example
$ sudo pacman -Sy
    * apt update

$ sudo pacman -S xxx
    * apt install xxx

$ sudo pacman -Ss xxx
    * apt search xxx

$ sudo pacman -R xxx
    * remove xxx

$ sudo pacman -Rs xxx
    * remove xxx and its dependencies (which are not used by others)

* install deb file by pacman
    $ git clone https://github.com/helixarch/debtap.git && cd debtap
    $ sudo ./debtap -U
    $ ./debtap xxx.deb
        * xxx.pkg.tar.zst file will be generated
    $ sudo pacman -U xxx.pkg.tar.zst

$ sudo pacman -U --noconfirm your-package.pkg.tar.zst
    * install *.pkg.tar.zst

$ pacman -Qe
    * list all explicitly installed packages

$ pacman -Qn
    * list all explicitly installed native packages (present in the sync database)
