[{1 :stevearc/oil.nvim
  :dependencies [:nvim-tree/nvim-web-devicons]
  :config (fn []
            (let [oil (require :oil)]
              (oil.setup)
              (vim.keymap.set :n "-" :<CMD>Oil<CR> {:desc "Open parent directory"})))}]
