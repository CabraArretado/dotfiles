!#/bin/bash

echo What do you want to update?

echo "(v)im or (t)mux"
read answer
if [ $answer == "v" ]; then
    ./scripts/download_vim_config.sh
elif [ $answer == "t" ]; then
    ./scripts/download_tmux_config.sh
fi
