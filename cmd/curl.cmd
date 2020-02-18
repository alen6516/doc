# Usage
curl [options] [URL...]

# Options
-s
    Silent mode

-o FILENAME
    Save the output to certain file.

-I
    Fetch the headers only.

-w %{PATTERN}
    Display information after completed transfer. For example, "-w %{http_code}" will display the http code.

-v
    show verbose information

--data-binary @file
    POST @file data in binary as http body

-H @file
    customize http header

# Example
$ curl -k https://www.example.com
    * connect to the web in https, but don't verify the certifacation.

$ curl -v www.example.com
    * get information including http header and body

$ curl -H @file 127.0.0.1
    * file content:
        ```
        Accept-Language: en-US,en;q=0.5
        Accept-Encoding: gzip, deflate
        Connection: keep-alive
        Upgrade-Insecure-Requests: 1
        If_Modified-Since: Tue, 08 Oct 2019 14:37:29 GMT
        IF-None-Match: "c-594671ba63449"
        Cache-Control: max-age=0
        ```
$ curl -s -o /dev/null -I -w "{%http_code}" https://www.example.com
    * print out just http status code
    * -I sends HEAD request to prevent the loading of http body
