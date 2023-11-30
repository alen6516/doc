# Description

# Overview
* On linux we have 2 kinds of clock:
    * system clock: OS maintained clock, sync with NTPD server
    * hardware clock: bios clock, kept by CMOS battery
* Usually, the hardware clock will get synchronized to the system time whenever the computer is powered off

# Options

# Example
$ sudo hwclock --systohc
    * set hw clock by the system clock

$ sudo hwclock --hctosys
    * set system clock by the hw clock
