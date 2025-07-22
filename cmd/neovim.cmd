## installation
$ sudo apt update && sudo apt install git make cmake file -y
$ git clone https://github.com/neovim/neovim && cd neovim && git checkout stable
$ make CMAKE_BUILD_TYPE=RelWithDebInfo
$ cd build && cpack -G DEB
$ sudo dpkg -i nvim-linux64.deb

## problem so far
* lsp treat #ifdef ... #endif as comment, so it will apply dim color

## config file
~/.config/nvim/init.vim
~/.config/nvim/init.lua

##


## plug-in mamager
* lazy
* vim-plug
    * plug-ins will be put in ~/.local/share/nvim/site/autoload after installing vim-plug
    * in *vim config file, add the following:
        ```
        call plug#begin()
        " The default plugin directory will be as follows:
        "   - Vim (Linux/macOS): '~/.vim/plugged'
        "   - Vim (Windows): '~/vimfiles/plugged'
        "   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
        " You can specify a custom plugin directory by passing it as the argument
        "   - e.g. `call plug#begin('~/.vim/plugged')`
        "   - Avoid using standard Vim directory names like 'plugin'

        " Make sure you use single quotes

        " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
        Plug 'junegunn/vim-easy-align'

        " Any valid git URL is allowed
        Plug 'https://github.com/junegunn/vim-github-dashboard.git'

        " Multiple Plug commands can be written in a single line using | separators
        Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

        " On-demand loading
        Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
        Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

        " Using a non-default branch
        Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

        " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
        Plug 'fatih/vim-go', { 'tag': '*' }

        " Plugin options
        Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

        " Plugin outside ~/.vim/plugged with post-update hook
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

        " Unmanaged plugin (manually installed and updated)
        Plug '~/my-prototype-plugin'

        " Initialize plugin system
        " - Automatically executes `filetype plugin indent on` and `syntax enable`.
        call plug#end()
        " You can revert the settings after the call like so:
        "   filetype indent off   " Disable file-type-specific indentation
        "   syntax off            " Disable syntax highlighting
        ```
