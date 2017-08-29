" vim:foldmethod=marker:foldlevel=0
" zo + zc to open / close folds in case I forgot :P
let g:python3_host_prog=expand("~/.local/python/neovim-venv/bin/python3")

" PLUG {{{
call plug#begin('~/.config/nvim/plugged')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'tomtom/tcomment_vim' " gc comments
Plug 'tpope/vim-surround'


" FZF / Ctrlp for file navigation
if executable('fzf')
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
else
  Plug 'ctrlpvim/ctrlp.vim'
endif

" Language plugins
" Scala plugins
if executable('scalac')
  Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
endif
" Haskell Plugins
" Plug 'neovimhaskell/haskell-vim'
" Rust Plugins
if executable('rustc')
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
  Plug 'racer-rust/vim-racer', { 'for': 'rust' }
  Plug 'neomake/neomake', { 'for': 'rust' }
endif

call plug#end()
" }}}
" LOOK AND SYNTAX HILIGHTING {{{
set t_Co=256
syntax on
set background=dark
colorscheme nnkd

" whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$/ containedin=ALL

" Undefined Marks
highlight UndefinedMarks ctermfg=yellow
autocmd Syntax * syn match UndefinedMarks /???/ containedin=ALL

" Automatic syntax highlighting for files
au BufRead,BufNewFile *.txt     set filetype=markdown
au BufRead,BufNewFile *.sbt     set filetype=scala
au BufRead,BufNewFile *.conf    set filetype=dosini
au BufRead,BufNewFile *.bash*   set filetype=sh
au BufRead,BufNewFile *.jsonnet*   set filetype=c
au BufRead,BufNewFile *.libsonnet*   set filetype=c
au BufRead,BufNewFile todo*   set filetype=todo

" Better split character
" Override color scheme to make split them black
" set fillchars=vert:\|
set fillchars=vert:│

set colorcolumn=101
set cursorline
" }}}
" KEYMAPPINGS {{{
" Leader key
let mapleader = ","

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

" Remap increment and decrement numbers to something that works on macs/linux
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>

" panes
nnoremap <leader>d :vsp<cr>
set splitright
nnoremap <leader>s :split<cr>
set splitbelow
" map <C-w>w (switch buffer focus) to something nicer
nnoremap <leader>w <C-w>w

" tabs
nnoremap <leader>] :tabn<cr>
nnoremap <leader>[ :tabp<cr>

" Insert date
nnoremap <leader>fd "=strftime("%m-%d-%y")<CR>p

" Edit vimrc
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>evs :source $MYVIMRC<cr>

" Quickfix toggle
nnoremap <leader>q :call QuickfixToggle()<cr>

" }}}
" BRACE COMPLETION {{{
set showmatch
" inoremap {      {}<Left>
" inoremap {<CR>  {<CR>}<Esc>O
" inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
" inoremap {}     {}
"
" inoremap (      ()<Left>
" inoremap (<CR>  (<CR>)<Esc>O
" inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
" inoremap ()     ()
"
" inoremap [      []<Left>
" inoremap [<CR>  [<CR>]<Esc>O
" inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
" inoremap []     []
" }}}
" GENERAL/TOGGLEABLE SETTINGS {{{
" horizontal split splits below
set splitbelow

" indentation
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
filetype indent off
au BufNewFile,BufRead *.py
  \ setlocal tabstop=2
  \ shiftwidth=2
  \ softtabstop=2
  \ autoindent
  \ expandtab

" line numbers
set number
set relativenumber

" show title
set title

" mouse
set mouse-=a

" utf-8 ftw
" nvim sets utf8 by default, wrap in if because prevents reloading vimrc
if !has('nvim')
  set encoding=utf-8
endif

" Ignore case unless use a capital in search (smartcase needs ignore set)
set ignorecase
set smartcase

" Textwidth for folding
set textwidth=100

" Disable cursor styling in new neovim version
set guicursor=
" }}}
" PLUGINS + CUSTOM FUNCTIONS {{{
" Custom
source ~/.config/nvim/custom/functions.vim
nnoremap <leader>t :call ToggleTodo()<cr>
vnoremap <leader>t :call ToggleTodo()<cr>
nnoremap <leader>T :call ToggleTodoToday()<cr>
vnoremap <leader>T :call ToggleTodoToday()<cr>

" deoplete
let g:deoplete#enable_at_startup=1
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-i>"

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

" sarsi
let sarsivim = 'sarsi-nvim'
if (executable(sarsivim))
  call rpcstart(sarsivim)
endif
nnoremap <leader>l :cfirst<cr>
nnoremap <leader>f :cnext<cr>
nnoremap <leader>g :cprevious<cr>

" Ripgrep for search
if executable('rg')
  set grepprg=rg\ -i\ --vimgrep

  " Ripgrep on /
  command! -nargs=+ -complete=file -bar Rg silent! grep! <args>|cwindow|redraw!
  nnoremap <leader>/ :Rg<SPACE>
endif

" airline
set laststatus=2
let g:airline_left_sep=""
let g:airline_left_alt_sep="|"
let g:airline_right_sep=""
let g:airline_right_alt_sep="|"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " show tab number not number of split panes
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_buffers = 0
" let g:airline#extensions#hunks#enabled = 0
" let g:airline_section_z = ""
if get(g:, 'airline_theme', 'notloaded') == 'notloaded'
  source ~/.config/nvim/custom/customairline.vim
  let g:airline_theme="customairline"
endif

" FZF
function! Fzf_tags_sink(line)
  " Split line in tags file by parts, jump to file + line number
  " <tag><TAB><file><TAB><lineNumber>
  let parts = split(a:line, '\t')
  " execute 'silent e' parts[1]
  execute 'silent :tabedit' parts[1]
  execute 'normal! ' . parts[2] . 'G'
endfunction

if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --no-messages "" .'
endif

let g:fzf_command_prefix = 'Fzf'
let fzf_tags_sink = {'sink': function('Fzf_tags_sink')}
if executable('fzf')
  nnoremap <leader>v :FzfFiles<cr>
  nnoremap <leader>u :call fzf#vim#tags("", fzf_tags_sink)<cr>
  nnoremap <leader>j :call fzf#vim#tags("'".expand('<cword>'), fzf_tags_sink)<cr>
else
  nnoremap <leader>v :CtrlP<Space><cr>
endif

" Racer
set hidden
let g:racer_cmd = "/home/seena/.cargo/bin/racer"

" Neomake
" Gross hack to stop Neomake running when exitting because it creates a zombie cargo check process
" which holds the lock and never exits. But then, if you only have QuitPre, closing one pane will
" disable neomake, so BufEnter reenables when you enter another buffer.
let s:quitting = 0
au QuitPre *.rs let s:quitting = 1
au BufEnter *.rs let s:quitting = 0
au BufWritePost *.rs if ! s:quitting | Neomake | else | echom "Neomake disabled"| endif
let g:neomake_warning_sign = {'text': '?'}

" }}}
