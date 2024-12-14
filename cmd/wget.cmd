# Description
Download file from a website

# Overview
* download a page, including the following .css, .js file

# Options
-c FILE
    continue a stopped download

--header="HEADER"
    add custom header

-d
    debug output

# Example
$ wget -d --header="User-Agent: Mozilla/5.0 (Windows NT 6.0) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11" --header="Referer: http://linuxsecrets.com/" --header="Accept-Encoding: compress, gzip" http://www.google.com/
    * send request with custom header

$ wget --no-parent -A '*.deb' http://url/dir/
    * download all *deb files from a given url
