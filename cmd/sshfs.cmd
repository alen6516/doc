# Description
SSH file system

# Overview
* To mount a filesystem via ssh:
    * sshfs [user@]host:[dir] mountpoint [options]


# Options
-d
    * show debug info

-o reconnect
    * auto reconnect

-o allow_other
    * alows other local user to r/w the remote folder
    * need this option if local user is different from remote user

-o default_permissions
    * apply the default permission of the remote file system

-p PORT

# Example
$ mkdir remote_disk && sudo sshfs -o reconnect,allow_other USER@HOST:/path/to/folder remote_disk
    * mount remote folder
    * if see "fuse: failed to access mountpoint /home/manjaro/alan/script: Input/output error"
        * run $ fusermount -u /path/to/mountpoint
        * remount

$ sudo fusermount -u remote_disk
$ sudo umount remote_disk
    * unmount
