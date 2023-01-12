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

$ apt-get source PACKAGE
    * get the source code of package

$ apt-get remove PACKAGE
    * remove a package

$ apt-get autoremove
    * after remove a package, its depencies may still remain, so use this command to clean
    * or add parameter in remove command
        $ apt-get remove PACKAGE --auto-remove

$ apt-get purge PACKAGE
    * even remove the depencies, the configuration file of PACKAGE may still here, so use this command to remove the config
    * or add parameter in autoremove command
        $ apt-get autoremove --purge
    * for packages that has been remove or autoremove but not been purse, one can use the following command to check
        $ dpkg -l | grep ^rc
        $ dpkg -l | grep ^rc | awk '{print $2}'
        * and one can purge them by the following command
                $ apt-get purge `dpkg -l | grep ^rc | awk '{ print $2 }'`

$ apt-file search SUBSTRING-OF-PATH
    * search packages with target path

$ apt build-dep global
    * build the environment for the  compilation of package "global"
    * if fail, make sure you have uncomment lines starting with deb-src in source.list, and do apt update
    
$ apt list tmux*
    * find the package named tmux*
