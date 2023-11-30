# Description

# Overview
When a shell quits, it sends SIGHUG signal to all its still-running children.
disown is a bash built-on command.
When a process is ran with disown, it simply removes the specified job from Bash's child list, so bash won't try to send SIGHUP at all.

Seems systemd will still clearing the still-running process once the user logout,
so, use tmux or systemd-run to make the process a system service if your linux is sysemd-based.

# Options

# Example
* Using disown to ran a process:
    * While the command is running, use Ctrl-z to stop it
    * and then use bg to put it in the background.
    * Then you’ll use disown %n where n is the job number (jobspec).
        * And, of course, you can find the job number using the jobs command.
    * Run jobs again to verify that the job has been detached — and you can use ps or top to verify that the job is actually still running.
