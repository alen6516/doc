# Description

# Overview

# Options

    
# Example
$ ctags -R .
    * recursive parse child dir and generate tag file in current dir

$ ctags -R -f ./.git/tags .
    * recursive parse child dir and generate tag file in .git dir of current dir

$ ctags -R --languages=c,c++
    * c parses c function, c++ parses macros (preprocessor)

# in Vim
<Ctrl-]>        jump to the definition of tag
<Ctrl-t>        jump back from definition
g]              show the list of tags
