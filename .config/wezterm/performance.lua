local wezterm = require 'wezterm'
local M = {}

-- 1. Scan and rank system graphics hardware
local gpus = wezterm.gui.enumerate_gpus()
local selected_gpu = nil

-- First pass: Look exclusively for high-performance Discrete GPUs
for _, gpu in ipairs(gpus) do
  if gpu.device_type == 'DiscreteGpu' then
    selected_gpu = gpu
    break
  end
end

-- Second pass: Fall back to Integrated GPUs if no Discrete GPU was found
if not selected_gpu then
  for _, gpu in ipairs(gpus) do
    if gpu.device_type == 'IntegratedGpu' then
      selected_gpu = gpu
      break
    end
  end
end

function M.apply_to_config(config)
  if selected_gpu then
    -- Target the prioritized hardware adapter for WebGPU rendering
    config.max_fps = 200
    config.scrollback_lines = 10000

    config.front_end = "WebGpu"
    config.webgpu_preferred_adapter = selected_gpu
    config.webgpu_power_preference = "HighPerformance"

    -- Keep conditionals ONLY for the underlying graphics APIs
    if wezterm.target_triple:find("linux") then
      config.enable_wayland = true
    elseif wezterm.target_triple:find("apple") then
    end
  else
    -- Software-bound rendering if absolutely no hardware is detected
    config.front_end = "Software"

    -- CPU protection configuration profiles
    config.animation_fps = 1
    config.cursor_blink_ease_in = 'Constant'
    config.cursor_blink_ease_out = 'Constant'
  end
end

return M
