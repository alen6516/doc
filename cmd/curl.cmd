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

# Example
$ curl -k https://www.example.com
    * connect to the web in https, but don't verify the certifacation.

$ curl -v www.example.com
    * get information including http header and body
