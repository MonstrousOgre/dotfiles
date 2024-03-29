local on_attach = require("config.nvimtree.nvim-tree-on-attach")

require("nvim-tree").setup({
  view = {
    width = 40,
  },
  on_attach = on_attach,
  renderer = {
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
    },
  },
})
