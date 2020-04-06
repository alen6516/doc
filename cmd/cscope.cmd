# Description

# Overview
* escape special char in "Find egrep pattern" (cscope's egrep is different from Linux egrep)
    * use [] to cover specical chars, like baseline_samples[++]


# Options

    
# Example
$ cscope -R
    * recursively parsing files and generate database file, cscope.out

$ cscope -d
    * open cscope panel, under the dir where cscope.out is

* use cscope on python code (also works for php code)
    * go to top dir of the python code
    * $ find . -name '*.py' > cscope.files && cscope -Rb
