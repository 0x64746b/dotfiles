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
match ExtraWhitespace /\s\+$/
""" enable
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
"" trimming
command KillTrailingWhitespace %s/\s\+$//e

"overlong lines
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
set colorcolumn=+1

highlight OverLength ctermbg=lightgrey guibg=lightgrey
match OverLength /\%>80v.\+/
autocmd BufWinEnter * match OverLength /\%>80v.\+/

"fix mem leak upon matching
autocmd BufWinLeave * call clearmatches()
