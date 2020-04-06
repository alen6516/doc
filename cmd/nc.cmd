# Description

# Overview

# Options
-u 
    use UDP

-6
    use ipv6
    
# Example
$ nc -v 127.0.0.1 8787
    * Test TCP port is open or not

$ nc -lu 127.0.0.1 5000
    * Open a UDP port (default is TCP) and print the received data to terminal

$ echo -n "foo" | nc -u -w1 127.0.0.1 5000
    * Send UDP packet to remote server
    * -w1 means timeout is 1 sec

* copy file between 2 machine
    $ nc -l 5000 > my.jpg
    $ nc server_ip 5000 < my.jpg

* send http msg via nc
    $ echo -e "$(cat http_msg_file)" | nc 127.0.0.1 80
    * example http GET msg
        * GET / HTTP/1.1\r\nHost: 127.0.0.1\r\nUser-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nAccept-Language: en-US,en;q=0.5\r\nAccept-Encoding: gzip, deflate\r\nConnection: keep-alive\r\nUpgrade-Insecure-Requests: 1\r\nIf-Modified-Since: Tue, 08 Oct 2019 14:37:29 GMT\r\nIf-None-Match: "c-594671ba63449"\r\nCache-Control: max-age=0\r\n\r\n

* simple TLS server
    $ nc -lvnp 12345
    $ ncat -lvnp 12345 --ssl
    * for SSL client
        $ gnutls-lci imap.gmail.com -p 993
        $ openssl s_client -connect imap.gmail.com:993
        $ socat openssl:imap.gmail.com:993 stdio
        $ socat ssl:imap.gmail.com:993 readline
        $ ncat --ssl imap.gmail.com 993
        $ telnet-ssl -z ssl imap.gmail.com 993

* chat room
    * server
        $ nc -v -l 127.0.0.1 6000
    * client
        $ nc -v -p 5000 localhost 6000

* port scan
    $ nc -vz 192.168.0.117 1-100
