# Description
command line utility to display information about audio/video files

# Overview

# Options

# Example
$ mediainfo VIDEO.mp4
    * Color space: YUV
        * actually means color model
        * mapping to pix_fmt in ffprobe

$ mediainfo video.mp4 | grep "Bit depth"
    * get pixel bit depth of a video (bpc, bits per channel)
