# Description

# Overview

# Options

# Example
$ install -d "linux/boot"
    * same as `mkdir -p linux/boot`

$ install -Dm644 .config "linux/boot/config-${ver}"
    * same as copy, with specifying permission by -Dm644
