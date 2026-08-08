local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
  height = 24,
  color = colors.transparent,
  border_color = colors.bar.border,
  -- shadow = true,
  sticky = true,
  padding_right = 15,
  padding_left = 15,
  blur_radius = 50,
  topmost = "window",
})
