# File with alias and functins for shell
# source this file in the ~/.bashrc or ~/.zshrc
#################################################
alias zshconfig="vi ~/.zshrc; source ~/.zshrc"
alias vimconfig="vi ~/.vimrc"
alias python="python3"
alias pip="pip3"
alias vi="nvim"
# Alias Git
alias gco="git checkout"
alias gnewb="git checkout -b"
alias gs="git status"
alias gds="git diff --stat"
alias gd="git diff"
alias gdm="git diff origin master"
alias gcommitall="git add .
git commit -m"
alias gpush="git push"
alias gc="git commit -m"
alias gp="git pull"
alias gf="git fetch"
alias gl="git log --graph --decorate --oneline -15"
# Alias General
alias vi="nvim"
alias vim="nvim"
alias vimconfig="vi ~/.vimrc"
alias tmuxconfig="vi ~/.tmux.conf"
alias nvimconfig="vi ~/.config/nvim/init.vim"
alias t="tree -L 1 -a --dirsfirst"
alias tt="tree -L 2 -a --dirsfirst"
alias la="ls -a"
alias c="clear"
alias src="cd ~/Workspace/"

# Functions
vop()
{
    vi $(fzf)
}

vim_update_github()
{
    cd ~/vim_nvim_configs/
    ./updategithub.sh
    git add .
    git commit -m "update from air"
    git push
}

vim_update_local()
{
    cd ~/vim_nvim_configs/
    git pull
    ./updatelocal.sh
}
# General variables
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
# Sets Vim keybidings to the terminal
bindkey -v

