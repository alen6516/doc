
* build options
    * -Dgalloum-drivers
        * llvmpipe
            * llvmpipe as Mesa render backend, it uses CPU to render

* build mesa
    $ meson setup builddir/
    $ meson compile -C builddir/
    $ sudo meson install -C builddir

* run mesa against a local build
    $ meson devenv -C builddir glxinfo
        * this will run the given command against the build in builddir.
        * meson will chdir into the directory first, so any relative paths in the command line will be the relative to builddir
