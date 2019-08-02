# Description
* shift the parameters, after shift, old $(N+1) becomes new $(N)

# Overview
* shift is a bash built-in command

# Options
    
# Example
function test() {
    echo $1 $2
    shift
    echo $1 $2
}
