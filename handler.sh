!#/bin/bash
echo What do you want to do?
echo "(d)ownload or (u)pload"
read answer0
echo Which one?
echo "(v)im or (t)mux or (b)oth"
read answer1

if [ $answer0 == "d" ]; then
    if [ $answer1 == "v" ]; then
	~/dotfiles/scripts/download_vim_config.sh
	echo "Vim configs downloaded and applied"
    elif [ $answer1 == "t" ]; then
	~/dotfiles/scripts/download_tmux_config.sh
	echo "Tmux configs downloaded and applied"
    elif [ $answer1 == "b" ]; then
	~/dotfiles/scripts/download_tmux_config.sh
	~/dotfiles/scripts/download_vim_config.sh
	echo "Tmux and Vim configs downloaded and applied"
    else
    	echo "Please, select one of the options"
    fi
elif [ $answer0 == "u" ]; then
    if [ $answer1 == "v" ]; then
	~/dotfiles/scripts/upload_vim_config.sh
	echo "Vim configs ready to be commited and pushed to GitHub"
    elif [ $answer1 == "t" ]; then
	~/dotfiles/scripts/upload_tmux_config.sh
	echo "Tmux configs ready to be commited and pushed to GutHub"
    elif [ $answer1 == "b" ]; then
	~/dotfiles/scripts/upload_tmux_config.sh
	~/dotfiles/scripts/upload_vim_config.sh
	echo "Tmux and Vim configs ready to be commited and pushed to GutHub"
    else
    	echo "Please, select one of the options"
    fi
fi

