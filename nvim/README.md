# Neovim

## Setup
```bash
# Delete the current nvim config
rm -rf $HOME/.config/nvim

# Make a symbolic link to new config
ln -sf $PWD/nvim $HOME/.config/nvim
```

On first load Neovim will download Packer and Aniseed. It will show a few errors which can be ignored. The next step is to install plugins with `:PackerInstall`.

## Dependencies
- Neovim >= 0.5 `brew install neovim`
- Ripgrep `brew install ripgrep`
- [FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads)
