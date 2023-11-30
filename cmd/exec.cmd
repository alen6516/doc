# Description

# Overview
* exec will replace the current bash process with the command, so after completion it won't return to bash

* typically when we run a command on bash, after completion the call will return to bash
    * bash will fork itself and execs in the fork

* in a shell script, all command after exec won't be executed

# Options

# Example
