set nocompatible

" Pathogen
execute pathogen#infect()
filetype plugin indent on

syntax on

set showcmd         " Show command sequence as entering
set ruler           " Show row / col

" Dark Gray Line Numbers
set number
set numberwidth=3
highlight LineNr term=bold cterm=NONE ctermfg=yellow ctermbg=NONE gui=NONE guifg=yellow guibg=NONE

" 
" Leader key / remaps
" 
let mapleader = ","                             " Use , instead of \
inoremap jj <Esc>                               " Use jj to exit insert
nmap <silent> <leader>ev :e $MYVIMRC<CR>        " Edit vimrc
nmap <silent> <leader>sv :so $MYVIMRC<CR>       " Reload vimrc
nmap <silent> ,/ :nohlsearch<CR>                " Clear search

map <up> <nop>                                  " No arrow keys
map <down> <nop>
map <left> <nop>
map <right> <nop>

"
" Tabs / Spacing
"
set nowrap          " Don't wrap lines
set tabstop=4       " Hard tabstop is 4 spaces
set shiftwidth=4    " Spaces for autoindent
set smarttab        " Use shiftwidth not tabstoset smarttab at start
set softtabstop=4   " Combination of spaces/tabs to simulate tabstops
set expandtab       " always use spaces instead of tab characters
set autoindent      " always set autoindenting on
set copyindent      " copy the previous indentation on autoindenting

set showmatch       " Show matching parentheses
set smartcase       " Ignore case if all lowercase search
set hlsearch        " Highlight search terms
set incsearch       " Show matches as search
set hlsearch        " Highlight search terms
set incsearch       " Show matches as search
set backspace=indent,eol,start  " allow backspacing over everything in insert mode

" No backups
set nobackup
set noswapfile

" Paste mode
set pastetoggle=<F2>


" Vimroom
let g:vimroom_background = 'Yellow'
let g:vimroom_width = 100
let g:vimroom_sidebar_height = 0

" Hide ~ at start (and other nontext)
hi! nontext ctermfg=BLACK guifg=BLACK

" Hide rather than close files in background
set hidden
