[{1 :ThePrimeagen/harpoon
  :config (fn []
            (let [harpoon (require :harpoon)]
              (harpoon.setup
                {:menu {:width (- (vim.api.nvim_win_get_width 0) 8)}})))}]
