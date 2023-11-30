# Description
* When we run any commands or programs in the Linux shells, it records the location of the binary of these commands in a hash table.
* One benefit it provides is that the shell doesn’t have to resolve the location again using the PATH variable on subsequent invocation of the same command.

# Overview

# Options

# Example
$ hash -r
    * reset the hash table, so bash will search through $PATH to find a command next

$ hash -p /usr/bin/date another_date
    * manually set the path for an non-existent command

$ hash -d meson
    * clear an entry of the cache
    * we can check if the command is hashed first
        $ type meson
        > meson is /usr/bin/meson
