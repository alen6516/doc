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

* /sys/class/drm/renderD128
    * it is a soft link pointing to ../../devices/pci0000:00/0000:00:08.1/0000:c2:00.0/drm/renderD128
    * renderD128 is a render node for 3D, codec, CUDA/OpenCL, but not for mode-setting
    * 0000:c2:00.0 is the physical address on PCI bus
        $ lspci -s c2:00.0
    * 0000:00:08.11 is the BDF (Domain:Bus:Device:Function) of the device on PCI bus
        * a physical device may contain multiple logical devices, e.g. .0 for 3D shader, .1 for audio
