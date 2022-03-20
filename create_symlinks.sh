!#/bin/bash

echo "Do you want create the symlinks?"
echo "type yes"
read answer

if [ $answer == "yes" ]; then

    PATH_VIMRC="$HOME/.vimrc"
    PATH_NVIMCONFIG="$HOME/.config/nvim/init.vim"
    PATH_TMUX="$HOME/.tmux.conf"

    PATH_OLD="$HOME/.original_dotfiles"
    mkdir $PATH_OLD

    mv $PATH_VIMRC $PATH_OLD/.vimrc
    mv $PATH_NVIMCONFIG $PATH_OLD/init.vim
    mv $PATH_TMUX $PATH_OLD/.tmux.conf

    DOTFILES_REPO="$HOME/dotfiles"
    ln -sf $DOTFILES_REPO/vimrc $PATH_VIMRC
    ln -sf $DOTFILES_REPO/init.vim $PATH_NVIMCONFIG
    ln -sf $DOTFILES_REPO/tmux.conf $PATH_TMUX

    echo "symlinks created and old saved on ~/.oldfiles"
fi
