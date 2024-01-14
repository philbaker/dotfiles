local _2afile_2a = "/home/pb/.config/nvim/fnl/config/plugin.fnl"
local _2amodule_name_2a = "config.plugin"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local autoload = (require("aniseed.autoload")).autoload
local core, packer = autoload("aniseed.core"), autoload("packer")
do end (_2amodule_locals_2a)["core"] = core
_2amodule_locals_2a["packer"] = packer
local function safe_require_plugin_config(name)
  local ok_3f, val_or_err = pcall(require, ("config.plugin." .. name))
  if not ok_3f then
    return print(("config error: " .. val_or_err))
  else
    return nil
  end
end
_2amodule_locals_2a["safe-require-plugin-config"] = safe_require_plugin_config
local function use(...)
  do
    local pkgs = {...}
    local function _2_(use0)
      for i = 1, core.count(pkgs), 2 do
        local name = pkgs[i]
        local opts = pkgs[(i + 1)]
        do
          local _3_ = opts.mod
          if (nil ~= _3_) then
            safe_require_plugin_config(_3_)
          else
          end
        end
        use0(core.assoc(opts, 1, name))
      end
      return nil
    end
    packer.startup(_2_)
  end
  return nil
end
_2amodule_locals_2a["use"] = use
use("wbthomason/packer.nvim", {}, "Olical/aniseed", {}, "Olical/nfnl", {}, "folke/tokyonight.nvim", {branch = "main"}, "kyazdani42/nvim-web-devicons", {}, "nvim-lualine/lualine.nvim", {mod = "lualine"}, "nvim-lua/plenary.nvim", {}, "nvim-telescope/telescope-live-grep-args.nvim", {}, "nvim-telescope/telescope-project.nvim", {}, "nvim-telescope/telescope.nvim", {mod = "telescope", requires = {"nvim-lua/plenary.nvim", "nvim-telescope/telescope-live-grep-args.nvim", "nvim-telescope/telescope-project.nvim"}}, "AckslD/nvim-neoclip.lua", {mod = "neoclip", requires = {"nvim-telescope/telescope.nvim"}}, "lalitmee/browse.nvim", {mod = "browse"}, "Olical/conjure", {branch = "master", mod = "conjure"}, "kassio/neoterm", {mod = "neoterm"}, "tpope/vim-fugitive", {}, "airblade/vim-gitgutter", {mod = "gitgutter"}, "sindrets/diffview.nvim", {mod = "diffview"}, "dhruvasagar/vim-zoom", {}, "elihunter173/dirbuf.nvim", {}, "ThePrimeagen/harpoon", {}, "neovim/nvim-lspconfig", {mod = "lspconfig"}, "vim-test/vim-test", {mod = "vimtest"}, "nvim-treesitter/nvim-treesitter", {run = ":TSUpdate", mod = "treesitter"}, "tpope/vim-repeat", {}, "tpope/vim-surround", {}, "sgur/vim-editorconfig", {}, "prettier/vim-prettier", {}, "jwalton512/vim-blade", {}, "stephpy/vim-php-cs-fixer", {}, "andymass/vim-matchup", {mod = "matchup"}, "axvr/org.vim", {}, "sbdchd/neoformat", {}, "junegunn/vim-easy-align", {mod = "vimeasyalign"}, "posva/vim-vue", {}, "JoosepAlviste/nvim-ts-context-commentstring", {}, "terrortylor/nvim-comment", {mod = "nvimcomment"}, "philbaker/vim-sexp", {mod = "sexp"}, "tpope/vim-sexp-mappings-for-regular-people", {}, "hrsh7th/vim-vsnip", {mod = "vimvsnip"}, "hrsh7th/cmp-nvim-lsp", {}, "PaterJason/cmp-conjure", {}, "hrsh7th/cmp-vsnip", {}, "hrsh7th/cmp-path", {}, "hrsh7th/nvim-cmp", {requires = {"hrsh7th/vim-vsnip", "hrsh7th/cmp-nvim-lsp", "PaterJason/cmp-conjure", "hrsh7th/cmp-vsnip", "hrsh7th/cmp-path"}, mod = "cmp"}, "folke/which-key.nvim", {mod = "whichkey"}, "kevinhwang91/nvim-ufo", {mod = "nvimufo", requires = {"kevinhwang91/promise-async"}})
return _2amodule_2a