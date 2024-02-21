# Description

# Overview
* To run docker needs kernel config to support, use check_config.sh to see if current .config support docker or not
    * https://github.com/coreos/docker/blob/master/contrib/check-config.sh

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
