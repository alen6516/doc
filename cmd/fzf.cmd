# Description

# Overview
* ref
    * https://myapollo.com.tw/blog/fzf-ease-your-life/

* in terminal
    * ctrl+t
        * search current path
    * ctrl+r
        * list history commands

* in fzf window
    * ctrl-j or ctrl-n
        * move down
    * ctrl-k or ctrl-p
        * move up
    * <TAB>
        * select multiple files
    * <shift-TAB>
        * unselect
    * ctrl-c or ctrl-g or Esc
        * exit

* the default command to find file is `find`
    $ export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'
        * use `ag` to find files including hidden files and ignore .git folder
    $ export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.sass-cache,node_modules,build} --type f"
        * use `fd` to find files

* configure parameter of fzf
    $ export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"

# Options

# Example
$ find * -type f | fzf

$ fe
    ```
    fe()
    {
        local files
        IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
        [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
    }
    ```
    * find file with fzf and open with editor

$ fd
    ```
    fd()
    {
        local dir
        dir=$(find ${1:-.} -path '*/\.*' -prune \
                        -o -type d -print 2> /dev/null | fzf +m) &&
        cd "$dir"
    }
    ```
    * find folder with fzf and cd into

$ fkill
    ```
    fkill()
    {
        local pid
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
        if [ "x$pid" != "x" ]; then
	        echo $pid | xargs kill -${1:-9}
        fi
    }
    ```
    * find and kill process

$ pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S
    * fuzzy-search through all available packages, with package info shown in a preview window, and then install selected packages

$ pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns
    * list all installed packages and remove the selected one

$ git checkout $(git branch | fzf --cycle --border --ansi)
    * select which branch to git checkout

$ git status --short | fzf --multi --color=dark --cycle --border --ansi --preview-window=up:70% --preview=\"git diff --color {+2}\" | awk '{print \$2}' | xargs git add
    * alias gadd, check git diff before git add file
    * --multi means we can select multiple files
    * --preview-window=up:70% configures preview-window
    * --preview sets the content for preview window

$ git diff --name-only | fzf --multi --color=dark --cycle --border --ansi --preview-window=up:70% --preview=\"git diff --color {+1}\" | xargs git restore
    * alias to gres
    * git restore files

$ git diff --name-only --cached | fzf --multi --color=dark --cycle --border --ansi --preview-window=up:70% --preview="git diff --color --staged {+1}" | xargs git reset HEAD"
    * alias to gust
    * git unstage files

$ git branch --color=always | fzf --multi --color=dark --cycle --border --ansi | sed 's/*//' | awk '{print \$1}' | xargs git branch -d
    * alias to gbrd
    * git branch -d
