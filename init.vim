" THIS IS A SYMLINK FROM ~/dotfiles/
" IF YOU DESIRE THE OLD init.vim look into the .original_dotfiles
" Felipe M. - init.vim

" adds vim configs to neovim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua require('init')
