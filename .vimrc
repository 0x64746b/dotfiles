syntax on
set nowrap
set textwidth=80

" trailing whitespaces
"" highlighting
""" show non printing chars
set list
set listchars=tab:»·,trail:·
""" show long lines
set listchars+=precedes:<,extends:>
""" theme trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * let matchExtraWhitespace = matchadd('ExtraWhitespace', '\s\+$', 20)
"" trimming
command KillTrailingWhitespace %s/\s\+$//e

"overlong lines
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
set colorcolumn=+1

highlight OverLength ctermbg=lightgrey guibg=lightgrey
autocmd BufWinEnter * let matchOverLength = matchadd('OverLength', '\%>80v.\+', 15)

"fix mem leak upon matching
autocmd BufWinLeave * call clearmatches()
