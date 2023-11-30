# Description

# Overview
When a shell quits, it sends SIGHUG signal to all its still-running children.
If a process is ran with nohug, nohug will intercepts SIGHUG signal so the process doesn't die.

By default nohug will output to nohug.out to current directory, or $HOME/nohug.out when current directory is not writtable.

Seems systemd will still clearing the still-running process once the user logout,
so either use tmux or systemd-run to make it a service if the linux is systemd-based.

a long disussion between systemd and nohug: https://unix.stackexchange.com/questions/682793/why-background-process-terminated-after-ssh-session-closed

# Options

# Example
$ nohup <Process> &

$ nohup a.sh > a.log 2>&1 &
