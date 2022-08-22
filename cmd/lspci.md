# Description
Show devices on pci bus

# Overview

# Options
    
# Example
$ lspci -k | grep -EA3 'VGA|3D|Display'
    * find the display driver in use
    * see amdgpu
    * see device code 1002:1506

$ sudo lspci -vvv -d 1002:1506
