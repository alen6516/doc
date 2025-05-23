# Description

# Overview

# Options
-n SEC
    * interval to execute the command, up to 0.1 sec

-d
    * highlight the difference of output each time

# Example
$ watch "ps aux | grep 'Z'"
    * keep watching if there is a zombie process

$ watch -n 1 '
    echo "command 1"; \
    echo "command 2";'
    * watch multiple commands
