# Description
Show devices on pci bus

# Overview

# Options
    
# Example
$ lspci -k | grep -EA3 'VGA|3D|Display'
    * find the display driver in use
    * see amdgpu
    * see device code 1002:1506
    * gpu used to be a pci device, so we can use lspci to find its driver

$ sudo lspci -vvv -d 1002:1506
