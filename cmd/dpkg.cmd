# Description

# Overview

# Options
    
# Example
$ dpkg -i xxx.deb
    * install deb file

$ dpkg -r xxx && dpkg --purge xxx
    * remove package and all its config files

$ dpkg -l
    * show all package installed, both by apt and pip
    * pip only installs python package, and if the python package is installed by apt (eg. meson), the package will start with python-

$ dpkg -L PACKAGE
    * show files inside a installed package

$ dpkg --search libc.so
    * search the path of the installed package libc.so

$ dpkg -s amd-nonfree-radeon
    * Report status of specified package

$ mkdir tmp && dpkg-deb -R xxx.deb tmp
    * create a folder and unpack a deb package into it

$ sudo dpkg-repack gparted
    * create a .deb file from installed package
