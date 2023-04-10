--local components = require('feline.presets')["default"]

local components = {
  active = {},
  inactive = {},
}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})

table.insert(components.active[1], {
  provider = "vi_mode",
  hl = function()
    return {
      name = require("feline.providers.vi_mode").get_mode_highlight_name(),
      fg = require("feline.providers.vi_mode").get_mode_color(),
      style = "bold",
    }
  end,
  left_sep = " ",
  right_sep = " ",
  -- uncomment the next line to disable icons for this component and use the mode name instead
  -- icon = ''
})

table.insert(components.active[1], {
  provider = "git_branch",
  left_sep = " ",
  right_sep = " ",
  hl = {
    fg = "yellow",
  },
})

table.insert(components.active[1], {
  provider = "git_diff_added",
  right_sep = " ",
  hl = {
    fg = "green",
  },
})

table.insert(components.active[1], {
  provider = "git_diff_changed",
  right_sep = " ",
  hl = {
    fg = "orange",
  },
})

table.insert(components.active[1], {
  provider = "git_diff_removed",
  right_sep = " ",
  hl = {
    fg = "red",
  },
})

table.insert(components.active[2], {
  provider = "file_info",
  hl = {
    style = "bold",
  },
})

table.insert(components.active[3], {
  provider = "diagnostic_info",
  right_sep = " ",
  hl = "DiagnosticSignInfo",
  icon = " ",
})

table.insert(components.active[3], {
  provider = "diagnostic_hints",
  right_sep = " ",
  hl = "DiagnosticSignHint",
  icon = " ",
})

table.insert(components.active[3], {
  provider = "diagnostic_warnings",
  right_sep = " ",
  hl = "DiagnosticSignWarn",
  icon = " ",
})

table.insert(components.active[3], {
  provider = "diagnostic_errors",
  right_sep = " ",
  hl = "DiagnosticSignError",
  icon = " ",
})

table.insert(components.active[3], {
  provider = "lsp_client_names",
  left_sep = " ",
  right_sep = " ",
})

--table.insert(components.active[3], {
--    provider = 'file_encoding',
--    right_sep = ' ',
--})

table.insert(components.active[3], {
  provider = "file_type",
  right_sep = " ",
  hl = {
    fg = "skyblue",
    style = "bold",
  },
})

table.insert(components.active[3], {
  provider = "position",
  right_sep = " ",
  hl = {
    fg = "yellow",
  },
})

--table.insert(components.active[3], {
--    provider = 'line_percentage',
--    right_sep = ' ',
--})
--
--table.insert(components.active[3], {
--    provider = 'scroll_bar',
--})

require("feline").setup({
  theme = {
    bg = "NONE",
  },
  components = components,
})
