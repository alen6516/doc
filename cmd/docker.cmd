# Description

# Overview
* To run docker needs kernel config to support, use check_config.sh to see if current .config support docker or not
    * https://github.com/coreos/docker/blob/master/contrib/check-config.sh

# Install using apt
1. Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

2. Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

3. Install the latest docker version
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

4. Test docker
sudo docker run hello-world
...
Hello from Docker!
This message shows that your installation appears to be working correctly.
...

# Options

# Example
$ docker pull ubuntu:22.04
    * pull ubuntu 22.04 image from docker's hub

$ docker run --name my_ws -itd -v $WS:/ws ubuntu:22.04 /bin/bash
    * mount the directory specified in $WS to the directory /ws in the container

$ docker ps -a
    * list all docker containers

$ docker ps -a -f status=running
    * list running docker containers

$ docker start <CONTAINER_ID>
    * start container by ID

$ docker exec -it my_ws /bin/bash

$ docker stop <CONTAINER_ID>
    * stop container by ID

$ docker rm <CONTAINER_ID>
    * remove the container

$ docker run --rm -it Ubuntu /bin/bash
    * run the container and remove it if it's shut down

$ docker image ls
    * show all docker images

$ docker image rm <IMAGE_ID>
    * remove image by ID

* allow user to execute docker without sudo
    $ sudo groupadd docker
    $ sudo usermod -aG docker $USER
    $ newgrp docker
        * or logout and loging
    $ docker run hello-world
        * check if it take effects
