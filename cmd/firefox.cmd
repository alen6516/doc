# Description
* https://firefox-source-docs.mozilla.org/contributing/contribution_quickref.html
    * how to setup env for developing firefox
* firefox process model
    * https://firefox-source-docs.mozilla.org/dom/ipc/process_model.html
* firefox rendering overview
    * https://firefox-source-docs.mozilla.org/gfx/RenderingOverview.html
* build firefox on linux
    * https://firefox-source-docs.mozilla.org/setup/linux_build.html
* how to debug firefox
    * https://fedoraproject.org/wiki/How_to_debug_Firefox_problems
    * how to test with nightly, how to use mozregression

# Overview
* Ubuntu install firefox
    * https://askubuntu.com/questions/1516223/how-to-install-firefox-from-official-mozilla-repository-on-ubuntu-24-04


* how to install different version of firefox?
    * remove old firefox first
        $ sudo apt/snap remove firefox
    * go to Mozilla FTP to download the target version deb
        * https://ftp.mozilla.org/pub/firefox/releases/128.0/linux-x86_64/en-US/
        * https://ftp.mozilla.org/pub/firefox/nightly/2025/04/2025-04-27-08-59-21-mozilla-central/
            * for v1390a1 nightly
        * https://ftp.mozilla.org/pub/firefox/nightly/2025/05/2025-05-18-22-00-19-mozilla-central/firefox-140.0a1.en-US.linux-x86_64.tar.xz
            * for v140.0a1 nightly
    * $ sudo dpkg -i firefox-xxx.deb

* install firefox-dbg
    * sudo apt install firefox-dbg
        * Get:1 https://ppa.launchpadcontent.net/xtradeb/apps/ubuntu noble/main amd64 firefox amd64 1:136.0+build3-1xtradeb1.2404.1 [75.4 MB]
        * Get:2 https://ppa.launchpadcontent.net/xtradeb/apps/ubuntu noble/main amd64 firefox-dbg amd64 1:136.0+build3-1xtradeb1.2404.1 [475 MB]

* download firefox nightly
    * https://fedoraproject.org/wiki/How_to_debug_Firefox_problems#Testing_Mozilla_Nightly_binaries
    * https://www.mozilla.org/en-US/firefox/all/desktop-nightly/linux64/en-US/
    * has debug info

* firefox code search
    * https://searchfox.org/mozilla-central/source/

* first clone firefox
    * install mercurial
        $ sudo apt install mercurial
    $ hg clone https://hg.mozilla.org/mozilla-unified firefox
    $ cd firefox
    $ ./mach bootstrap
        * clone code
    * find the target commit
        $ hg log -k "bugID"
            * git log --grep="bugID"
        $ hg update -r 868861
            * git checkout <commit>
        $ hg log -r . -p
            * git show HEAD
    $ ./mach build

* clone firefox with git (may lag behind)
    $ git clone https://github.com/mozilla/gecko-dev.git firefox
    $ cd firefox
    $ git pull origin main

* build firefox
    * verify firefox version
        $ cat browser/config/version.txt
    * bootstrap (install required dep)
        $ ./mach bootstrap
    * pull changes
        $ hg pull --update
    * add moz_config with this content in firefox root dir
        ```
        # Include the default Firefox configuration
        . $topsrcdir/browser/config/mozconfig

        # Enable debug symbols (-g) and internal consistency checks
        ac_add_options --enable-debug

        # Disable compiler optimizations for a better debugging experience
        # This makes the build slower to run, but much easier to debug in GDB
        ac_add_options --disable-optimize
        ac_add_options --without-wasm-sandboxed-libraries   # avoid build error
        ac_add_options --disable-tests                      # avoid build error
        ac_add_options --disable-unified-build              # makes smaller debug obj for GDB

        ```
    * if source code hasn't been updated for a while, make sure running
        $ ./mach clobber
    * (optional) Generate compile_commands.json
        * even without building firefox, we can generate compile_commands.json to use
        $ ./mach configuration
        $ ./mach build-backend --backend=CompileDB
        $ ln -s obj-x86_64-pc-linux-gnu/compile_commands.json compile_commands.json
    * build
        $ ./mach build
    * run
        $ ./mach run

* firefox add log
    * https://firefox-source-docs.mozilla.org/xpcom/logging.html

* how to confirm firefox version?
    * check about:support page

* how to enable vaapi hardware acceleration?
    * in about:config page set gfx.webrender.all and media.ffmpeg.vaapi.enabled to true.
        * https://www.reddit.com/r/linux/comments/xcikym/tutorial_how_to_enable_hardware_video/
        * https://discourse.ubuntu.com/t/enabling-accelerated-video-decoding-in-firefox-on-ubuntu-21-04/22081

# Options
* in about:config page
    * WebRender
        * use GPU to replace CPU rendering
        * see https://www.geeksforgeeks.org/webrender-tabs-in-mozilla-firefox-browser/
    * gfx.wayland.hdr
        * firefox don't support HDR color even enable gfx.wayland.hdr=1, it enables HDR mode and offload to compositor who can handle HDR color
    * zero-copy
        * 2: default
        * 1: enable
        * 0: disable

* in about:support page
    * check version and runtime config

* in about:logging page
    * choose logging module

* in about:profiles page
    * check available profiles and current profile

* command options
    * --no-remote
        * allows users to open a new separate instance of firefox, or firefox will open a new tab if there is already a firefox instance running
    * -P <profile_name>
    * --profile path/to/profile
        * open firefox instance with a specific profile

* firefox profiler
    * https://profiler.firefox.com/docs/#/

# Example
$ firefox https://www.reddit.com/r/interestingasfuck/comments/1d02pt6/hawk_vs_windshield_watch_as_the_hawk_slowly/

$ WAYLAND_DISPLAY=wayland-1 mesa_glthread=false MOZ_LOG="Dmabuf:5 FFmpegVideo:5" $firefox -no-remote
    * mesa_glthread=false
        * disables Mesa's threaded OpenGL dispatcher
        * mesa_glthread=true by default, which can improve performance in some apps by moving GL calls to a separate thread

$ MOZ_LOG="DMABuf:5,DMABufSurface:5,WaylandDMABuf:5,Dmabuf:5" MOZ_LOG_FILE=firefox-dmabuf.log
