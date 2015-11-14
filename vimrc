set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'flazz/vim-colorschemes'
Plugin 'othree/html5.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'tmhedberg/matchit'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin '1995eaton/vim-better-javascript-completion'
Plugin 'leshill/vim-json'
Plugin '1995eaton/vim-better-css-completion'
Plugin 'tpope/vim-commentary'
Plugin 'kien/ctrlp.vim'
Plugin 'jaxbot/browserlink.vim'
Plugin 'mattn/emmet-vim'
Plugin 'smeggingsmegger/ag.vim'
Plugin 'majutsushi/tagbar'
Plugin 'StanAngeloff/php.vim'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"" Detect filetype
filetype plugin on

" Enable syntax highighting
syntax enable
" 256 colors
set t_Co=256

syntax on

set background=dark
"" solarized options 
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termcolors = 256
colorscheme solarized


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basic setup
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set bs=2
set ts=4
set sw=4
set number
" shows row and column number at bottom right corner
set ruler
set encoding=utf-8

" Set relevant filetypes
"au BufRead,BufNewFile *.scss set filetype=css
"au BufRead,BufNewFile *.md set filetype=markdown
"au BufRead,BufNewFile *.html set syntax=xml


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4

" Make the command-line completion better
set wildmenu

filetype plugin indent on

set softtabstop=4

" " Be smart when using tabs
set smarttab
set breakindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" " Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
" Remember info about open buffers on close
set viminfo^=%

" Interactions

" Start scrolling slightly before the cursor reaches an edge
set scrolloff=3
set sidescrolloff=5
" Scroll sideways a character at a time, rather than a screen at a time
set sidescroll=1
" Allow motions and back-spacing over line-endings etc
set backspace=indent,eol,start
" set whichwrap=h,l,b,<,>,~,[,]
" Underscores denote words
"set iskeyword-=_

""""""""""""""""""""""""""""""
" => Status line
" """"""""""""""""""""""""""""""

" " Always show the status line
set laststatus=2
"
" Show what mode youÃ¢â‚¬â„¢re currently in
set showmode
" Show what commands youÃ¢â‚¬â„¢re typing
set showcmd
" Allow modelines
set modeline
" Show current line and column position in file
set ruler
" Show file title in terminal tab
set title

"" Toggle relative line number
function! NumberToggle()
    if(&relativenumber)
        set norelativenumber
        set number
    else
        "" Uncomment the following to
        " display a '0' instead of the line number
        " set nonumber
        set relativenumber
    endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" Limit line-length to 80 columns by highlighting col 81 onward
if exists("+colorcolumn")
    set colorcolumn=80
endif
" Highlight current line
set cursorline
" DonÃ¢â‚¬â„¢t keep results highlighted after searching...
set nohlsearch
" ...just highlight as we type
set incsearch
" Ignore case when searching...
set ignorecase
" ...except if we input a capital letter
set smartcase

highlight ColorColumn ctermbg=10

" Key mappings

" jj to throw you into normal mode from insert mode
inoremap jj <esc>
" Disable arrow keys
map  <up>    <nop>
imap <up>    <nop>
map  <down>  <nop>
imap <down>  <nop>
map  <left>  <nop>
imap <left>  <nop>
map  <right> <nop>
imap <right> <nop>

map <Tab> <C-W>w
map <Bar> <C-W>v<C-W><Right>
map -     <C-W>s<C-W><Down>
map <silent> <C-b> :NERDTreeToggle<CR>
"Mapleader
let mapleader = "-"

"turn on text highlight in search by default
set hlsearch

" Resizing windows
nnoremap <C-up> <C-W>+
nnoremap <C-down> <C-W>-
nnoremap <C-left> <C-W><
nnoremap <C-right> <C-W>>

" " Moving around splits
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" " Closing windows
nnoremap <C-C>l <C-W>l:q<CR>
nnoremap <C-C>h <C-W>h:q<CR>
nnoremap <C-C>j <C-W>j:q<CR>
nnoremap <C-C>k <C-W>k:q<CR>

" Disable ex mode (Dvorak annoyance)
nnoremap Q <Nop>

" Ignore gulp files in fuzzy find
set wildignore+=*.o,*.obj,.git
set wildignore+=node_modules/**

"Turn off annoying beep sounds
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

" autoload files that have changed outside of vim
set autoread

" Show matching brackets when text indicator is over them
set showmatch
" " How many tenths of a second to blink when matching brackets
set mat=2

" Add a bit extra margin to the left
set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" " Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
"
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

nnoremap <leader>h :Ag<space>

map <leader>n :cn<cr>
map <leader>p :cp<cr>

nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>m :CtrlPMRUFiles<CR>
nnoremap <leader>t :CtrlPTag<CR>et g:ctrlp_map = '<c-l>'
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <silent> <Leader>b :TagbarToggle<CR>

set clipboard=unnamed
let g:session_autoload = 'no'

set cpoptions+=$
set omnifunc=syntaxcomplete#Complete

"Open browser
nnoremap <F12>f :exe ':silent !open -a /Applications/Firefox.app %'<CR>
nnoremap <F12>c :exe ':silent !open -a /Applications/Google\ Chrome.app %'<CR>
nnoremap <F12>g :exe ':silent !open -a /Applications/Google\ Chrome.app %'<CR>
nnoremap <F12>s :exe ':silent !open /Applications/Safari.app %'<CR>
