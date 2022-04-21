(module config.plugin
  {autoload {nvim aniseed.nvim
             a aniseed.core
             util config.util
             packer packer}})

(defn- safe-require-plugin-config [name]
  (let [(ok? val-or-err) (pcall require (.. :config.plugin. name))]
    (when (not ok?)
      (print (.. "config error: " val-or-err)))))

(defn- use [...]
  "Iterates through the arguments as pairs and calls packer's use function for
  each of them. Works around Fennel not liking mixed associative and sequential
  tables as well."
  (let [pkgs [...]]
    (packer.startup
      (fn [use]
        (for [i 1 (a.count pkgs) 2]
          (let [name (. pkgs i)
                opts (. pkgs (+ i 1))]
            (-?> (. opts :mod) (safe-require-plugin-config))
            (use (a.assoc opts 1 name)))))))
  nil)

;;; Plugins managed by packer
;;; :mod specifies namespace under plugin directory

(use
  ;; Plugin Manager
  :wbthomason/packer.nvim {}
  ;; Nvim config and plugins in Fennel
  :Olical/aniseed {}

  ;; Theme
  :ful1e5/onedark.nvim {:mod :theme}
  :kyazdani42/nvim-web-devicons {}

  ;; Status line
  :nvim-lualine/lualine.nvim {:mod :lualine}

  ;; File searching
  :nvim-telescope/telescope.nvim {:requires [:nvim-lua/popup.nvim
                                             :nvim-lua/plenary.nvim]
                                  :mod :telescope}

  ;; REPL tools
  :Olical/conjure {:branch :master :mod :conjure}

  ;; S-expressions
  :guns/vim-sexp {:mod :sexp}
  :tpope/vim-sexp-mappings-for-regular-people {}
  :tpope/vim-repeat {}
  :tpope/vim-surround {}

  ;; Comments
  :tpope/vim-commentary {}

  ;; Parsing system
  :nvim-treesitter/nvim-treesitter {:run ":TSUpdate"
                                    :mod :treesitter}

  ;; Navigation
  :preservim/nerdtree {:mod :nerdtree}

  ;; REPL
  :preservim/vimux {:mod :vimux}
  :jpalardy/vim-slime {:mod :vimslime}

  ;; LSP
  :neovim/nvim-lspconfig {:mod :lspconfig}

  ;; Syntax
  :sgur/vim-editorconfig {}
  :tpope/vim-endwise {}
  :elixir-editors/vim-elixir {}


  ;; Autocomplete
  :hrsh7th/vim-vsnip {}
  :hrsh7th/cmp-vsnip {}
  :hrsh7th/nvim-cmp {:requires [:hrsh7th/cmp-buffer
                                :hrsh7th/cmp-nvim-lsp
                                :PaterJason/cmp-conjure]
                     :mod :cmp})

