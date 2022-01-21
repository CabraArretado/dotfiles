# File with alias and functins for shell
# source this file in the ~/.bashrc or ~/.zshrc

alias g="git"
alias ga="git add"
alias gaa="git add --all"
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
alias gcleanall="git checkout -- . && git clean -df"

# Alias General
alias zshconfig="vi ~/.zshrc; source ~/.zshrc;"
alias vi="nvim"
alias vim="nvim"
alias pvi="pipenv run nvim"
alias vimconfig="vi ~/.vimrc"
alias nvimconfig="vi ~/.config/nvim/init.vim"
alias tmuxconfig="vi ~/.tmux.conf"
alias t="tree -L 1 -a --dirsfirst"
alias tt="tree -L 2 -a --dirsfirst"
alias la="ls -a"
alias c="clear"
alias pip="pip3"
alias vimupdate="cd ~/dotfiles/; git pull origin master; .scripts/updatelocal.sh;"
alias vimpush="cd ~/dotfiles/; .scripts/updategithub.sh; git add .; git commit -m 'update'; git push;"
alias sourcezsh="source ~/.zshrc"


# General variables: to access C-x C-e
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

# Sets Vim keybidings to the terminal
bindkey -v

git_exclude(){
 vi .git/info/exclude
}

# fzf stuff
vop()
{
    vi $(fzf)
}
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

