# Description
ref: https://www.cnblogs.com/HByang/p/17957747

# Overview
* install
    $ sudo pacman -S cpupower

* start
    $ systemctl enable cpupower.service
    $ systemctl start cpupower.service

* common CPU mode:
    * powersave:    keep at lowest freq
    * userspace:    apply user-specified freq
    * ondemand:     default mode, when there is computing job, freq will be raised to max
    * conservative: auto adjust freq on demand, not always raised to max
    * performance:  always max freq

# Options

# Example
$ cpupower
    * show help

$ cpupower frequency-info
$ cpupower frequency-set

$ cpufreq-info -c 0
    * show specific core

$ cpufreq-info -f
    * check cpu current freq

$ cpufreq-info -p
    * show cpu current min, max freq and mode

$ cpufreq-info -g
    * show all modes cpu support

$ cpufreq-set -g powersave
    * set cpu mode

$ cpufreq-set -c 0 -f 4.1GHz
    * set specific cpu freq

$ cpufreq-set -c 0 -d 2GHz
    * set specific cpu min freq

$ cpufreq-set -c 0 -u 4.1GHz
    * set specific cpu max freq
