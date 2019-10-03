# Description

# Overview
* many commands don't support using pipe to deliver parameters to it, that's why xargs is useful

# Options
-p
    * confirm before execute

    
# Example
$ cut -d ':' -f 1 /etc/passwd | head -n 3 | xargs -n 1 id
    * there are 3 parameters, but give xargs one at a time
