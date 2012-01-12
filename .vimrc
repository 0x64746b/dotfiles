syntax on
set nowrap

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
autocmd BufWinLeave * call clearmatches()
"" trimming
command KillTrailingWhitespace %s/\s\+$//e
