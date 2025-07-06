# This is windows subsystem linux command sheet

$ wsl.exe --list --verbose
    * list all wsl 

* shrink wsl size
    * https://stephenreescarter.net/how-to-shrink-a-wsl2-virtual-disk/

* external ssh to wsl in windows
    * https://blog.darkthread.net/blog/remote-ssh-wsl/
    * enable wsl and install ubuntu
    * enable sshd in wsl ubuntu
    * add port forwarding in windows
        $ netsh interface portproxy add v4tov4 listenaddress=<restricted-IP> listenport=22222 connectaddress=<wsl-IP> connectport=22
    * add firewall rule
        $ netsh advfirewall firewall add rule name="WSL SSH Port" dir=in action=allow protocol=TCP localport=22222 remoteip=any
    * if reboot, we may need to delete and add port forwarding/firewall rule again
        $ netsh interface portproxy delete v4tov4 listenport=22222 listenaddress=<restricted-IP>

