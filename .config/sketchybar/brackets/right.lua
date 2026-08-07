local colors = require("colors")

local bracket = sbar.add("bracket", "right", { "battery", "calendar", }, {
  background = {
    height = 24,
    color = colors.bar.bg,
    border_color = colors.bar.border,
    border_width = 1,
    corner_radius = 8,
  },
  -- shadow = true,
  blur_radius = 50,
})
