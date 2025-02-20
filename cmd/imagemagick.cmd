# Description

# Overview
* apt install imagemagick

# Options

# Example
$ convert -size 1920x1080 -depth 8 rgba:$image_in $png_out
    * convert raw image file to png
    * we can also run ffmpeg to convert

$ compare -verbose -metric FUZZ A.png B.png diff.png
    * comare to png and save the diff to diff.png
    * -metric
        * AE     absolute error count, number of different pixels (-fuzz effected)
        * FUZZ   mean color distance
        * MAE    mean absolute error (normalized), average channel error distance
        * MEPP   mean error per pixel (normalized mean error, normalized peak error)
        * MSE    mean error squared, average of the channel error squared
        * NCC    normalized cross correlation
        * PAE    peak absolute (normalize peak absolute)
        * PSNR   peak signal to noise ratio
        * RMSE   root mean squared (normalized root mean squared)
