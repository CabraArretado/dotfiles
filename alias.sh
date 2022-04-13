# Dotfiles alias
DOTPATH="$HOME/dotfiles"
alias dotfiles="cd $DOTPATH"

# Alias Git
alias g="git"
alias ga="git add"
alias gaa="git add --all"
alias gb="git branch"
alias gc="git commit -v -m"
alias gca="git add --all && git commit -v -m"
alias gc!="git commit -v --amend -m"
alias gco="git checkout"
alias gd="git diff"
alias gdm="git diff master"
alias gdca="git diff --cached"
alias gds="git diff --stat"
alias gf="git fetch"
alias gfetch="git fetch"
alias gl="git log --graph --decorate --oneline -15"
alias gnewb="git checkout -b"
alias gp="git pull"
alias gpush="git push"
alias gs="git status"
alias gcleanall="git reset && git checkout -- . && git clean -df"

# Alias Tmux
alias tns="tmux new -s" # new session by name
alias ta="tmux a -t" # attach by name
alias tls="tmux ls"

# Alias General
alias zshconfig="vi ~/.zshrc; source ~/.zshrc;"
alias vimconfig="vi ~/.vimrc"
alias nvimconfig="vi ~/.config/nvim/init.vim"
alias tmuxconfig="vi ~/.tmux.conf"
alias t="tree -L 1 -a --dirsfirst"
alias tt="tree -L 2 -a --dirsfirst"
alias la="ls -a"
alias c="clear"
alias szsh="source ~/.zshrc"

aliasconfig()
{
    nvim $HOME/dotfiles/alias.sh

    if [[ $ZSH_VERSION ]] ; then
	source $HOME/.zshrc
    fi
    if [[ $BASH_VERSION ]] ; then
	source $HOME/.bashrc
    fi
}

# Vim related
alias vi="nvim"
alias pvi="pipenv run nvim"
alias confighandler="~/dotfiles/handler.sh"

# Docker
alias dc="docker-compose"

# Python related
alias ipython="ipython --TerminalInteractiveShell.editing_mode=vi"
alias ipy="ipython --TerminalInteractiveShell.editing_mode=vi"
alias pip="pip3"

# General variables: to access C-x C-e
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

# Sets Vim keybidings to the terminal
if [[ $ZSH_VERSION ]] ; then
    bindkey -v
    bindkey jk vi-cmd-mode
fi
if [[ $BASH_VERSION ]] ; then
    set -o vi
    bind '"jk":vi-movement-mode'
fi

# Functions
git_exclude()
{
    if [ -d .git ] && echo .git || git rev-parse --git-dir > /dev/null 2>&1 ; then
	FILE=$(fzf)
	if ! [[ $FILE ]]; then
	    vi .git/info/exclude
	else
	    echo $FILE >> .git/info/exclude
	fi
    fi
}

vop()
{
    OPENFILE=$(fzf)
    if ! [[ $OPENFILE ]]; then
	echo "Nenhum arquivo selectionado LOL"
    else
	vi $OPENFILE
    fi
}

# fzf stuff
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

