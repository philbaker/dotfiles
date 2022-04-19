".config/nvim/init.vim
set runtimepath^=~/dotfiles/nvim runtimepath+=~/dotfiles/nvim/after
let &packpath = &runtimepath
source ~/dotfiles/nvim/nvimrc
let g:aniseed#env = v:true
