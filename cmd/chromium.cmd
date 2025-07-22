# Description

# Overview
* install
    * https://askubuntu.com/questions/1511625/how-to-install-chromium-browser-without-snap-or-flatpak-in-ubuntu-24-04
    $ sudo add-apt-repository ppa:xtradeb/apps -y
    $ sudo apt update
    $ sudo apt install chromium
    * will install chromium from here https://xtradeb.net/apps/chromium/#lp-package-details
        * this web also provides dbg build

* download for windows version
    * https://chromium.woolyss.com/download/zh-tw
    * https://chromium.woolyss.com

* chromium code search
    * https://source.chromium.org/chromium

* build
    * ref
        * https://chromium.googlesource.com/chromium/src/+/refs/heads/main/docs/gpu/vaapi.md#VaAPI-on-Linux
            * build argument and how to confirm vaapi works
        * https://chromium.googlesource.com/chromium/src/+/main/docs/linux/build_instructions.md
            * overall build guide
    * install package
        (ubuntu 22.04+) $ sudo apt install build-essential git python3 clang libnss3-dev libatk-bridge2.0-dev libgtk-3-dev libgbm-dev libdrm-dev libva-dev libvulkan-dev libxkbcommon-dev libpci-dev
        (Arch Linux) $ sudo pacman -S base-devel git python3 clang gtk3 nss libva vulkan-headers libxkbcommon libdrm
    * Clone depot_tools and put it in your $PATH
        $ git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
        $ export PATH="$PWD/depot_tools:$PATH"
    * download src (several GB)
        $ mkdir chromium && cd chromium
        $ fetch --nohooks chromium
        $ cd src
    * sync third-party code
        $ gclient sync
    * install dep
        $ ./build/install-build-deps.sh
    * edit build argu
        $ gn args out/Release
            ```
            # Enable VA-API on Linux
            use_vaapi = true
            enable_vaapi = true

            # Enable proprietary codecs like H.264, AAC
            proprietary_codecs = true
            ffmpeg_branding = "Chrome"

            # Enable hardware video decoding (VA-API needs runtime flags too)
            enable_platform_hevc = true
            enable_platform_h264 = true

            # Build optimizations
            is_component_build = false
            is_debug = false

            # (Optional) Vulkan, ANGLE, Wayland
            use_ozone = true
            ozone_platform_wayland = true
            # ozone_platforms = "wayland"   # wayland-only build
            use_vulkan = true               # Vulkan-based rendering
            enable_vulkan = true            # Vulkan-based rendering
            ```
            * proprietary_codecs = true → enables H.264, AAC, MP3.
            * ffmpeg_branding = "Chrome" → builds Chromium's full FFmpeg support instead of the limited "Chromium" branding.
            * use_vaapi = true, enable_vaapi = true → compiles VA-API support.
    * build (2 hours)
        $ autoninja -C out/Release chrome
    * run
        $ out/Release/chrome --ozone-platform=wayland \
          --enable-features=VaapiVideoDecoder,VaapiIgnoreDriverChecks,AcceleratedVideoDecodeLinuxZeroCopyGL,AcceleratedVideoDecodeLinuxGL \
          --enable-zero-copy --enable-gpu-memory-buffer-video-frames --enable-native-gpu-memory-buffers


# Options
* in chrome://gpu
    * check if hardware decoding is enabled

* play a video, in chrome://media-internals
    * kVideoDecoderName shows the decoder name
        * if software decoding, decoder is FFmpegVideoDecoder, using chromium built-in ffmpeg
        * if hardware decoding, decoder is VaapiVideoDecoder, chromium's media pipeline calls vaapi without using ffmpeg
            * it's chromium's own internal vaapi-based hardware decoder (media/gpu/vaapi)
    * video_decoder
        * if it's MojoVideoDecoder or GpuVideoDecoder, Chrome is using hardware acceleration.

* ref
    * https://github.com/StaZhu/enable-chromium-hevc-hardware-decoding/issues/74

# Example
