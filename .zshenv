source "$HOME/.cargo/env"
typeset -U PATH path
NPM_PACKAGES="${HOME}/.npm-packages"
path=("$HOME/.local/bin" "$HOME/.luarocks/bin" "$NPM_PACKAGES/bin" "$path[@]")
export PATH

#export PATH="$HOME/.dotnet/tools:$PATH"

export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="kitty"

# Use bat as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export QT_QPA_PLATFORMTHEME='qt5ct'
#export QT_STYLE_OVERRIDE=kvantum

# For visual paradigm
export _JAVA_AWT_WM_NONREPARENTING=1

source "$HOME/.shell-env"
