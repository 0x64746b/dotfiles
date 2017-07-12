"vundle
" $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" bufexplorer
Plugin 'jlanzarotta/bufexplorer'

" Ctrl-P
Plugin 'kien/ctrlp.vim'

" jedi-vim
" $ cd ~/.vim/bundle/jedi-vim
" $ git submodule update --init
Plugin 'davidhalter/jedi-vim'

" supertab
Plugin 'ervandew/supertab'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

"colorscheme
" $ wget -P ~/.vim/colors/ https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
"colorscheme molokai
set t_Co=256
set background=dark

"change cursor in insert mode
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"
" eliminate lag when switching back to normal mode
set timeoutlen=1000 ttimeoutlen=0

"formatting
syntax on
filetype on
filetype plugin indent on
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
"command ReplaceUnderCursor :%s/<C-R>=expand("<cword>")<CR>//gc

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
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

set splitright
set splitbelow

"quickfix buffer
nmap cf :cfirst<CR>
nmap cn :cnext<CR>
nmap cp :cprev<CR>

aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

"leader
let mapleader=","

"folding
set foldmethod=indent
set foldlevelstart=99

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

" MiniBufExpl
let g:miniBufExplSplitBelow=0

" Tag List
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Show_One_File=1

" NERD Tree
"  auto-start
"autocm vimenter * NERDTree
map <C-e> :NERDTreeToggle<CR>

" SuperTab
autocmd FileType python setlocal completeopt-=preview
let g:SuperTabDefaultCompletionType = "context"

" Rope
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
map <leader>f :RopeFindOccurrences<CR>

" Ack
nmap <leader>a <Esc>:Ack!
