# Description
A command line based disk manager

# Overview

# Options

# Example
* after installing a new SSD on windows, we need to partition and mount it
    * open cmd as admin and run diskpart
        $ diskpart
    * clear data
        $ list disk
        $ select disk N
        $ clean
            * clear all data
    * create partition
        $ select disk N
        $ create partition primary size=122880
            * size is MB, optional
        $ format fs=ntfs quick
    * active a partition
        $ list partition
        $ select partition N
        $ active
    * mount
        $ list volumn
        $ select volumn N
        $ assign
