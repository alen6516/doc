# Description

# Overview
* install
    * https://askubuntu.com/questions/1511625/how-to-install-chromium-browser-without-snap-or-flatpak-in-ubuntu-24-04
    $ sudo add-apt-repository ppa:xtradeb/apps -y
    $ sudo apt update
    $ sudo apt install chromium

* download for windows version
    * https://chromium.woolyss.com/download/zh-tw
    * https://chromium.woolyss.com

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
