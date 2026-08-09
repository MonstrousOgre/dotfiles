local app_icons = require("/scripts/icon_map")

local front_app = sbar.add("item", "front_app", {
	position = "center",
	padding_left = 10,
	padding_right = 10,
	icon = {
		drawing = true,
		font = {
			family = "sketchybar-app-font",
			style = "Regular",
			size = 15.0,
		},
	},
	label = {
		font = {
			style = "Bold",
			size = 13.0,
		},
		padding_left = 10,
	},
})

front_app:subscribe("front_app_switched", function(env)
	front_app:set({
		label = {
			string = env.INFO,
		},
		icon = {
			string = app_icons[env.INFO],
		},
	})

	-- Or equivalently:
	-- sbar.set(env.NAME, {
	--   label = {
	--     string = env.INFO
	--   }
	-- })
end)
