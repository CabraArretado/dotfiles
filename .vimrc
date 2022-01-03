" .vimrc
" Felipe Moura

""" Auto install vim-plug -------------------------------------------
let neovim = has('nvim')
let data_dir = neovim ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
      silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

""" Geral -----------------------------------------------------------
set number " show line number
set mouse=a " allows mouse to be used
set autoindent " new lines inherit the identetions of previous line
set copyindent
set hlsearch

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

" set shell
if has('unix')
  let shell='bash'
endif

" autocomplete
set complete+=kspell
set shortmess+=c
set completeopt=menuone,longest,preview

"" Maps +
" general
map ; :
imap jk <Esc>
imap JK <Esc>
nmap <C-s> :w<cr>
nmap <F9> :w<cr>:!pipenv run python3 %<cr>
" tab control
nmap <Tab><Tab> <esc><C-w><C-w>
nmap <Tab>t <Esc>:bn<cr>
nmap <Tab><Right> <Esc>:bn<cr>
nmap <Tab>l <Esc>:bn<cr>
nmap <Tab><Left> <Esc>:bp<cr>
nmap <Tab>h <Esc>:bp<cr>
nmap <Tab>d <Esc>:bdelete<cr>
nmap <Tab>v <Esc>:vert<space>sbNext<cr>


" disables arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

""" Plugins ---------------------------------------------------------
call plug#begin()
	Plug 'preservim/nerdtree'
	Plug 'vim-scripts/AutoComplPop'
	Plug 'vim-airline/vim-airline'
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-commentary'
	Plug 'sonph/onehalf', { 'rtp': 'vim' }
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	if neovim
	    Plug 'neovim/nvim-lspconfig'
	    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	    Plug 'nvim-lua/plenary.nvim'
	    Plug 'nvim-telescope/telescope.nvim'
	endif
call plug#end()

"" Plug options ++
" NERDtree options
map <F2> :NERDTreeToggle<CR>
map <leader>n :NERDTreeToggle<CR>

let NERDTreeShowHidden=1

" Telescope opts
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope builtin<cr>
nnoremap <leader>d <cmd>Telescope file_browser<cr>
nnoremap <leader>l <cmd>Telescope live_grep<cr>
nnoremap <leader>i <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>r <cmd>Telescope lsp_references<cr>

" Onehalf theme options
syntax on
set t_Co=256
set cursorline
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
" lightline
let g:lightline= { 'colorscheme': 'onehalfdark' }

" Vim Airline options
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" let g:airline_left_sep = ''
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_sep = ''

