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

# in .vimrc
"#########################################
" config for ctags
"#########################################

" Must change input method to English then can jump

" change vim's work dir to the dir of the file, note some plugin may break
"set autochdir

" set tags, the final ';' is important, it allows ctag to recursively search parent dir from current work dir
" ./tags means search from vim's current working dir
" note if not set autochdir, vim's working dir is user's current path
"set tags=./.tags,./tags;

" still try to move tags to .git
"let tags_path=findfile(".git/tags", ";")
"let &tags=tags_path
"#########################################
