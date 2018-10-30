## Setting up Neovim

1. `brew install neovim`
2. `brew install python3`
3. `pip3 install --user neovim`
4. `ln -s ~/dotfiles/nvim/nvimrc .nvimrc`
5. `mkdir ~/.config/nvim`
6. `ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim`
7. `git clone https://github.com/k-takata/minpac.git \
    ~/dotfiles/nvim/pack/minpac/opt/minpac`
8. `:PackUpdate`
9. `pip3 install --upgrade neovim-remote`
