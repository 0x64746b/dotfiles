"formatting
syntax on
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set nowrap
set textwidth=80
set number
"" show non printing chars
set list
set listchars=tab:»·,trail:·,precedes:<,extends:>

"searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"enable mouse usage
set mouse=a

"shell-like tab completion
"cnoremap <Tab> <C-l>
"cnoremap <Tab><Tab> <C-l><C-d>
"set timeoutlen=250
set wildmode=longest:list

"replace word under cursor
nmap <C-e> :%s/<C-R>=expand("<cword>")<CR>//gc

"jump to function definitions
nmap <C-d>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-d>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-d>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-d>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-d>f :cs find f <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-c> <C-t>

"manage tabs
"set showtabline=1
"map <C-t> <Esc>:tabnew<CR>
"map <Tab> <Esc>:tabn<CR>
"map <S-Tab> <Esc>:tabp<CR>

"manage buffers
"nmap <Tab> :bn<CR>
"nmap <S-Tab> :bp<CR>
"nmap <silent><Tab><Tab> :ls<CR>:b
"nmap ` <C-^>
nmap <C-c> :bn<CR>:bd#<CR>

set autowriteall
set splitright
set splitbelow

"folding
set foldmethod=indent

"coding conventions
""trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * let matchExtraWhitespace = matchadd('ExtraWhitespace', '\s\+$', 20)

command TrimTrailingWhitespace %s/\s\+$//e

""overlong lines
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
set colorcolumn=+1

highlight OverLength ctermbg=lightgrey guibg=lightgrey
autocmd BufWinEnter * let matchOverLength = matchadd('OverLength', '\%>80v.\+', 15)

""fix mem leak upon matching
autocmd BufWinLeave * call clearmatches()


"plugins
" Buffer Explorer
nmap <silent> <Tab><Tab> :BufExplorer<CR>

" Tag List
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Show_One_File=1
