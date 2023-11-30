# Description

# Overview
* Developers implements many 3rd party libraries
* those lib contains .so files and header files
    * as /usr/lib/*.so and /usr/include/*.h

* lib authors can provide *.pc files in /usr/lib/pkgconfig/ for user to know how to compile code with their lib

# Options

# Example
$ pkg-config --exist foo && echo yes
    * check if a lib exists

$ pkg-config --cflags bar
    * tell user how to include header files of bar when compiling

$ pkg-config --libs bar
    * tell user how to find the this lib for linker when compiling
