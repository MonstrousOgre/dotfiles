local gl = require("galaxyline")
local colors = require("galaxyline.theme").default
local condition = require("galaxyline.condition")
local gls = gl.section
gl.short_line_list = { "NvimTree", "vista", "dbui", "packer" }

gls.left = {
	{
		RainbowRed = {
			provider = function()
				return "  "
			end,
			highlight = { colors.blue, "NONE" },
		},
	},
	{
		ViMode = {
			provider = function()
				-- auto change color according the vim mode
				local mode_color = {
					n = colors.red,
					i = colors.green,
					v = colors.blue,
					[""] = colors.blue,
					V = colors.blue,
					c = colors.magenta,
					no = colors.red,
					s = colors.orange,
					S = colors.orange,
					[""] = colors.orange,
					ic = colors.yellow,
					R = colors.violet,
					Rv = colors.violet,
					cv = colors.red,
					ce = colors.red,
					r = colors.cyan,
					rm = colors.cyan,
					["r?"] = colors.cyan,
					["!"] = colors.red,
					t = colors.red,
				}
				vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim.fn.mode()] .. " guibg=" .. "NONE")
				-- return '  '
				return "  "
			end,
		},
	},
	{
		GitIcon = {
			provider = function()
				return "  "
			end,
			condition = condition.check_git_workspace,
			-- separator = ' ',
			separator_highlight = { "NONE", "NONE" },
			highlight = { colors.violet, "NONE", "bold" },
		},
	},
	{
		GitBranch = {
			provider = "GitBranch",
			condition = condition.check_git_workspace,
			separator = " ",
			separator_highlight = { "NONE", "NONE" },
			highlight = { colors.violet, "NONE", "bold" },
		},
	},
	{
		DiffAdd = {
			provider = "DiffAdd",
			condition = condition.hide_in_width,
			icon = "  ",
			highlight = { colors.green, "NONE" },
		},
	},
	{
		DiffModified = {
			provider = "DiffModified",
			condition = condition.hide_in_width,
			icon = " 柳",
			highlight = { colors.orange, "NONE" },
		},
	},
	{
		DiffRemove = {
			provider = "DiffRemove",
			condition = condition.hide_in_width,
			icon = "  ",
			highlight = { colors.red, "NONE" },
		},
	},
	-- {
	-- FileIcon = {
	-- provider = 'FileIcon',
	-- condition = condition.buffer_not_empty,
	-- highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, 'NONE' }
	-- },
	-- }
	-- {
	-- FileName = { provider = 'FileName', condition = condition.buffer_not_empty, highlight = { colors.fg, 'NONE', 'bold' } }
	-- },
	{ DiagnosticError = { provider = "DiagnosticError", icon = "  ", highlight = { colors.red, "NONE" } } },
	{ DiagnosticWarn = { provider = "DiagnosticWarn", icon = "  ", highlight = { colors.yellow, "NONE" } } },
	{ DiagnosticHint = { provider = "DiagnosticHint", icon = "  ", highlight = { colors.cyan, "NONE" } } },
	{ DiagnosticInfo = { provider = "DiagnosticInfo", icon = "  ", highlight = { colors.blue, "NONE" } } },
}

gls.right = {
	{
		ShowLspClient = {
			provider = "GetLspClient",
			condition = function()
				local tbl = { ["dashboard"] = true, [""] = true }
				if tbl[vim.bo.filetype] then
					return false
				end
				return true
			end,
			icon = " : ",
			separator = "  ",
			separator_highlight = { "NONE", "NONE" },
			highlight = { colors.fg, "NONE", "bold" },
		},
	},
	{
		BufferType = {
			provider = "FileTypeName",
			separator = " ",
			separator_highlight = { "NONE", "NONE" },
			highlight = { colors.blue, "NONE", "bold" },
		},
	},
	{
		FileEncode = {
			provider = "FileEncode",
			condition = condition.hide_in_width,
			separator = " ",
			separator_highlight = { "NONE", "NONE" },
			highlight = { colors.green, "NONE", "bold" },
		},
	},
	{
		FileFormat = {
			provider = "FileFormat",
			condition = condition.hide_in_width,
			separator = " ",
			separator_highlight = { "NONE", "NONE" },
			highlight = { colors.green, "NONE", "bold" },
		},
	},
	{
		LineInfo = {
			provider = "LineColumn",
			separator = " ",
			separator_highlight = { "NONE", "NONE" },
			highlight = { colors.fg, "NONE" },
		},
	},
	{
		PerCent = {
			provider = "LinePercent",
			separator = " ",
			separator_highlight = { "NONE", "NONE" },
			highlight = { colors.fg, "NONE", "bold" },
		},
	},
}

gls.short_line_left = {
	{
		BufferType = {
			provider = "FileTypeName",
			separator = " ",
			separator_highlight = { "NONE", "NONE" },
			highlight = { colors.blue, "NONE", "bold" },
		},
	},
	{
		SFileName = {
			provider = "SFileName",
			condition = condition.buffer_not_empty,
			highlight = { colors.fg, "NONE", "bold" },
		},
	},
}

gls.short_line_right = { { BufferIcon = { provider = "BufferIcon", highlight = { colors.fg, "NONE" } } } }
