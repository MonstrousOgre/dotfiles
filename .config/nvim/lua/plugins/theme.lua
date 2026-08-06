-- return {
--   "loctvl842/monokai-pro.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("monokai-pro").setup({
--       transparent_background = true,
--       filter = "pro",
--       background_clear = {
--         -- "float_win",
--         "toggleterm",
--         "telescope",
--         "which-key",
--         "renamer",
--         "notify",
--         -- "nvim-tree",
--         "neo-tree",
--         "lualine",
--         "snacks",
--       }
--     })
--     vim.cmd.colorscheme("monokai-pro")
--   end,
-- }

-- return {
--   "rijulpaul/nightblossom.nvim",
--   name = "nightblossom",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("nightblossom").setup({
--       variant = "sakura",  -- "spring", "sakura", "pastel"
--       transparent = true,  -- Enable background transparency
--       integrations = {
--         treesitter = true, -- TreeSitter highlighting
--       }
--     })
--     vim.cmd.colorscheme("nightblossom-sakura")
--   end,
-- }

return {
	"polirritmico/monokai-nightasty.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.opt.background = "dark" -- default to dark or light style

		local opts = {
			dark_style_background = "transparent", -- default, dark, transparent, #RRGGBB
			light_style_background = "transparent", -- default, dark, transparent, #RRGGBB
			hl_styles = {
				-- Background styles for floating windows and sidebars (panels):
				floats = "transparent", -- default, dark, transparent
				sidebars = "transparent", -- default, dark, transparent
			},
		}
		require("monokai-nightasty").setup(opts) -- ...and then load the theme:
		require("monokai-nightasty").load()

		-- As an alternative, pass the options directly into load and it will run setup
		-- the first time it is executed:
		require("monokai-nightasty").load(opts)
	end,
}
