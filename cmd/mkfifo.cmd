# Description
make FIFOs (named pipes)

# Overview
* creating a named pipes is like creating a file, 2 processes can open the pipe via its name and read/write

# Options

# Example
* create a named pipes to gzip a content
    $ mkfifo my_pipe && gzip -9 -c < my_pipe > out.gz &
    $ cat file > my_pipe

* remove pipe after using
    $ rm my_pipe
