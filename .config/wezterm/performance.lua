local wezterm = require 'wezterm'
local M = {}

function M.apply_to_config(config)
  if config.front_end == 'Software' then
    -- CPU protection configuration profiles
    config.animation_fps = 1
    config.cursor_blink_ease_in = 'Constant'
    config.cursor_blink_ease_out = 'Constant'
  else
    -- Target the prioritized hardware adapter for WebGPU rendering
    config.max_fps = 200
    config.scrollback_lines = 10000

    config.front_end = "WebGpu"
    config.webgpu_power_preference = "HighPerformance"

    -- Keep conditionals ONLY for the underlying graphics APIs
    if wezterm.target_triple:find("linux") then
      config.enable_wayland = true
    elseif wezterm.target_triple:find("apple") then
    end
  end
end

return M
