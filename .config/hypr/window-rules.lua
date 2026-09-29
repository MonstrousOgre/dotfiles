---@module 'hl'

hl.window_rule({
	name = "match_class___org_kd",
	match = {
		class = "float true",
	},
})

hl.window_rule({
	name = "match_class___proton",
	match = {
		class = "float true",
	},
})

hl.window_rule({
	name = "match_class___pavuco",
	match = {
		class = "float true",
	},
})

hl.window_rule({
	name = "match_class___zoom__",
	match = {
		class = "float true",
	},
})

hl.window_rule({
	name = "match_class_zenity",
	match = {
		class = "float true",
	},
})

hl.window_rule({
	name = "match_class_blueman-",
	match = {
		class = "float true",
	},
})

hl.window_rule({
	name = "match_class___wofi__",
	match = {
		class = "no_anim true",
	},
})

hl.window_rule({
	name = "match_class___micros",
	match = {
		title = "title ^(Microsoft Teams Notification)$",
	},
})

-- hl.window_rule({
--   name  = "match_title_____",
--   match = {
--     match = "class ^()$",
--   },
--   -- TODO: review rule: "match:title ^()$"
-- })

hl.window_rule({
	name = "match_class___xdg-de",
	match = {
		class = "no_blur true",
	},
})

hl.window_rule({
	name = "match_class___xdg-de",
	match = {
		class = "border_size 0",
	},
})

hl.window_rule({
	name = "match_class___xdg-de",
	match = {
		class = "no_shadow true",
	},
})

hl.window_rule({
	name = "match_class___flames",
	match = {
		class = "flames",
	},
	no_anim = true,
})

hl.window_rule({
	name = "match_class___flames",
	match = {
		class = "flames",
	},
	float = true,
})

hl.window_rule({
	name = "match_class___flames",
	match = {
		class = "flames",
	},
	pin = true,
})

hl.window_rule({
	name = "match_class___flames",
	match = {
		class = "flames",
	},
	monitor = 1,
})

hl.window_rule({
	name = "match_class___satty",
	match = {
		class = "com.gabm.satty",
	},
	float = true,
})

hl.layer_rule({
	match = {
		namespace = "gtk-layer-shell",
	},
	blur = true,
})

hl.layer_rule({
	match = {
		namespace = "rofi",
	},
	blur = true,
})

hl.layer_rule({
	match = {
		namespace = "quickshell",
	},
	blur = true,
	blur_popups = true,
	ignore_alpha = 0.08,
})

hl.layer_rule({
	match = {
		namespace = "gtk-layer-shell",
	},
	ignore_alpha = 0.03,
})

hl.layer_rule({
	match = {
		namespace = "rofi",
	},
	ignore_alpha = 0.03,
})
