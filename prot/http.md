# Description

# Overview


* RFC
    * RFC 1945 for HTTP/1.0
    * RFC 2616 for HTTP/1.1

* a http packet is decoded in ascii

* http is stateless, not actually connectionless

* http transcation
    * a set of http request and its http response is called a http transaction

* http stream
    * known as chunked transfer encoding
    * generally, to fill "content length" field in http header, server needs to wait util all content is generated to fill it and send packet.
    * Streamed responses have no Content-Length header. Rather, they have a Transfer-Encoding header with a value of “chunked”
    * this tech allows server application send data with its size once there is some to send.

* http persistent connection
    * mandatory in HTTP/1.1
    * when a client finishes 3-way handshake and send a msg to server, by default after server reply, the connection will be terminated. However, 2 sides can negotiate to use persistent connection
    * client sends msg with header "Connection: Keep-Alive"
    * server replies msg with headers "Connection: Keep-Alive" and "Keep-Alive: timeout=5, max=100"


# Structure

## Field description

### reqeust
* Startline
    * request method: GET, POST, PUT, DELETE, HEAD

* Host
    * hostname, which is mandatory in HTTP/1.1

* User-Agent
    * client's information

* Content-Type
* Content-length
    * len of the content

* Accept-Language
* Accept-Encoding
* Accept-Charset
* Keep-Alive
    Keep-Alive: timeout=5, max=100\r\n
* Connection
    Connection: Keep-Alive\r\n
* Etag
    * a hash code given from server to client, the following http requests from client carry this Etag

### response

