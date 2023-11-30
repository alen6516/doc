# Description
find the share lib's path of a executable

# Overview

# Options

    
# Example
$ ldd --version
    * check the version of glibc of this host

$ ldd `which ls`
    * check the shared lib used by ls existed or not
    * however, this command can not find the shared libs indirectly used by the binary
