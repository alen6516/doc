# Description

# Overview
* build
    $ git clone https://github.com/mpv-player/mpv.git
    $ cd mpv && mkdir -p subprojects && git clone https://code.videolan.org/videolan/libplacebo.git --depth=1 --recursive subprojects/libplacebo
    $ meson setup build
    $ meson compile -C build

* troubleshoot
    * See "Error opening/initializing the selected video_out (--vo) device." when running mpv
        * make sure you export WAYLAND_DISPLAY=wayland-0
        * make sure you see "wayland   : YES" like this when you run "$ meson setup build"
            * if not, check meson.build and install required packages to support mpv wayland feature

    * See "Option gpu-context: 'drm' isn't supported." when running mpv with option "--gpu-context=drm" in text mode
        * make sure you installed libgbm-dev before building mpv.

    * Latest MPV usually requires to link latest ffmpeg libs (libavcodec.so… etc) at build time. In this case we need to build latest ffmpeg lib first and specify PKG_CONFIG_PATH, for example:
        $ PKG_CONFIG_PATH=/opt/ffmpeg/lib/pkgconfig meson setup build
        $ meson compile -C build

# Shortcut
s
    screenshot

# Options
ref: https://github.com/dyphire/mpv-config/blob/master/mpv.conf

--version
    check the version of lib

--fs
    fullscreen extension

--loop-file
    looping video

--autofil=100%x480
    resize to 480p

--log-file=log.txt
    mpv log file

--no-osc
    * disables all controls, subtitles including their surface
    * prevents mpv's UI from showing up

--no-terminal
    * disable mpv's terminal output (but will still see mesa output)
    * prevents playback information from being printed in the terminal, which would use gfx rendering.

--geometry=50%+20+10
    * resize to 50% of the display, and move window position to (20, 10) from the top left corner
    * weston doesn't support

--vo=help
    * show all supported vo type

--msg-level=vo=debug
--msg-level=cplayer=trace

--icc-profile
    * to make mpv code go to gl_lcms_get_lut3d(), need
    * apt install liblcms2-dev
    * after meson setup build, make sure see "Dependency lcms2 found: YES"
    * run mpv with --gpu-dumb-mode=yes --icc-profile=xxx

--mute=yes
--osc=no
--terminal=no
    * mute, no osc, no terminal

# Example
$ mpv file.mp4 --start=540 --frames=1 -o out.png
    * take screenshot at specific timing, --start also accepts percentage

$ mpv file.mp4 --no-audio '--vf=lavfi=[fps=1/60]' -o out%04d.png
    * take screenshot every 60 seconds

$ mpv --hwdec=vaapi --hwcodec=all --no-terminal --no-osc --gpu-dumb-mode=yes --vo=dmabuf-wayland ${video}
    * generally to avoid GFX usage, we need --no-termonal --no-osc --gpu-dumb-mode=yes --vo=dmabuf-wayland
