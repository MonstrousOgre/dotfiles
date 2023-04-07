local monokai = require("monokai")
--local palette = monokai.classic
--local palette = monokai.pro
local palette = monokai.soda
--require('monokai').setup { palette = require('monokai').soda }

--palette.none = 'NONE'
--palette.base1 = 'NONE'
palette.base2 = "NONE"
--palette.yellow = "#E1E120"

monokai.setup({
  palette = palette,
  custom_hlgroups = {
    NormalFloat = {
      bg = palette.base2,
    },
    FloatBorder = {
      fg = palette.white,
    },
  },
})
