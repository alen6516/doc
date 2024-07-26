# Description
ffmpeg video converter

# Overview
* https://hackmd.io/@kd01/ffmpeg-help

# Options
--version
    check version and build config

-map 0
    map ALL streams(video, audio, subtitle, data) from input to output file

-c:v libx264 <OUTPUT>
    re-encode all video streams with libx264

-c:a copy <OUTPUT>
    don't re-encode all audio streams

-c:a:137 libvorbis <OUTPUT>
    re-encode the 138th audio with libvorbis

# Example
$ ffmpeg -i INPUT.mp4 -vf fps=30 OUTPUT.mp4
    * convert frame rate to 30

$ ffmpeg -i filename 2>&1 | sed -n "s/.*, \(.*\) fp.*/\1/p"
    * check the frame rate of a given video

$ ffmpeg -stream_loop 3 -i input.mp4 -c copy output.mp4
    * loopingly repeat 3 times of input video to output video

$ ffmpeg -i input.mp4 -ss 00:05:20 -t 00:10:00 -c:v copy -c:a copy output1.mp4
    * take input.mp4 and cut out 10 minutes from 00:05:20

$ ffmpeg -i input.mp4 -vf "scale=1280:720" output.mp4
    * change resolution

$ ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=noprint_wrappers=1:nokey=1 video.mkv
    * check the codec of a video

$ ffmpeg -i input.mp4 > output.txt 2>&1
    * output to a file

$ ffmpeg -i input.mp4 -c:v libx264 -pix_fmt yuv420p output.mp4
    * convert YUV444p to YUV420p

$ ffmpeg -i HDR.mov -vf zscale=t=linear:npl=100,format=gbrpf32le,zscale=p=bt709,tonemap=tonemap=hable:desat=0,zscale=t=bt709:m=bt709:r=tv,format=yuv420p output.mp4
    * convert 10bpc to 8bpc

$ ffmpeg -hwaccels
    * show all hardware acceleration methods

$ ffmpeg -re -hwaccel vaapi -hwaccel_output_format vaapi -i bbb_1080p_30fps.mp4 -f null -
    * ask ffmpeg to only do hardware decoding
    * -f null -
        * tells ffmpeg to throw away the output, which is important to avoid additional memory transfers/io operations with saving the output
