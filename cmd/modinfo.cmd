# Description

# Overview

# Options

# Example
$ modinfo amdgpu | grep mask
    * check config parameters the module support

$ modinfo amdgpu.ko | grep vermagic
    * vermagic:       6.10.0.ko-test.1210.menu.60ee22 SMP preempt mod_unload modversions
    * check the vermagic from a ko on a running kernel, and compare to another ko's vermagic. It is possible to modprobe that ko to the kernel if the vermagic is the same
