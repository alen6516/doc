# lsp concept
* install clangd
* configure lsp in init.lua
* open a c file, check `:LspInfo`, if no active client, use `:LspStart clangd`
* clangd needs compile_commands.json in root directory (or root/build), or it may fail to parse the project.
    * if project is built by cmake, run `cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON` to generate it
    * if project is built with Makefile, run `bear -- make`
* for linux source tree to generate compile_commands.json
    $ python3 scripts/compile_commands.py
    * or
    $ bear -- make C=1 M=kernel/sched
    * then put json file in source root
* lsp commands
    * :LspInfo
    * :LspLog
    * :LspStart clangd
    * :LspRestart
    * :checkhealth
        * looks for lsp warnings
    * :lua print(vim.inspect(vim.fn.gettagstack()))
        * check current tagstack content

# build neovim
$ git clone https://github.com/neovim/neovim
$ cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
$ git checkout stable
$ cd build && cpack -G DEB
$ sudo dpkg -i nvim-linux64.deb


# clone lazy.nvim
mkdir -p ~/.config/nvim
git clone https://github.com/folke/lazy.nvim ~/.config/nvim/lazy/lazy.nvim

# setup init.lua
## setup lsp
$ sudo apt install clangd

# plug-in
* https://github.com/LazyVim/LazyVim
    * make nvim a IDE

# troubleshoot
* <C-h> mapping doesn't work
        * https://github.com/neovim/neovim/issues/2048

