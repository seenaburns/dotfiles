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

" Leader key / remaps
let mapleader = ","                             " Use , instead of \
inoremap jj <Esc>                               " Use jj to exit insert
nmap <silent> ,/ :nohlsearch<CR>                " Clear search

" Tabs / Spacing
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

" Hide rather than close files in background
set hidden
