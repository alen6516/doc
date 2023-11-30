# Description

# Overview
* Written in Python

* to generate build.ninja file for ninja to build
    * build.ninja is like Makefile

* require ninja to compile

* pip3 install meson
    * meson installed by pip has higher version than installed by apt
* meson installed by apt will be in /usr/bin/meson

# Options

# Example
$ meson build --prefix=$PWD/install/
    * like "configure"
    * create build/ and generate configuration files for compilation
    * --prefix=path/to/install specifies the dir to place to install binaries

$ meson build/ --reconfigure
    * configure again

$ meson build/ --buildtype debug --reconfigure
    * reconfigure with debug symbols
    * buildtype:
        * plain: no extra build flags
        * debug: with debug symbol, no optimization
        * debugoptimized: with debug symbol and optimization
        * release: with optimization, no debug symbol

$ meson build -Dc_args=... -Dcpp_args=... -Dc_link_args=... -Dcpp_link_args=...
    * add gcc flags

$ meson test -C build/
    * run unit tests when they are avaliable

$ DESTDIR=$PWD/install meson install -C build/
    * setup prefix if forgetting it before

$ ninja -C build/ -j`nproc`
    * like "make"
    * -C <dir> means change to <dir> before doing anything else

$ ninja -C build/ install
    * like "make install"
    * build and install binaries to specified place
