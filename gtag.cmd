###### tags: `工具教學`
# gtags
* cscope
    * provide a control panel, can search 
        * symbol
        * caller
        * callee
        * function
        * egrep
    * provide cs command in vim
* ctags
    * provide c-] and c-t hot-key

* add

    * ```
        set cscopeprg=gtags-cscope 'replace cscope's control panel
        cs add GTAGS	'將gtags加入cscope的資料庫搜尋，讓cs -a 指令可以用，need to intall cscope first
        ```

    * cs add GTAGS 是讓 vim 可以直接用 gtag 的 tag

* works

    * install global and make manually

        * ```
            sudo apt-get build-dep global
            sudo apt-get install libncurses5-dev libncursesw5-dev
            ```

        * 

    * add .vimrc

        * ```
            set cscopetag " use cscope for tags command
            set cscopeprg=’gtags-cscope’ "replace cscope with gtags-cscope
            cs add GTAGS "replace cscope with gtags-cscope
            "set tags=./tags,./TAGS,tags;~,TAGS;~
            set tags=./tags,./TAGS,./GTAGS;
            
            " gtags.vim top config
            let GtagsCscope_Auto_Load = 1
            let GtagsCscope_Auto_Map = 1
            let GtagsCscope_Quiet = 1
            ```

    * add plugin

        * https://github.com/aceofall/gtags.vim

    * drawback

        * gtags-cscope do not provide "find functions called by this function"

* next

    * test global provide by pkg
        * it works

* conclusion

    * .vim/plugin should contain 
        * gtags-cscope.vim
            * replace cscope
        * gtags.vim
            * replace ctags
    * .vimrc should contain
        * set tags=./tags,./TAGS,tags;~,TAGS;~
            * it is for ctags to tell vim where to find ctags' tag file, it allow vim to recursively find tags file
            * but for gtags, by default it will do so, so actually no need to add this line
            * for cscope, it only allow cscope.out in the current dir
        * set cscopetag
            * allow cscope for using 'ctrl-]', '':ta', 'vim -t'
        * :cs add cscope.out
            * add cscope database 
    * gtags' advantage
        * auto complete for Gtags function_name
        * $ global -u
            * grageraly update
    * gtags need ctags? need cscope?
