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

* how to check the version of libc used by a executable?
    * first check what libc.so is used by this executable
        * $ ldd a.out
            * show libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f56b0240000)
    * check the version of that libc.so
        * $ ll libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f56b0240000)
            * show /lib/x86_64-linux-gnu/libc.so.6 -> libc-2.31.so*
