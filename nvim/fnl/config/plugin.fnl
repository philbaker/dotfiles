(module config.plugin
  {autoload {core aniseed.core
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
        (for [i 1 (core.count pkgs) 2]
          (let [name (. pkgs i)
                opts (. pkgs (+ i 1))]
            (-?> (. opts :mod) (safe-require-plugin-config))
            (use (core.assoc opts 1 name)))))))
  nil)

; Plugins managed by packer
; :mod specifies namespace under plugin directory

(use
  ; Plugin Manager
  :wbthomason/packer.nvim {}

  ; Nvim config and plugins in Fennel
  :Olical/aniseed {}

  ; Theme
  :folke/tokyonight.nvim {:branch :main}
  :kyazdani42/nvim-web-devicons {}

  ; Status line
  :nvim-lualine/lualine.nvim {:mod :lualine}

  ; File searching
  :nvim-lua/plenary.nvim {}
  :nvim-telescope/telescope-live-grep-args.nvim {}
  :nvim-telescope/telescope-project.nvim {}
  :nvim-telescope/telescope.nvim {:mod :telescope
                                  :requires [:nvim-lua/plenary.nvim
                                             :nvim-telescope/telescope-live-grep-args.nvim
                                             :nvim-telescope/telescope-project.nvim]}
  :AckslD/nvim-neoclip.lua {:mod :neoclip
                            :requires [:nvim-telescope/telescope.nvim]}
  :lalitmee/browse.nvim {:mod :browse}

  ; REPL tools
  :Olical/conjure {:branch :master :mod :conjure}
  :kassio/neoterm {:mod :neoterm}

  ; Git
  :tpope/vim-fugitive {}
  :airblade/vim-gitgutter {:mod :gitgutter}
  :sindrets/diffview.nvim {:mod :diffview}

  ; Navigation
  :dhruvasagar/vim-zoom {}
  :elihunter173/dirbuf.nvim {}
  :ThePrimeagen/harpoon {}

  ; LSP
  :neovim/nvim-lspconfig {:mod :lspconfig}

  ; Testing
  :vim-test/vim-test {:mod :vimtest}

  ; Syntax
  :nvim-treesitter/nvim-treesitter {:run ":TSUpdate"
                                    :mod :treesitter}
  :tpope/vim-repeat {}
  :tpope/vim-surround {}
  :sgur/vim-editorconfig {}
  :prettier/vim-prettier {}
  :jwalton512/vim-blade {}
  :stephpy/vim-php-cs-fixer {}
  :andymass/vim-matchup {:mod :matchup}
  :axvr/org.vim {}
  :sbdchd/neoformat {}
  :junegunn/vim-easy-align {:mod :vimeasyalign}
  :posva/vim-vue {}
  :github/copilot.vim {:mod :copilot}

  ; Comments
  :JoosepAlviste/nvim-ts-context-commentstring {}
  :terrortylor/nvim-comment {:mod :nvimcomment}

  ; S-expressions
  :philbaker/vim-sexp {:mod :sexp}
  :tpope/vim-sexp-mappings-for-regular-people {}

  ; Autocomplete
  :hrsh7th/vim-vsnip {:mod :vimvsnip}
  :hrsh7th/cmp-nvim-lsp {}
  :PaterJason/cmp-conjure {}
  :hrsh7th/cmp-vsnip {}
  :hrsh7th/cmp-path {}
  :hrsh7th/nvim-cmp {:requires [:hrsh7th/vim-vsnip
                                :hrsh7th/cmp-nvim-lsp
                                :PaterJason/cmp-conjure
                                :hrsh7th/cmp-vsnip
                                :hrsh7th/cmp-path]
                     :mod :cmp}
  :folke/which-key.nvim {:mod :whichkey}
  :kevinhwang91/nvim-ufo {:mod :nvimufo
                          :requires [:kevinhwang91/promise-async]})
