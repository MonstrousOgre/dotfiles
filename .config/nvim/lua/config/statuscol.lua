local builtin = require("statuscol.builtin")

require("statuscol").setup(
  {
    relculright = true,
    segments = {
      { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
      { text = { "%s", " " },             click = "v:lua.ScSa" },
      -- { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
      { text = { "%l", " " },             click = "v:lua.ScLa" },
      { text = { "%r", " " },             click = "v:lua.ScLa" },
    }
  }
)
