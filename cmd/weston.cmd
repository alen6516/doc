# Description

# Overview
https://www.mankier.com/5/weston.ini

* build from source (https://gitlab.freedesktop.org/wayland/weston/-/tree/main#building-weston)
    $ sudo apt install libgles2-mesa-dev libsystemd-dev libxcursor-dev libxcb-composite0-dev libx11-xcb-dev freerdp3-dev libpipewire-0.3-dev libva-dev libgbm-dev libgles2 liblcms2-dev libseat-dev libpam0g-dev libwebp-dev libjpeg-dev libcairo2-dev libegl-dev  libinput-dev libxkbcommon-dev libpixman-1-dev libwayland-dev cmake meson
    $ git clone https://gitlab.freedesktop.org/wayland/weston.git
    * if ubuntu's wayland-protocol is too old to build weston, add wayland-protocol.wrap in subprojects with the following content
        ```
        [wrap-file]
        directory = wayland-protocols-1.41
        source_url = https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.41/downloads/wayland-protocols-1.41.tar.xz
        source_filename = wayland-protocols-1.41.tar.xz
        source_hash = 2786b6b1b79965e313f2c289c12075b9ed700d41844810c51afda10ee329576b

        [provide]
        wayland-protocols = wayland_protocols
        ```
    * change subprojects/wayland-protocols-1.41/meson-options.txt tests value to false
    * add /usr/lib/x86_64-linux-gnu/pkgconfig/glesv2.pc with following content
        * we can apt install glesv2 but there is no pc file, need to replace Version with the installed one
        ```
        prefix=/usr
        includedir=${prefix}/include
        libdir=${prefix}/lib/x86_64-linux-gnu

        Name: glesv2
        Description: OpenGL/ES 2.0 Library
        Version: 1.7.0
        Libs: -L${libdir} -lGLESv2
        Cflags: -I${includedir}

        ```
    $ meson build --prefix=/opt/weston/ -Dtests=false -Dremoting=false -Ddemo-clients=false
    * run weston with
        $ LD_LIBRARY_PATH=/opt/weston/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH /opt/weston/bin/weston --idle-time=0

* /usr/share/wayland/wayland.xml
    * shows wayland protocol obj, request and events

# Options

# Example
$ weston --idle-time=0 --log=/home/alan/weston.log
    * --idle-time=0
        * don't auto logout
    * --log
        * print log to file

vi /usr/share/wayland-sessions/weston.desktop
    * append "--idle-time=0" after weston to disable auto logout

* enable underlay MPO
    * need weston after commit 89f77176 (v14.0.2 should be ok)
    * vi ~/.config/weston.ini
        ```
        [core]
        gbm-format=argb8888
        ```
