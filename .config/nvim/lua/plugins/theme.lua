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

return {
  "rijulpaul/nightblossom.nvim",
  name = "nightblossom",
  lazy = false,
  priority = 1000,
  config = function()
    require("nightblossom").setup({
      variant = "sakura",  -- "spring", "sakura", "pastel"
      transparent = true,  -- Enable background transparency
      integrations = {
        treesitter = true, -- TreeSitter highlighting
      }
    })
    vim.cmd.colorscheme("nightblossom-sakura")
  end,
}
