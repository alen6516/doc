# Description

# Overview

- /usr/lib/x86_64-linux-gnu/pkgconfig stores pc files
- when building code with meson it will check pc files to see if lib version meets compilation requirements
- if install new lib package, now we have 2 libxxx in /usr/lib/x86_64.../, so we need to update version in the pc file
- if lib is installed in other path, we can use PKG_CONFIG_PATH to specify the searching path 
    $ export PKG_CONFIG_PATH=/opt/amdgpu/lib/x86_64-linux-gnu/pkgconfig

* Developers implements many 3rd party libraries
* those lib contains .so files and header files
    * as /usr/lib/*.so and /usr/include/*.h

* lib authors can provide *.pc files in /usr/lib/pkgconfig/ for user to know how to compile code with their lib

* how to write .pc files
    * https://www.cntofu.com/book/46/linux_system/ru_he_shi_yongpkg_-_config_gong_ju_bian_yi_lian_ji.md
    * when need to write pc file, first search that file on internet
    * by default .pc files will be installed along with libxxx-dev package rather than libxxx

* path checked from /etc/ld.so.conf.d/x86_64-linux-gnu.conf
    * /usr/local/lib
        * python related stuff
    * /usr/lib/x86_64-linux-gnu
        * main lib

# Options

# Example
$ pkg-config --exist foo && echo yes
    * check if a lib exists

$ pkg-config --cflags bar
    * tell user how to include header files of bar when compiling

$ pkg-config --libs bar
    * tell user how to find the this lib for linker when compiling
