# Description

# Overview
* /etc/apt/source.list stores the source of packages, update it by apt update

* before using apt build-dep, one may need to edit source.list by uncomment lines start with deb-src and do apt update

# Options
    
# Example
$ apt-cache search PACKAGE
    * search package by name, support regex

$ apt-cache show PACKAGE
    * show information of package

$ apt build-dep global
    * build the environment for the  compilation of package "global"
    * if fail, make sure you have uncomment lines starting with deb-src in source.list, and do apt update
    
