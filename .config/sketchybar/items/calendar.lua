local cal = sbar.add("item", "calendar", {
	position = "right",
	update_freq = 1,
	padding_right = 15,
})

local function update()
	local date = os.date("%a. %d %b.")
	local time = os.date("%I:%M:%S %p")
	cal:set({ label = date .. " " .. time })
end

cal:subscribe("routine", update)
cal:subscribe("forced", update)
