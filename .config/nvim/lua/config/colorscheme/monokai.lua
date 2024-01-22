local monokai = require("monokai")
--local palette = monokai.classic
--local palette = monokai.pro
local palette = monokai.soda
--require('monokai').setup { palette = require('monokai').soda }

palette.base2 = "NONE"
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
