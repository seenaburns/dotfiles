call plug#begin('~/.config/nvim/plugged')

" General plugins
Plug 'altercation/vim-colors-solarized'

Plug 'ctrlpvim/ctrlp.vim'

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-sneak'
Plug 'tomtom/tcomment_vim' " gc comments

" Scala plugins
Plug 'derekwyatt/vim-scala'

call plug#end()

" Leader key
let mapleader = ","

" Custom
source ~/.config/nvim/custom/functions.vim
nnoremap <leader>t :call ToggleTodo()<cr>
vnoremap <leader>t :call ToggleTodo()<cr>

" airline
set laststatus=2
let g:airline_left_sep=""
let g:airline_left_alt_sep="|"
let g:airline_right_sep=""
let g:airline_right_alt_sep="|"
let g:airline_theme="luna"

" arrow keys disable
nnoremap <right> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <up> <nop>

vnoremap <right> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <up> <nop>

" j/k move virtual lines, gj/jk move physical lines
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" brace completion
set showmatch
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap {}     {}

inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap ()     ()

inoremap [      []<Left>
inoremap [<CR>  [<CR>]<Esc>O
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap []     []

" CtrlP
let g:ctrlp_by_filename=1
let g:ctrlp_custom_ignore={"dir": "target"}
let g:ctrlp_map="<leader>e"
let g:ctrlp_root_markers = ['build.sbt']
nnoremap <leader>v :CtrlP<Space>

" deoplete
let g:deoplete#enable_at_startup=1
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-i>"

" horizontal split splits below
set splitbelow

" indentation
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" line numbers
set number
set relativenumber

" map <C-w>w (switch buffer focus) to something nicer
nnoremap <leader>w <C-w>w

" mouse
set mouse-=a

" NERDTree
" Open NERDTree in the directory of the current file (or /home if no file is open)
function! NERDTreeToggleFind()
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    execute ":NERDTreeClose"
  else
    execute ":NERDTreeFind"
  endif
endfunction

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <leader>c :call NERDTreeToggleFind()<cr>

" panes
nnoremap <leader>d :vsp<cr>
set splitright
nnoremap <leader>s :sp<cr>
set splitbelow

" sarsi
let sarsivim = 'sarsi-nvim'
if (executable(sarsivim))
  call rpcstart(sarsivim)
endif
nnoremap <leader>l :cfirst<cr>
nnoremap <leader>f :cnext<cr>
nnoremap <leader>g :cprevious<cr>

" show title
set title

" syntax highlighting
set t_Co=256
colorscheme delek
syntax on
set background=dark

hi MatchParen cterm=none ctermbg=none ctermfg=red
hi Pmenu ctermbg=black ctermfg=white

" Automatic syntax highlighting for files
au BufRead,BufNewFile *.txt     set filetype=markdown

" utf-8 ftw
set encoding=utf-8

" whitespace
highlight ExtraWhitespace ctermbg=red guibg=red

match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" wrap textlines
" set colorcolumn=121
" set textwidth=120
