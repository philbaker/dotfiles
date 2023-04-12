(module config.plugin.vimvsnip
  {autoload {nvim aniseed.nvim}})

(set nvim.g.vsnip_snippet_dir "~/dotfiles/nvim/snippets")

(vim.api.nvim_command "imap <expr> <C-j> vsnip#expandable() ? '<Plug>(vsnip-expand-or-jump)' : '<C-j>'")
(vim.api.nvim_command "imap <expr> <C-l> vsnip#available() ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'")
(vim.api.nvim_command "smap <expr> <C-j> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'")
(vim.api.nvim_command "smap <expr> <C-l> vsnip#available() ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'")	
(vim.api.nvim_command "imap <expr> <C-n> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<C-n>'")
(vim.api.nvim_command "smap <expr> <C-n> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<C-n>'")
(vim.api.nvim_command "imap <expr> <C-p> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-p>'")
(vim.api.nvim_command "smap <expr> <C-p> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-p>'")
