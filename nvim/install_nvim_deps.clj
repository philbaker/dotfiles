#!/usr/bin/env bb
(require '[babashka.tasks :as tasks]
         '[babashka.fs :as fs])

; Set up Neovim directory
(tasks/shell (str "rm -rf " (fs/home) "/.config/nvim"))
(tasks/shell (str "ln -sf " (fs/home) "/dotfiles/nvim " (fs/home) "/.config/nvim"))

; Install dependencies
(tasks/shell "brew install neovim")
(tasks/shell "brew install the_silver_searcher")
(tasks/shell "sudo apt install trash-cli")
(tasks/shell "npm install -g typescript-language-server typescript")
(tasks/shell "npm install -g vscode-langservers-extracted")
(tasks/shell "npm install -g @tailwindcss/language-server")
(tasks/shell "npm install -g vls")
(tasks/shell "npm install -g prettier")
(tasks/shell "brew install clojure-lsp/brew/clojure-lsp-native")

; Open Neovim
(tasks/shell "nvim")
