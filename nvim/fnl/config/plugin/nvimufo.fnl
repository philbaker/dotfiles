(module config.plugin.nvimufo
  {autoload {nvim aniseed.nvim
             util config.util
             ufo ufo}})

; z-c - collapse fold
; z-o - open fold

(set vim.o.foldcolumn "0")
(set vim.o.foldlevel 99)
(set vim.o.foldlevelstart 99)
(set vim.o.foldenable true)

(util.set-key :zR ":lua require('ufo').openAllFolds()<CR>" false)
(util.set-key :zM ":lua require('ufo').closeAllFolds()<CR>" false)
(util.set-key :zr ":lua require('ufo').openFoldsExceptKinds()<CR>" false)
(util.set-key :zm ":lua require('ufo').closeFoldsWith(1)<CR>" false)

(ufo.setup
  {:provider_selector (fn [bufnr filetype buftype]
                        ["treesitter" "indent"])})
