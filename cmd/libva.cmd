* build
    $ git clone https://github.com/intel/libva.git
    $ cd libva
    $ meson setup build --prefix=/opt/libva --buildtype debug
    $ ninja -C build/ install

* config
    * in /etc/libva.conf
        * comment out LIBVA_MESSAGING_LEVEL=1 to see libva log
