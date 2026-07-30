-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

require 'appearance'.apply_to_config(config)

require 'keybindings'.apply_to_config(config)

require 'performance'.apply_to_config(config)

return config
