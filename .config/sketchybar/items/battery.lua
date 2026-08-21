local icons = require("icons")

local battery = sbar.add("item", "battery", {
	position = "right",
	icon = {
		font = {
			style = "Regular",
			size = 19.0,
		},
		padding_left = 10,
	},
	label = {
		drawing = true,
		padding_left = 10,
	},
	update_freq = 120,
})

local function battery_update()
	sbar.exec("pmset -g batt", function(batt_info)
		local icon = "!"

		local found, _, charge = batt_info:find("(%d+)%%")
		if string.find(batt_info, "AC Power") then
			icon = icons.battery.charging
		else
			if found then
				charge = tonumber(charge)
			end

			if found and charge > 90 then
				icon = icons.battery._90
			elseif found and charge > 60 then
				icon = icons.battery._60
			elseif found and charge > 30 then
				icon = icons.battery._30
			elseif found and charge > 10 then
				icon = icons.battery._10
			else
				icon = icons.battery._0
			end
		end

		battery:set({ icon = icon })
		battery:set({ label = charge .. "%" })
	end)
end

battery:subscribe({ "routine", "power_source_change", "system_woke" }, battery_update)
