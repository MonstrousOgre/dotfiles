source "$HOME/.cargo/env"
typeset -U PATH path
PIP_PATH=`python3 -m site --user-base`
NPM_PACKAGES="${HOME}/.npm-packages"
path=("$HOME/.local/bin" "$PIP_PATH/bin" "$HOME/.luarocks/bin" "$NPM_PACKAGES/bin" "$HOME/.spicetify" "$path[@]")
export PATH

#export PATH="$HOME/.dotnet/tools:$PATH"

export XDG_CONFIG_HOME="$HOME/.config"

export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="kitty"

# Use bat as manpager
#export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANPAGER="bat -l man -p"

#export QT_QPA_PLATFORMTHEME='qt5ct'
#export QT_STYLE_OVERRIDE=kvantum

# For visual paradigm
export _JAVA_AWT_WM_NONREPARENTING=1

source "$HOME/.sh-env"

if [[ $(uname -s) == "Linux" ]]; then
  export SHELL=/usr/bin/zsh
fi
