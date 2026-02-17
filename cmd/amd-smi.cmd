# Description
AMD System Management Interface

# Overview
$ sudo pacman -S amdsmi
    * then find /opt/rocm/bin/amd-smi

AMD-SMI Commands:
                      Descriptions:
    version           Display version information
    list              List GPU information
    static            Gets static information about the specified GPU
    firmware (ucode)  Gets firmware information about the specified GPU
    bad-pages         Gets bad page information about the specified GPU
    metric            Gets metric/performance information about the specified GPU
    process           Lists general process information running on the specified GPU
    event             Displays event information for the given GPU
    topology          Displays topology information of the devices
    set               Set options for devices
    reset             Reset options for devices
    monitor (dmon)    Monitor metrics for target devices
    xgmi              Displays xgmi information of the devices
    partition         Displays partition information of the devices
    ras               Retrieve CPER (RAS) entries from the driver


# Options
-h
    * show help message

# Example
