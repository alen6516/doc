# Description

# Overview

# Options

# Example
To connect to an Ubuntu 24.04 desktop from a Windows machine using Remote Desktop, you'll need to install and configure XRDP on the Ubuntu machine.
XRDP enables the use of the Remote Desktop Protocol (RDP) for remote access to the Ubuntu desktop.

On the Ubuntu 24.04 machine:
Install XRDP: Open a terminal and run sudo apt install xrdp.
Start and enable the XRDP service:
$ sudo systemctl start xrdp
$ sudo systemctl enable xrdp
(Optional) Allow RDP through the firewall: If you have a firewall enabled, like UFW, you'll need to allow connections on port 3389 (the default RDP port).
$ sudo ufw allow 3389

On the Windows machine:
Open Remote Desktop Connection: Search for "Remote Desktop Connection" in the Windows search bar.
Enter the Ubuntu machine's IP address: In the "Computer" field, type the IP address of your Ubuntu machine.
Connect: Click "Connect" and enter your Ubuntu username and password when prompted.

Troubleshooting:
Firewall: Ensure the firewall on your Ubuntu machine is not blocking the connection.
Port forwarding: If you're connecting from outside your local network, you may need to configure port forwarding on your router.
User account: Make sure the user account you're using to connect has a password set.
XRDP configuration: If you encounter issues, check the XRDP logs in /var/log/xrdp.log for clues.
Network Level Authentication: If you have issues with authentication, try disabling or adjusting Network Level Authentication in the advanced settings of the Remote Desktop Connection client.
