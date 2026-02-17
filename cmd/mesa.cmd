$ pip3 install meson
$ apt install glslang-tools

* build options
    * -Dgalloum-drivers
        * llvmpipe
            * llvmpipe as Mesa render backend, it uses CPU to render
        * radeonsi
        * d3d12
    * -Dvulkan-drivers
        * amd
    * -Dgallium-va=enabled
    * -Derror=false
    * -Dvideo-codecs=all

* build mesa
    $ meson setup builddir/
    $ meson compile -C builddir/
    $ sudo meson install -C builddir

* build mesa
    $ meson setup build --prefix=/opt/mesa -D gallium-drivers=radeonsi -D video-codecs=vc1dec,h264dec,h264enc,h265dec,h265enc,av1dec,av1enc --buildtype debug
    $ ninja -C build/ install

* run mesa against a local build
    $ meson devenv -C builddir glxinfo
        * this will run the given command against the build in builddir.
        * meson will chdir into the directory first, so any relative paths in the command line will be the relative to builddir
