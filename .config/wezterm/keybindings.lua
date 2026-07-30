local wezterm = require 'wezterm'
local M = {}

function M.apply_to_config(config)
  config.keys = {
    {
      key = 't',
      mods = 'CTRL',
      action = wezterm.action.SpawnTab 'CurrentPaneDomain',
    },
    {
      key = 'w',
      mods = 'CTRL',
      action = wezterm.action.CloseCurrentTab { confirm = true },
    },

  }
end

return M
