# Description
compare 2 images and generate the diff

# Overview

# Options
 -metric AE
   AE     absolute error count, number of different pixels (-fuzz effected)
   FUZZ   mean color distance
   MAE    mean absolute error (normalized), average channel error distance
   MEPP   mean error per pixel (normalized mean error, normalized peak error)
   MSE    mean error squared, average of the channel error squared
   NCC    normalized cross correlation
   PAE    peak absolute (normalize peak absolute)
   PSNR   peak signal to noise ratio
   RMSE   root mean squared (normalized root mean squared)

# Example
$ compare -compose src A.png B.png diff.png
    * compare A and B and save the image diff to diff.png

$ compare -verbose -metric FUZZ a.png b.png diff.png
    * compare a.png with b.png and generate diff as diff.png
    * also calculate the mean color distance to show the difference mathmatically
