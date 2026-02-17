# Description
ffmpeg video converter

# Overview
* https://hackmd.io/@kd01/ffmpeg-help
* https://trac.ffmpeg.org/wiki/HWAccelIntro
    * many command example

* build script
    ```
    #!/bin/bash
    ROOT="/home/alan/ffmpeg_builder"
    mkdir $ROOT/bin $ROOT/build/ $ROOT/source
    git clone https://github.com/FFmpeg/FFmpeg.git $ROOT/source/ffmpeg
    cd $ROOT/source/ffmpeg && \
    PATH="$ROOT/bin:$PATH" PKG_CONFIG_PATH="$ROOT/build/lib/pkgconfig" ./configure \
      --prefix="/opt/ffmpeg" \
      --pkg-config-flags="--static" \
      --enable-shared \
      --disable-optimizations \
      --disable-stripping \
      --extra-cflags="-I$ROOT/build/include" \
      --extra-ldflags="-L$ROOT/build/lib" \
      --extra-libs="-lpthread -lm" \
      --ld="g++" \
      --bindir="$ROOT/bin" \
      --enable-gpl \
      --enable-gnutls \
      --enable-libass \
      --enable-libfreetype \
      --enable-libmp3lame \
      --enable-libvorbis \
      --enable-nonfree && \
    PATH="$ROOT/bin:$PATH" make -j`nproc` && \
    sudo make install && \
    hash -r
    ```

* build commands
    $ git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg
    $ cd ffmpeg
    $ ./configure --prefix="/opt/ffmpeg" --enable-debug=3 --disable-optimizations --enable-shared --disable-stripping
    $ make install

# Options
--version
    check version and build config

-pix_fmts
    check format list

-map 0
    map ALL streams(video, audio, subtitle, data) from input to output file

-c:v libx264 <OUTPUT>
    re-encode all video streams with libx264

-c:a copy <OUTPUT>
    don't re-encode all audio streams

-c:a:137 libvorbis <OUTPUT>
    re-encode the 138th audio with libvorbis

-hwaccel <HWACCEL>
    none/auto/vdpau/dxva2/d3d11va/vaapi/qsv
    * use -hwaccels to check the hw acceleeration current ffmpeg build supports

-codecs
    show ffmpeg encoding/decoding capability

-formats
    show support encoding/decoding format

-decoders
    show decoders

-loglevel debug
    * show how decoding processed

-v verbose
    * show how video stream is processed

# Example
$ ffmpeg -i INPUT.mp4 -vf fps=30 OUTPUT.mp4
    * convert frame rate to 30

$ ffmpeg -i filename 2>&1 | sed -n "s/.*, \(.*\) fp.*/\1/p"
    * check the frame rate of a given video

$ ffmpeg -stream_loop 3 -i input.mp4 -c copy output.mp4
    * loopingly repeat 3 times of input video to output video

$ ffmpeg -stream_loop -1 -i input.mp4 -t 300 -c copy output.mp4
    * loopingly extend video duration to 300 sec
    * -stream_loop -1 means looping infinitely
    * -c copy means ffmpeg doesn't re-encode, only cut at keyframes

$ ffmpeg -i input.mp4 -ss 00:05:20 -t 00:10:00 -c:v copy -c:a copy output1.mp4
    * take input.mp4 and cut out 10 minutes from 00:05:20

$ ffmpeg -i input.mp4 -vf "scale=1280:720" output.mp4
    * change resolution

$ ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=noprint_wrappers=1:nokey=1 video.mkv
    * check the codec of a video

$ ffmpeg -i input.mp4 > output.txt 2>&1
    * output to a file

$ ffmpeg -i input.png -pix_fmt yuv420p output.yuv
    * convert png image to yuv raw file

$ ffmpeg -s 1920x1080 -pix_fmt yuv420p -depth 8 -i input.yuv output.png
    * convert yuv raw image file to png file of resoluton 1920x1080
    * -pix_fmt yuv420p: specifies the pixel format for the yuv image
    * -depth 8: 8 bits per channel is common for YUV

$ ffmpeg -i input.mp4 -c:v libx264 -pix_fmt yuv420p output.mp4
    * convert YUV444p video to YUV420p video

$ ffmpeg -framerate 24 -i out/im%3d.png -c:v libx264 -b:v 8M -pix_fmt yuv420p -r 24 out.mp4
    * generate yuv420 h264 video from images
    * if we don't specify yuv420, it will generate yuv444
    * -framerate specifies the input framerate
    * -b:v 8M specifies video bitrate to 8Mbps (typical values: 2M, 5M, 8M, 12M, 20M)
    * -r specifies the output framerate

$ ffmpeg -i input.mp4 -c:v libx264 -crf 14 -preset slow output.mp4
    * -crf 18: constant rate factor 14, which resulting in high bit rate (28 resulting low bit rate)
    * -preset slow: gives better compression efficiency

$ ffmpeg -i HDR.mov -vf zscale=t=linear:npl=100,format=gbrpf32le,zscale=p=bt709,tonemap=tonemap=hable:desat=0,zscale=t=bt709:m=bt709:r=tv,format=yuv420p output.mp4
    * convert 10bpc to 8bpc

$ ffmpeg -hwaccels
    * show all hardware acceleration methods

$ ffmpeg -hwaccel vaapi -i input_video.mp4 -f null -
    * hardware decoding through vaapi

$ ffmpeg -re -hwaccel vaapi -hwaccel_output_format vaapi -i video.mp4 -f null -
    * ask ffmpeg to only do hardware decoding
    * -f null -
        * tells ffmpeg to throw away the output, which is important to avoid additional memory transfers/io operations with saving the output

$ ffmpeg -re -hwaccel vaapi -hwaccel_output_format vaapi -i video.mp4 -vf 'scale_vaapi=format=rgba' -f null -
    * ask ffmpeg to do hardware decoding and post-processing, and throw away output

$ ffmpeg.exe -re -hwaccel d3d11va -hwaccel_output_format d3d11 -i xxx.mp4 -f null -
    * windows cmd command, using MS d3d11va API to decode
    * -hwaccel_output_format will specify the raw data (YUV) format after decoding.

$ ffmpeg -hwaccel dxva2 -hwaccel_output_format dxva2_vld -i input.mkv -c:v av1_amf output.mp4
$ ffmpeg -hwaccel d3d11va -hwaccel_output_format d3d11 -i input.mkv -c:v hevc_amf output.mp4
    * To avoid raw data copy between GPU memory and system memory, use -hwaccel_output_format dxva2_vld when using DX9 and use -hwaccel_output_format d3d11 when using DX11

$ ffmpeg -hwaccel vaapi -hwaccel_output_format vaapi -i video.mp4 -vf 'hwdownload,format=nv12' -frames:v 1000 frame_%04d.png
    * vaapi decode video into png files
    * -frames:v specifying the first N frame to decode

$ ffmpeg -hwaccel vaapi -vaapi_device /dev/dri/renderD128 -i $1 -c:v rawvideo -pix_fmt yuv420p out.yuv
    * hardware decode yuv420 video into yuv420p raw format

$ ffmpeg -hwaccel vaapi -vaapi_device /dev/dri/renderD128 -f rawvideo -pix_fmt yuv420p -s:v 1920x1080 -i $1 -vs 'fps=30, hwupload' -c:v h264_vaapi -bf 0 encode_out.mp4
    * hardware encode yuv420p format into h264 video

$ ffmpeg -loglevel quiet -hwaccel vaapi -hwaccel_device /dev/dri/renderD128 -i $video -vf format=yuv420p -y -f rawvideo - | sha256sum - | awk '{print $1}'
    * decode into yuv raw file and compute the hash
    * -f rawvideo -
        * makes ffmpeg keep outputting to stdout

* decode the last frame of a video
    $frame_count="$(ffprobe -v 0 -select_streams v:0 -count_frames -show_entries stream=nb_read_frames -of csv=p=0 in.mp4)";
    $ ffmpeg -i in.mp4 -filter_complex "select='eq(n,$frame_count)'" -vframes 1 out.jpg
* decode the 2nd to the last frame
    $ ffmpeg -i in.mp4 -filter_complex "select='eq(n,$frame_count-1)'" -vframes 1 out.jpg
* decode first N frames
    $ ffmpeg -hwaccel vaapi -hwaccel_device /dev/dri/renderD128 -i $video -frames:v $N out.jpg
    $ ffmpeg -loglevel quiet -hwaccel vaapi -hwaccel_device /dev/dri/renderD128 -i $video -vf "select='lte(n\,$frame_count)',format=yuv420p" -fps_mode vfr -frames:v $N out.jpg

