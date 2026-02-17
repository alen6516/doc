# Description

# Overview

# Options

# Example
$ vmtouch /path/to/file_or_directory
    * reports how many pages of a given file or directory are currently resident in memory (cached).

$ vmtouch -t /path/to/file_or_directory
    * forces the system to load the contents of a file or directory into the file system cache.
    * beneficial for frequently accessed files

$ vmtouch -e /path/to/file_or_directory
    * evict option remvoes the mapped pages of a file from the file system cache, freeing up memory.

$ vmtouch -l /path/to/file_or_directory
    * locking file's pages into physical memory, preventing the OS from evicting them.
    * this ensures critical data remains in RAM for consistent access.

$ vmtouch -v /path/to/file_or_directory
    * verify if it is still cached.
