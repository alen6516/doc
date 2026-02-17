# Description
library call tracer, tracing c lib cllas like malloc, free, of a program

# Overview

# Options
-S
    show system calls like strace

-w N
    show N stacks of backtrace

# Example
$ sudo ltrace -l "libdrm*" ./ioctl_test
    * watch calls to libdrm and libdrm_amdgpu
    ```
    Opened /dev/dri/renderD128 (fd: 3)
    ioctl_test->amdgpu_device_initialize(3, 0x7ffd8f371840, 0x7ffd8f371844, 0x7ffd8f371850) = 0
    AMDGPU Device Initialized (Version: 3.64)
    ioctl_test->amdgpu_bo_alloc(0x5565cbd0a720, 0x7ffd8f371860, 0x7ffd8f371858, 0x7ffd8f371860) = 0
    Buffer Allocated (Handle created)
    ioctl_test->amdgpu_bo_free(0x5565cbd0b0c0, 0x5565cbd0a310, 0x7fa5e1e0a790, 0x7fa5e1e0a790) = 0
    Buffer Freed
    ioctl_test->amdgpu_device_deinitialize(0x5565cbd0a720, 0x5565cbd0a310, 0x7fa5e1e0a790, 0x7fa5e1e0a790) = 0
    Closed device
    +++ exited (status 0) +++

    ```

$ sudo ltrace -S -l "libdrm*" -e ioctl ./ioctl_test
    * use -S to show system calls like strace inside the library trace

$ sudo ltrace -w 3 -l "libdrm*" ./ioctl_test
