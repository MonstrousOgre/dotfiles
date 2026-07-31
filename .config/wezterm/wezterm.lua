-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.enable_kitty_graphics = true

require 'appearance'.apply_to_config(config)

require 'keybindings'.apply_to_config(config)

require 'performance'.apply_to_config(config)

return config
