# Description

# Overview
* before using weston, we need to enable wayland
    * sudo vi /etc/gdm3/custom.conf
        * comment out WaylandEnable=false

* weston.ini (configuration file for weston)
    * https://www.mankier.com/5/weston.ini
    ```
    [shell]
    panel-position=none     # don't show the top toolbar

    [core]
    gbm-format=argb8888     # change the default pixel format to argb, currently it defaults to xrgb
    ```

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
    $ ninja -C build/
    * run weston with
        $ LD_LIBRARY_PATH=/opt/weston/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH /opt/weston/bin/weston --idle-time=0

* /usr/share/wayland/wayland.xml
    * shows wayland protocol obj, request and events

* shortcut
    * logout GUI
        * Ctrl+Alt+Backspace

* lightdm auto login weston at boot
    * vi /etc/lightdm/lightdm.conf
    ```
    [SeatDefaults]
    autologin-user=alan
    autologin-user-timeout=0   <== this
    user-session=ubuntu

    #Uncomment the following, if running Unity
    #greeter-session=unity-greeter
    ```

# Options
--idle-time=0
    * don't auto logout

--shell="kiosk-shell.so"
    * Weston’s kiosk-shell is a simple shell targeted at single-app/kiosk use cases. It makes all top-level application windows fullscreen, and supports defining which applications to place on particular outputs.
    * run weston without the toolbar at the top and change the background to black

--use-pixman
    * use pixman renderer

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
        * change the default pixel format to argb, currently it defaults to xrgb
        ```
        [core]
        gbm-format=argb8888
        ```

* run program on desktop start
    * https://unix.stackexchange.com/questions/495243/weston-run-program-on-desktop-start
    * add [autolaunch] part in weston.ini
