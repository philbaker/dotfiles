[{1 :renerocksai/telekasten.nvim
  :dependencies [:nvim-telescope/telescope.nvim]
  :config (fn []
            (let [telekasten (require :telekasten)
                  notes-dir (vim.fn.expand "~/neotes")]
              (telekasten.setup {:home notes-dir
                                 :take_over_my_home false})))}]
