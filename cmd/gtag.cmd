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
* global
    * gtag-cscope is cscope except that it use GNU global as a search engine instead of cscope's one
    * gtags-cscope do not provide "find functions called by this function"

* how to use?
    * in short
        * apt install global
        * vim plugin install https://github.com/aceofall/gtags.vim.git
            * then we don't need to install ctags and can use ctrl-]/ctrl-t to jump
        * add to .vimrc

* add to .vimrc
    ```
    set cscopetag
    # 如果設定了cscopetag選項就可以在使用cscope資料中使用命令(:tags,ctrl-])來瀏覽標記
    # no need, already in the plugin gtags-cscope.vim

    set cscopeprg=gtags-cscope  "tell vim to use gtags-cscope as cscope

    cs add GTAGS  "let cs command can read GTAGS database
    cs add cscope.out "let cs command read cscope.out database

    source ~/.cscope_maps.vim   "map cs command to short-cut
    ```

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
            * for cscope, it only allow cscope.out in the current dir, so don't add this line
        * set cscopetag
            * allow cscope for using 'ctrl-]', '':ta', 'vim -t'
        * :cs add cscope.out
            * add cscope database 

    * gtags' advantage
        * auto complete for Gtags function_name(??
        * $ global -u
            * grageraly update

    * gtags vs ctags vs cscope
        * ctags
            * can generate tag file and let user jump in vim
            * no control panel
        * gtags and cscope are bascially the same, but cscope is no longer maintained
