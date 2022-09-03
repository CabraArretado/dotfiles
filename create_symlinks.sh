!#/bin/bash

echo "Do you want create the symlinks?"
echo "type yes"
read answer

if [ $answer == "yes" ]; then

    PATH_VIMRC="$HOME/.vimrc"
    PATH_NVIM="$HOME/.config/nvim/"
    PATH_NVIMCONFIG="$HOME/.config/nvim/init.vim"
    PATH_TMUX="$HOME/.tmux.conf"

    PATH_OLD="$HOME/.original_dotfiles"
    mkdir $PATH_OLD

    mv $PATH_VIMRC $PATH_OLD
    mv $PATH_NVIMCONFIG $PATH_OLD
    mv $PATH_TMUX $PATH_OLD

    DOTFILES_REPO="$HOME/dotfiles"

    ln -sf $DOTFILES_REPO/vimrc $PATH_VIMRC
    ln -sf $DOTFILES_REPO/tmux.conf $PATH_TMUX

    # NeoVim
    ln -sf $DOTFILES_REPO/init.vim $PATH_NVIMCONFIG
    sudo ln -sf $DOTFILES_REPO/lua $PATH_NVIM/lua

    echo "symlinks created and old saved on ~/.oldfiles"
fi

