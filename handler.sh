!#/bin/bash
echo What do you want to do?
echo "(d)ownload or (u)pload"
read answer0
echo Which one?
echo "(v)im or (t)mux"
read answer1

if [ $answer0 == "d" ]; then
    if [ $answer1 == "v" ]; then
	./scripts/download_vim_config.sh
	echo "Vim configs downloaded and aplied"
    elif [ $answer1 == "t" ]; then
	./scripts/download_tmux_config.sh
	echo "Tmux configs downloaded and aplied"
    else
    	echo "Please, select one of the options"
    fi
elif [ $answer0 == "u" ]; then
    if [ $answer1 == "v" ]; then
	./scripts/upload_vim_config.sh
	echo "Vim configs ready to be commited and pushed to GitHub"
    elif [ $answer1 == "t" ]; then
	./scripts/upload_tmux_config.sh
	echo "Tmux configs ready to be commited and pushed to GutHub"
    else
    	echo "Please, select one of the options"
    fi
fi

