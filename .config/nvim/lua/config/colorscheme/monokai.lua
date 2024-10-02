local monokai = require("monokai")
--local palette = monokai.classic
--local palette = monokai.pro
local palette = monokai.soda
--require('monokai').setup { palette = require('monokai').soda }

if vim.g.neovide then
  if vim.loop.os_uname().sysname == "Linux" then
    palette.base2 = "#31313A"
  elseif vim.loop.os_uname().sysname == "Darwin" then
    palette.base2 = "#413c3a"
  end
else
  palette.base2 = "NONE"
end

palette.base4 = "#555862"
palette.base5 = "#B2AEAB"
palette.base6 = "#8D9695"

monokai.setup({
  palette = palette,
  custom_hlgroups = {
    NormalFloat = {
      bg = palette.base2,
    },
    FloatBorder = {
      fg = palette.white,
    },
    TelescopeNormal = {
      bg = palette.base2,
    },
    FoldColumn = {
      bg = palette.base2,
    },
  },
})
