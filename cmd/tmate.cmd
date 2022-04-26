# Description

# Overview

* config file
    * tmate use ~/.tmate.conf as the config file. It uses the same tmux syntax. In order to load the ~/.tmux.conf configuration file, add source-file ~/.tmux.conf in the tmate configuration file.

# Options

# Example

* launch with specific socket
    $ tmate -S /tmp/tmate-1000/xxxx

* attach
    $ tmate -S /tmp/tmate-1000/xxxx at

* check session
    $ tmate -S /tmp/tmate-1000/xxxx ls
