# Description
Read from stdin and write output to stdout and file

# Overview

# Option
-a FILE
    append to FILE

# Example
$ last | tee last.list | more
    * tee read from stdin and save a copy to file and also write to stdout

$ echo "X11Forwarding yes" | sudo tee -a /etc/ssh/sshd_config
    * `sudo echo "xxx" >> /etc/ssh/sshd_config` will fail, need to use tee
