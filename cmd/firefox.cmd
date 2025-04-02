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

* install firefox-dbg
    * sudo apt install firefox-dbg
        * Get:1 https://ppa.launchpadcontent.net/xtradeb/apps/ubuntu noble/main amd64 firefox amd64 1:136.0+build3-1xtradeb1.2404.1 [75.4 MB]
        * Get:2 https://ppa.launchpadcontent.net/xtradeb/apps/ubuntu noble/main amd64 firefox-dbg amd64 1:136.0+build3-1xtradeb1.2404.1 [475 MB]

* download firefox nightly
    * https://www.mozilla.org/en-US/firefox/all/desktop-nightly/linux64/en-US/
    * has debug info

* check firefox source code
    * https://searchfox.org/mozilla-central/source/

* how to confirm firefox version?
    * check about:support page

* how to enable vaapi hardware acceleration?
    * in about:config page set gfx.webrender.all and media.ffmpeg.vaapi.enabled to true.
        * https://www.reddit.com/r/linux/comments/xcikym/tutorial_how_to_enable_hardware_video/
        * https://discourse.ubuntu.com/t/enabling-accelerated-video-decoding-in-firefox-on-ubuntu-21-04/22081

# Options

# Example
$ firefox https://www.reddit.com/r/interestingasfuck/comments/1d02pt6/hawk_vs_windshield_watch_as_the_hawk_slowly/
