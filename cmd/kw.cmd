# Description
* ref:
    * https://kworkflow.org/tutorials/deploy-kernel.html

# Overview
* install by apt
    $ sudo apt install kworkflow

* install from source
    $ git clone https://github.com/kworkflow/kworkflow.git
    $ cd kworkflow && ./setup.sh -i
        * this command will install kw in ~/.local/
    $ export PATH=$HOME/.local/bin:$PATH
    $ kw init

# Options

* config
    $ kw config --show

* config-manager
    $ kw kernel-config-manager --save <name> -d <description>
    $ kw kernel-config-manager --list
    $ kw kernel-config-manager --get <label>
        * apply which .config you save

* deploy
    $ kw deploy --local
        * deploy to local machine

    $ kw deploy --remote <remote-ip>

# Example
* step:
    $ kw remote --list
        * check current remote list
    $ kw remote --add <name> root@<target-ip>
        * add target
    $ kw remote --set-default=<name>
        * set target as deploy target
    * On target machine:
        * enable root ssh login
            * add `PermitRootLogin yes` to /etc/ssh/sshd_config and restart ssh service
        * confirm we can switch to root on target
    $ ssh-copy-id root@<target-ip>
        * allow root to login target without password
    $ kw ssh
        * confirm we can root ssh to target
    $ kw deploy --setup
        * for the 1st time, configure the target
    $ kw config deploy.reboot_after_deploy no
        * don't reboot after deploy
    $ kw bd
        * build and deploy to target
    $ kw d
        * only deploy
