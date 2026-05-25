return {
  "luukvbaal/statuscol.nvim",
  config = function()
    local builtin = require("statuscol.builtin")

    require("statuscol").setup(
      {
        -- ft_ignore = { "neo-tree" },
        -- bt_ignore = { "neo-tree" },
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
  end
}
