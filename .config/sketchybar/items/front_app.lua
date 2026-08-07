local front_app = sbar.add("item", "front_app", {
  position = "center",
  icon = {
    drawing = false
  },
  label = {
    font = {
      style = "Bold",
      size = 12.0,
    },
    padding_left = 10,
    padding_right = 10
  }
})

front_app:subscribe("front_app_switched", function(env)
  front_app:set({
    label = {
      string = env.INFO
    }
  })

  -- Or equivalently:
  -- sbar.set(env.NAME, {
  --   label = {
  --     string = env.INFO
  --   }
  -- })
end)
