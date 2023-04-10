(module config.plugin.telekasten
  {autoload {nvim aniseed.nvim
             telekasten telekasten
             util config.util}})

(telekasten.setup {:home (vim.fn.expand "~/neotes/all")})

; Launch panel if nothing is typed after <leader>z
(util.set-key "<leader>z" "<cmd>Telekasten panel<CR>" false )

(util.set-key "<leader>zf" "<cmd>Telekasten find_notes<CR>" false)
(util.set-key "<leader>zg" "<cmd>Telekasten search_notes<CR>" false)
(util.set-key "<leader>zd" "<cmd>Telekasten goto_today<CR>" false)
(util.set-key "<leader>zz" "<cmd>Telekasten follow_link<CR>" false)
(util.set-key "<leader>zn" "<cmd>Telekasten new_note<CR>" false)
(util.set-key "<leader>zc" "<cmd>Telekasten show_calendar<CR>" false)
(util.set-key "<leader>zb" "<cmd>Telekasten show_backlinks<CR>" false)
(util.set-key "<leader>zI" "<cmd>Telekasten insert_img_link<CR>" false)
(util.set-key "<C-c><C-c>" ":lua require('telekasten').toggle_todo({onlyTodo=true})<CR>" false)

; Call insert link automatically when we start typing a link
(util.set-key "[[" "<cmd>Telekasten insert_link<CR>" false :i)
