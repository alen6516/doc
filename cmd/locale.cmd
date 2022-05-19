# Description

# Overview

# Options

    
# Example
$ locale -a
    * see what language packages we have
    $ sudo apt-get install language-pack-en
        * install english package
    $ locale-gen en_US.UTF-8
        * add english support

$ sudo update-locale LC_TIME=en_US.utf-8
    * or manually revise /etc/default/locale
    * $ export LC_TIME=en_US.UTF-8
        * to let current shell take effect
