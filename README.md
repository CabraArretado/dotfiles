# Instructions
Those are my configs for Vim and Neovim, intended for my use.

## To update the local:
clone this repo in your home directory
run `updatelocal.sh`

## To update the repo:
run `updategithub.sh`
commit your changes
`git push`

## Optional autoupdate
If you want to not having to update manualy doing the two steps up you might use aias in your `.bashrc` or `.zshrc`:

- To update local machine: `alias vimupdate="cd ~/vim_nvim_configs/; git pull origin master; ./updatelocal.sh;`

- To update GitHub Repo: `alias vimpush="cd ~/vim_nvim_configs/; ./updategithub.sh; git add .; git commit -m 'update'; git push;`
# dotfiles
