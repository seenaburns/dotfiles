set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "nnkd"

hi Comment ctermfg=black ctermbg=None
hi Identifier cterm=Bold ctermfg=blue ctermbg=None
hi String cterm=None ctermfg=blue ctermbg=None
hi Folded cterm=None ctermfg=None ctermbg=black
" For neocomplcache
hi Pmenu ctermbg=black ctermfg=white
hi PmenuSel ctermbg=blue ctermfg=magenta
" For tabs
hi TabLineFill term=None ctermfg=Black ctermfg=Black
hi TabLine ctermfg=Red ctermbg=Black
hi TabLineSel ctermfg=Blue ctermbg=Black
