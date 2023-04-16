(module config.plugin.telekasten
  {autoload {telekasten telekasten
             util config.util}})

(telekasten.setup {:home (vim.fn.expand "~/neotes/all")})

; Launch panel if nothing is typed after <leader>z
(util.set-key "<leader>z" "<cmd>Telekasten panel<CR>" false )

(util.set-key "<C-c><C-c>" ":lua require('telekasten').toggle_todo({onlyTodo=true})<CR>" false)
