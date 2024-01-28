# Description

# Overview

# Options

# Example
* edit /etc/ld.so.conf to add the path of new lib
* then use ldconfig to update lib to /etc/ld.so.cache

$ ldconfig -p | grep libxxx
    * find the full path of a lib 
