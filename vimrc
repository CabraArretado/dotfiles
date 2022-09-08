" THIS IS A SYMLINK FROM ~/dotfiles/
" IF YOU DESIRE THE OLD .vimrc look into the .original_dotfiles
" Felipe M. - .vimrc

let neovim = has('nvim')

""" Auto install vim-plug -------------------------------------------
let data_dir = neovim ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
      silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

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


"######################
"####### REMAPS #######
"######################

" general
noremap ; :
inoremap jk <Esc>
inoremap JK <Esc>
nmap <C-s> :w<cr>
nmap <F9> :w<cr>:!pipenv run python3 %<cr>
vmap <C-y> <cmd>'<,'>*y<cr>

" move
nnoremap J <C-f>
nnoremap K <C-b>
vnoremap J <C-f>
vnoremap K <C-b>

" buffer/tab control
nmap <Tab><Tab> <esc><C-w><C-w>
nmap <Tab>l <Esc>:bn<cr>
nmap <Tab>h <Esc>:bp<cr>
nmap <Tab>d <Esc>:bdelete<cr>
nmap <Tab>v <Esc>:vert<space>sbNext<cr>

" disables arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>


"######################
"####### PLUGINS ######
"######################
call plug#begin()
	Plug 'morhetz/gruvbox' " theme
	Plug 'joshdick/onedark.vim' " theme
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-commentary'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'christoomey/vim-tmux-navigator'
	if neovim
	    Plug 'neovim/nvim-lspconfig'
	    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	    Plug 'nvim-lua/plenary.nvim'
	    Plug 'nvim-telescope/telescope.nvim'
	    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
	    Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
	    Plug 'nvim-lualine/lualine.nvim'
	    Plug 'kyazdani42/nvim-web-devicons'
	    Plug 'kyazdani42/nvim-tree.lua'
	    Plug 'lukas-reineke/indent-blankline.nvim'
	endif
call plug#end()


"#######################
"######### THEME #######
"#######################
colorscheme onedark

"#######################
"### PLUGINS REMAPS ####
"#######################

" Nvim-Tree Remaps
map <F2> :NvimTreeToggle <CR>
map <leader>d :NvimTreeToggle <CR>
map <leader>n :NvimTreeToggle <CR>


" Telescope Remaps
nnoremap <leader>t <cmd>Telescope treesitter<cr>
nnoremap <leader>o <cmd>Telescope oldfiles<cr>
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope builtin<cr>
nnoremap <leader>r <cmd>Telescope registers<cr>
nnoremap <leader>i <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>j <cmd>Telescope jumplist<cr>
nnoremap <leader>gs <cmd>Telescope git_status<cr>
nnoremap <leader>gc <cmd>Telescope git_commits<cr>
nnoremap <leader>gbc <cmd>Telescope git_bcommits<cr>
nnoremap <leader>gb <cmd>Telescope git_branches<cr>
nnoremap <leader>sh <cmd>Telescope search_history<cr>
nnoremap <leader>co <cmd>Telescope commands<cr>
nnoremap <leader>k <cmd>Telescope keymaps<cr>
nnoremap <leader>man <cmd>Telescope man_pages<cr>
nnoremap gr <cmd>Telescope lsp_references<cr>


" Vim Tmux Navegator Options++
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

