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

# Structure

## Field description

### reqeust
* Status-line
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
* Connection

### response

