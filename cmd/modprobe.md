# Description
Show the status of modules in the Linux Kernel

# Overview

# Options
    
# Example
$ modprobe -r amdgpu
	* unload a module (before unload gpu driver, we need to switch to run-level 3 beforehand)

* how to remove a module?
    $ lsmod | grep MODULE
        * get a list in format of "modile size used_by"
    $ sudo modprobe -r DEPENDED_MODULE MODULE
    $ echo -e "blacklist MODULE\n" | sudo tee -a /etc/modprobe.d/blacklist.conf
        * add the module to blacklist to prevent it from loading on next boot
