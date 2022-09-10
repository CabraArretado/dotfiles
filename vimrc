" THIS IS A SYMLINK FROM ~/dotfiles/
" IF YOU DESIRE THE OLD .vimrc look into the .original_dotfiles
" Felipe M. - .vimrc
"
"KEEPING THE REMAPS FOR THE VSCODE PLUGIN
"######################
"### MAIN CONFIG ######
"######################
set number " show line number
set mouse=a " allows mouse to be used
set autoindent " new lines inherit the identetions of previous line
set copyindent
set hlsearch
set autoread

set cursorline
set hidden
set shiftwidth=4 " number of spaces to use for autoindenting
set splitright
set clipboard=unnamed
syntax enable

let mapleader = ","
let maplocalleader = "\\"

" disable annoying beep
set noerrorbells
set vb t_vb=

" status line
set stl=%f\ %m\ %r\ line\ %l\ of\ %L\ [%p%%],\ column\ %c%=Type:%y
set laststatus=2

" autocomplete
set complete+=kspell
set shortmess+=c
set completeopt=menuone,longest,preview

syntax on
set t_Co=256
set cursorline


""######################
""####### REMAPS #######
""######################

"" general
noremap ; :
inoremap jk <Esc>
inoremap JK <Esc>
nmap <C-s> :w<cr>
nmap <F9> :w<cr>:!pipenv run python3 %<cr>
vmap <C-y> <cmd>'<,'>*y<cr>

"" move
nnoremap J <C-f>
nnoremap K <C-b>
vnoremap J <C-f>
vnoremap K <C-b>

"" buffer/tab control
nmap <Tab><Tab> <esc><C-w><C-w>
nmap <Tab>l <Esc>:bn<cr>
nmap <Tab>h <Esc>:bp<cr>
nmap <Tab>d <Esc>:bdelete<cr>
nmap <Tab>v <Esc>:vert<space>sbNext<cr>

"" disables arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
