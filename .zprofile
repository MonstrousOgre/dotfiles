if [[ $(uname -s) == "Linux" ]]; then
  if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec Hyprland
    #exec startplasma-wayland
    #exec startx
  fi
  if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 2 ]; then
    #exec startx
  fi
fi
if [[ $(uname -s) == "Darwin" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
