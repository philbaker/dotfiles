(module config.mapping
  {autoload {nvim aniseed.nvim
             util config.util}})

; Leader mapping
(util.set-key :<space> :<nop>)
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

; General mapping

; Disable highlight
(util.set-key :<leader><CR> ":noh<CR>" false)

; Save file
(util.set-key :<leader>s ":w<CR>" false)
(util.set-key :<localleader>s ":Sq<CR>:Sqr<CR>" false)

; Escape for terminal mode
(util.set-key :<Esc> "<C-\\><C-n>" false :t)

; Restore default redo
(util.set-key :<C-R> "<C-R>" false)

; Switch buffer
(util.set-key :<leader>u "<C-^>" false)

; Open nvim config
(util.set-key :<leader>dc ":e ~/dotfiles/nvim/fnl/config/core.fnl<CR>" false)
(util.set-key :<leader>dm ":e ~/dotfiles/nvim/fnl/config/mapping.fnl<CR>" false)
(util.set-key :<leader>du ":e ~/dotfiles/nvim/fnl/config/usercommand.fnl<CR>" false)

; Open notes
(util.set-key :<leader>da ":e ~/neotes/all<CR>" true)
(util.set-key :<leader>dv ":e ~/neotes/all/vim-sexp-key-bindings.md<CR>" true)
(util.set-key :<leader>de ":Note " true)

; Movement
(util.set-key :<leader>h "<C-W>h" true)
(util.set-key :<leader>j "<C-W>j" true)
(util.set-key :<leader>k "<C-W>k" true)
(util.set-key :<leader>l "<C-W>l" true)
(util.set-key :<leader>pp "<C-W><C-P>" true)
(util.set-key :<leader>pl "<C-W>j<C-W>l" true)
(util.set-key :<leader>pmj "<C-W>j<Plug>(zoom-toggle)" true)
(util.set-key :<leader>pml "<C-W>j<C-W>l<Plug>(zoom-toggle)" true)
(util.set-key :<leader>pmk "<C-W>k<Plug>(zoom-toggle)" true)
(util.set-key :<leader>m "<Plug>(zoom-toggle)" true)
(util.set-key :<leader>o "<ESC>jcc" true)
(util.set-key :<localleader>o "k==o" true)

; Resize windows
(util.set-key :<S-Up> "<C-w>+" true)
(util.set-key :<S-Down> "<C-w>-" true)
(util.set-key :<S-Right> "<C-w>>" true)
(util.set-key :<S-Left> "<C-w><" true)

; Git
(util.set-key :<leader>gg ":tab G<CR>" true)
(util.set-key :<leader>gl ":tab G log<CR>" true)
(util.set-key :<leader>ga ":G add .<CR>" true)
(util.set-key :<leader>gp ":G push<CR>" true)
(util.set-key :<leader>gc ":G checkout " true)

; Toggle line numbers
(util.set-key :<leader>pn ":set invnumber<CR>" true)

; Show directories
(util.set-key :<leader>- "<Plug>(dirvish_up)<CR>" true)
(util.set-key :- "<Plug>(dirvish_up)<CR>" true)

; Format
(util.set-key :<leader>pr ":Prettier<CR>" true)

; Clerk
(util.set-key :<localleader>cs ":ClerkShow<CR>" false)

; Compile Java
(util.set-key :<localleader>jc ":Jac<CR>" false)

; Run Java
(util.set-key :<localleader>jr ":Jar<CR>" false)

; Node REPL utils
(util.set-key :<leader>pe ":Rex<CR>" false)
(util.set-key :<leader>pc ":Rco<CR>" false)
(util.set-key :<leader>pt ":Rle<CR>" false)
(util.set-key :<leader>pf "$V%:s/export //g<CR>" false)

; write Jasmine test from rich comment
(util.set-key :<leader>pj "f;xIexpect(<ESC>A).toBe(<ESC>JxA);<ESC>" false)

; turn it back into a comment
(util.set-key :<leader>pk "/to<CR>hxi<CR><ESC> <CR>wdt(%x^xkdt(%x^xA;<ESC>^" false)

(util.set-key :<leader>ps ":Pec<CR>" false)

(util.set-key :<leader>pi ":Pint<CR>" false)

(util.set-key :<leader>- ":Dirbuf<CR>" false)
