local wezterm = require 'wezterm'
local M = {}

function M.apply_to_config(config)
  -- Set  base color scheme
  config.color_scheme = 'Monokai Soda'
  config.window_background_opacity = 0.8

  -- config.font_size = 10

  -- Apply background color based on the platform
  local background = '#000000'

  if wezterm.target_triple:find('linux') then
    background = '#1d212f'
  elseif wezterm.target_triple:find('apple') then
    background = '#413c3a'
  end

  config.colors = { background = background }

  config.font = wezterm.font 'Hermit'
  config.hide_tab_bar_if_only_one_tab = true
end

return M
