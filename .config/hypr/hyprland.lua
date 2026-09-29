---@module 'hl'

hl.monitor({
	-- output = "eDP-1",
	output = "desc:BOE 0x0AE3",
	mode = "preferred",
	position = "0x0",
	scale = 1,
})

hl.monitor({
	output = "desc:Acer Technologies XV272U V3 1322131231233",
	mode = "2560x1440@180",
	position = "1920x-360",
	scale = 1,
})

local startup = require("startup")

local workspaces = require("workspaces")

local window_rules = require("window-rules")

local shortcuts = require("shortcuts")

local env = require("env")

-- For all categories, see https://wiki.hyprland.org/Configuring/Variables/

hl.config({
	input = {
		kb_layout = "us,ru",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		follow_mouse = 2,
		kb_options = "grp:alt_caps_toggle",
		touchpad = {
			--natural_scroll = no
			natural_scroll = true,
		},
		sensitivity = 0,
		-- -1.0 - 1.0, 0 means no modification.
		numlock_by_default = true,
	},
})

hl.config({
	general = {
		-- See https://wiki.hyprland.org/Configuring/Variables/ for more
		gaps_in = 10,
		gaps_out = 20,
		border_size = 1,
		col = {
			active_border = 0xffE97B88,
			inactive_border = 0x001d212f,
		},
		layout = "dwindle",
	},
})

hl.config({
	decoration = {
		-- See https://wiki.hyprland.org/Configuring/Variables/ for more
		rounding = 20,
		blur = {
			enabled = true,
			size = 10,
			passes = 3,
			noise = 0.1,
			contrast = 1.4,
			new_optimizations = true,
			popups = true,
		},
		shadow = {
			enabled = true,
			range = 9,
			render_power = 3,
			color = "rgba(31313a11)",
		},
	},
})

hl.config({
	animations = {
		enabled = true,
		-- Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
	},
})

hl.config({
	dwindle = {
		-- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
		-- pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
		preserve_split = true,
		-- you probably want this
		force_split = 2,
	},
})

hl.config({
	master = {
		-- See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
		-- new_is_master = true
	},
})

hl.config({
	gestures = {
		-- See https://wiki.hyprland.org/Configuring/Variables/ for more
		-- workspace_swipe = off
	},
})

hl.config({
	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		middle_click_paste = false,
	},
})

hl.config({
	cursor = {
		no_hardware_cursors = true,
	},
})
