# alias sudo='sudo -E '
# alias sudo = sudo 
# alias sudoedit = sudoedit 

# lsd aliases
# alias ls = lsd
alias l = ls -l
alias la = ls -a
alias lla = ls -la
# alias lt = ls --tree
alias lt = lsd --tree

# vim aliases
alias vim = nvim
alias vi = vim
alias v = vi

alias cat = bat

alias yay = paru

alias upgrade = topgrade

alias config = /usr/bin/git $'--git-dir=($env.HOME)/.dotfiles/' $'--work-tree=($env.HOME)'
alias lz-config = lazygit $'--git-dir=($env.HOME)/.dotfiles/' $'--work-tree=($env.HOME)'

alias http = ~/.local/bin/http

