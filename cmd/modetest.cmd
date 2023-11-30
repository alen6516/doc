# Description

# Overview
* Need to reboot after installing this command
* Source code is avaliable at https://gitlab.freedesktop.org/mesa/drm, under the tests folder.
    * sometimes modetest download by apt is broken, we can clone the src code and build
    $ git clone https://gitlab.freedesktop.org/mesa/drm.git
    $ meson build
    $ ninja -C build
    $ ./build/tests/modetest/modetest
* Modetest is also available in ChromeOS under the folder src/third_party/libdrm/tests/.

# Options
-M module
    use the given driver

-a
    use atomic API

-c
    list connectors

-e
    list encoders

-f
    list framebuffers

-p
    list CRTCs and planes (pipes)

-C
    test hw cursor

-v
    test vsynced page flipping

-w <obj_id>:<prop_name>:<value>
    set property
    
# Example
$ modetest -M amdgpu

$ modetest -M amdgpu | cut -f1 | grep -E ^[0-9A-Z]\|id
    * find id of each component

$ modetest -p
    * list CRTCs and planes (pipes)

$ modetest -M amdgpu -w <obj-id>:<prop_name>:<value>
    * set property

$ modetest -M amdgpu -a -s <connector-id>@<crtc-id>:1920x1080
    * set a mode
