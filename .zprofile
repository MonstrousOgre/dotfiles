if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec Hyprland
fi
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 2 ]; then
  exec startx
fi
