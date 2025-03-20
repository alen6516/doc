# Description

# Overview

# Options
-E
    do not interpret backslash escape

# Example
$ ffprobe -v error -show_streams video.mp4
    * pix_fmt=yuv420p
        * pixel format is the combination of color model and chroma subsampling
    * pix_fmt=yuv420p10le
        * combination of color model, chroma subsampling, bit depth and component interleaving
    * color_range=tv
    * color_space=bt2020nc
    * color_transfer=smpte2084
    * color_primaries=bt2020

<<<<<<< Updated upstream
$ ffprobe -v 0 -select_streams v:0 -count_frames -show_entries stream=nb_read_frames -of csv=p=0 in.mp4
    * calculate how many frames in a video
=======
$ ffprobe -i video.mp4 -show_frames
    * show each frame information including frame type (I/P/B frame)
>>>>>>> Stashed changes
