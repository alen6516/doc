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

