# Description

# Overview
* server config is at /etc/sshd_config
* client config is at /etc/ssh_config
* keys are at ~/.ssh/
    * ssh-keygen

# Options
Please note that when you pass the -T to ssh when you wish to disable pseudo-terminal allocation. On the other hand, we can force pseudo-terminal allocation bypassing the -t option to ssh to execute arbitrary screen-based programs on a remote machine, which can be very useful.


# Example
$ ssh user@server "command1; command2"
$ ssh user@server < commands.txt
    * run command through ssh

$ ssh -t user@server sudo command
    * running a command with sudo

$ ssh -T user@server << EOL
    * use Heredoc bash feature to run many commands

$ ssh -T user@server user@server << 'EOL'
    * multi-line command using Heredoc when you need to assign variables

* reverse ssh tunneling
    * on localmachine
        $ ssh -R 9000:localhost:22 user@RemoteServer
    * on RemoteServer
        $ ssh -p 9000 user@localhost

* WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!
    $ ssh-keygen -R <target-ip>
