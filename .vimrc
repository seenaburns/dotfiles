set showcmd
set ruler
" set tw=79

" Dark Gray Line Numbers
set number
set numberwidth=3
highlight LineNr term=bold cterm=NONE ctermfg=DarkGray ctermbg=NONE gui=NONE guifg=DarkGray guibg=NONE

syntax on

inoremap jj <Esc>

augroup vimrc_autocmds
	autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
	autocmd BufEnter * match OverLength /\%80v.*/
augroup END
