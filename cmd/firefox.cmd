# Description

# Overview
* Ubuntu install firefox
    * https://askubuntu.com/questions/1516223/how-to-install-firefox-from-official-mozilla-repository-on-ubuntu-24-04


* how to install different version of firefox?
    * remove old firefox first
        $ sudo apt/snap remove firefox
    * go to Mozilla FTP to download the target version deb
        * https://ftp.mozilla.org/pub/firefox/releases/128.0/linux-x86_64/en-US/
    * $ sudo dpkg -i firefox-xxx.deb

* how to confirm firefox version?
    * check about:support page

* how to enable vaapi hardware acceleration?
    * in about:config page set gfx.webrender.all and media.ffmpeg.vaapi.enabled to true.
        * https://www.reddit.com/r/linux/comments/xcikym/tutorial_how_to_enable_hardware_video/
        * https://discourse.ubuntu.com/t/enabling-accelerated-video-decoding-in-firefox-on-ubuntu-21-04/22081

# Options

# Example
$ firefox https://www.reddit.com/r/interestingasfuck/comments/1d02pt6/hawk_vs_windshield_watch_as_the_hawk_slowly/
