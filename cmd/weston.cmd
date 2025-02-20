# Description

# Overview
https://www.mankier.com/5/weston.ini

# Options

# Example
$ weston --idle-time=0 --log=/home/alan/weston.log
    * --idle-time=0
        * don't auto logout
    * --log
        * print log to file

vi /usr/share/wayland-sessions/weston.desktop
    * append "--idle-time=0" after weston to disable auto logout
