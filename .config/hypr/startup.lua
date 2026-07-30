---@module 'hl'
---
-- Autostart
hl.on("hyprland.start", function()
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
  hl.exec_cmd("playerctld daemon")
  hl.exec_cmd("/usr/bin/ags run --gtk 3 > " .. os.getenv("HOME") .. "/ags.log")
  hl.exec_cmd("nm-applet --indicator")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("wl-clip-persist --clipboard regular")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("hyprpm reload")
end)

if hl.plugin.hyprglass then
  local hg = hl.plugin.hyprglass

  hg.config({
    default_theme = "light",
    -- default_preset = "glass",
    layers = { enabled = 1 },
  })

  -- Layer surfaces: each call whitelists the namespace and configures it
  hg.layer("gtk-layer-shell", { theme = "light" })
  hg.layer("rofi", { theme = "light" })
end
