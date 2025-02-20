# Description

# Overview

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

-no-osc
    * disables all controls, subtitles including their surface

--no-terminal
    * disable mpv's terminal output (but will still see mesa output)

--geometry=50%+20+10
    * resize to 50% of the display, and move window position to (20, 10) from the top left corner
    * weston doesn't support

--vo=help
    * show all supported vo type

# Example
$ mpv file.mp4 --start=540 --frames=1 -o out.png
    * take screenshot at specific timing, --start also accepts percentage

$ mpv file.mp4 --no-audio '--vf=lavfi=[fps=1/60]' -o out%04d.png
    * take screenshot every 60 seconds
