# Description
File Transfer Protocol

# Overview

* FTP header length is not a fixed value

* RFC 959

* server listen on TCP port 21

* 2 transfer types
    * active transfer
        * client connects to server TCP port 21, building the command channel.
        * for active transfer, client will tell server I will listen on port X for the file via the command channel
        * then server will use TCP port 20 to connect to the client on TCP port X, then start the file transfer.
        * data channel connection request is from server to client

    * passive transfer
        * client connects to server TCP port 21, building the command channel.
        * for passive transfer, client sends PASV command to server to ask for passive transfer
        * server will reply a Passive IP addr $ADDR and a randomly selected Passive port $PORT to the client
        * then client use another src port connect to server's $PORT (finish 3-way handshake )
        * client ask for the file via command channel
        * file then be transfered via data channel
        * data channel connection request is from client to server

# Structure

    // Request
        Request Command
        Request arg

    // Response
        Response Code
        Response arg

    End with 0d 0a


## Field description
