local wezterm = require 'wezterm'
local M = {}

function M.apply_to_config(config)
  config.max_fps = 200
  config.animation_fps = 1
  config.scrollback_lines = 10000

  -- Keep conditionals ONLY for the underlying graphics APIs
  if wezterm.target_triple:find("linux") then
    config.front_end = "OpenGL" -- Best for Linux Nvidia
    config.enable_wayland = true
  elseif wezterm.target_triple:find("apple") then
    config.front_end = "WebGpu" -- Best for Apple Metal
  end
end

return M
