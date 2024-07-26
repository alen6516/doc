# Description

# Overview
* /etc/apt/source.list stores the source of packages, update it by apt update

* before using apt build-dep, one may need to edit source.list by uncomment lines start with deb-src and do apt update

# Options
--dry-run
    * dry run, not to do anything

# Example
$ apt update
    * update the list of available packages

$ apt upgrade
    * will automatically install but not remove packages

$ apt full-upgrade
    * full-upgrade performs the function of upgrade but will remove currently installed packages if this is needed to upgrade the system as a whole.

$ apt install --only-upgrade <packagename>
    * This will upgrade only that single package, and only if it is installed.

$ apt dist-upgrade
    * will install or remove packages as necessary to complete the upgrade
    * more likely to break software that is performing correctly at current

$ apt do-release-upgrade
    * update to newer ubuntu release

$ apt list --installed
    * list apt installed packages

$ apt search PACKAGE
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
    * build the environment for the compilation of package "global"
    * if fail, make sure you have uncomment lines starting with deb-src in source.list, and do apt update

$ apt list tmux*
    * find the package named tmux*

$ apt show <package>
$ apt-show-versions <package>
    * show package version

$ apt-cache policy <package>
    * show the installed version and candidate version of <package>

* update glic to version 2.32, but ubuntu 20.04 only supports to 2.30
    * add the following line to /etc/apt/sources.lists
        * deb http://th.archive.ubuntu.com/ubuntu jammy main
    * sudo apt update
    * sudo apt install libc6
    * check if now libc supports version 2.32
        * string /lib/x86_64-linux-gnu/lib.so.6

* check recently installed packages by apt-get
    $ grep " install " /var/log/dpkg.log
