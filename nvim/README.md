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
- Ag `brew install the_silver_searcher`
- Trash CLI `apt install trash-cli` (`brew install trash-cli` for mac)
- [FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads)
- [TypeScript language server](https://www.npmjs.com/package/typescript-language-server) `npm install -g typescript-language-server typescript`
- vscode-eslint-language-server `npm install -g vscode-langservers-extracted`
- [Tailwind CSS language server](https://github.com/tailwindlabs/tailwindcss-intellisense/tree/master/packages/tailwindcss-language-server) `npm install -g @tailwindcss/language-server`
- [Prettier](https://prettier.io/docs/en/install.html) `npm install -g prettier` 
- [Clojure language server](https://clojure-lsp.io/installation/) `brew install clojure-lsp/brew/clojure-lsp-native`
