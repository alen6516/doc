# Description

# Overview

# Options
Check configure file to see what option we can use, eg.
$ ./configure \
  --prefix="$HOME/build" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I$HOME/xxx/src/include" \
  --ld="g++" \
  ...


# Example
$ ./configuration
    * check if pre-requesite is satisfied
    * modify the Makefile according to the outcome
    * don't run as root

$ make
    * compile as per defined in Makefile
    * don't run as root
