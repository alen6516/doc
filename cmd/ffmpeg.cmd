# Description
ffmpeg video converter

# Overview

# Options

# Example
$ ffmpeg -i INPUT.mp4 -vf fps=30 OUTPUT.mp4
    * convert frame rate to 30

$ ffmpeg -i filename 2>&1 | sed -n "s/.*, \(.*\) fp.*/\1/p"
    * check the frame rate of a given video

$ ffmpeg -stream_loop 3 -i input.mp4 -c copy output.mp4
    * loopingly repeat 3 times of input video to output video
