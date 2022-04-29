# Description

# Overview
date +format

# Options
## format
%D
    date; same as %m/%d/%y
%H
    hour (00..23)
%M
    minute (00..59)
%S
    second (00..60)
%s
    seconds since 1970-01-01 00:00:00 UTC
    
    
# Example
$ date +%H:%M:%S

* change format of date from Chinese to English
    $ sudo localectl set-locale LC_TIME=en_US.UTF-8
    * or edit /etc/default/locale
