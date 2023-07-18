if [[ $(uname -s) == "Linux" ]]; then
  if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    #exec Hyprland
    exec startplasma-wayland
  fi
  if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 2 ]; then
    exec startx
  fi
fi
