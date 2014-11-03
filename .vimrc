execute pathogen#infect()

set nocompatible

syntax on
filetype plugin indent on

" Limit to 16 colors
set t_Co=16

" Plugins
" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_auto_completion_start_length = 3
let g:neocomplcache_max_list = 10
" let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_enable_ignore_case = 1
set completeopt+=longest
set completeopt-=preview
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><C-g>     neocomplcache#undo_completion()
" inoremap <expr><C-l>     neocomplcache#complete_common_string()
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" Airline
set laststatus=2 " statusline with one file
let g:airline#extensions#tabline#enabled = 1 " top bar
let g:airline_theme = "monochrome"
let g:airline_left_sep = '' " Straight separator
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
" Unite


" Color Scheme
colorscheme nnkd

set showcmd         " Show command sequence as entering
set ruler           " Show row / col
" set cursorline      " Show line with cursor

" Line Numbers
set number
set numberwidth=3

" Leader key / remaps
let mapleader = ","                             " Use , instead of \
inoremap jk <Esc>                               " Use jj to exit insert
nmap <silent> ,/ :nohlsearch<CR>                " Clear search

" Tabs / Spacing
set nowrap          " Don't wrap lines
set tabstop=2       " Hard tabstop is 4 spaces
set shiftwidth=2    " Spaces for autoindent
set smarttab        " Use shiftwidth not tabstoset smarttab at start
set softtabstop=2   " Combination of spaces/tabs to simulate tabstops
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

" Folding
set foldmethod=indent
set foldlevel=99

" Python syntax
let python_highlight_all = 1
let python_highlight_space_errors = 0

" Toggle pastemode with F2
set pastetoggle=<F2>

" ---------------------------------------------------------------------
" EXTRA FUNCTIONS
" ---------------------------------------------------------------------
" Show highlighting gropus for current word
function! SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

