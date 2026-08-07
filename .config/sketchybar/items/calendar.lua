local cal = sbar.add("item", "calendar", {
  icon = {
    padding_right = 0,
    font = {
      style = "Black",
      size = 12.0,
    },
  },
  label = {
    align = "right",
  },
  position = "right",
  update_freq = 1,
})

local function update()
  local date = os.date("%a. %d %b.")
  local time = os.date("%I:%M:%S %p")
  cal:set({ label = date .. " " .. time })
end

cal:subscribe("routine", update)
cal:subscribe("forced", update)
