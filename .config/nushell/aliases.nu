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

let pyPath = $'(^python3 -m site --user-base)/bin'

alias core-http = http

def http [params] {
  nu -c $'($pyPath)/http ($params)'
}

def disown [...command: string] {
    sh -c '"$@" </dev/null >/dev/null 2>/dev/null & disown' $command.0 ...$command
}
