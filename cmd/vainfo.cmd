# Description

# Overview

# Options
-E
    do not interpret backslash escape

# Example
$ vainfo --display drm
$ DISPLAY=:0 vainfo drm
    * check the available HW codec on a GPU

* vainfo doesn't output:
    * if from ssh session
        * export DISPLAY=:0
        * but localhost must have login
    * if localhost is login and in runlevel 3
        * will see "error: can't connect to X server!", but still see vainfo output
        * enter runlevel 5 could solve it

$ vulkaninfo --summary
    * alternative if just want to check mesa version
