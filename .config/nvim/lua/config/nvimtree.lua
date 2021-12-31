vim.g.nvim_tree_indent_markers = 1 -- 0 by default, this option shows indent markers when folders are open
local tree_cb = require("nvim-tree.config").nvim_tree_callback

require("nvim-tree").setup({
	view = {
		mappings = { list = { { key = "h", cb = tree_cb("close_node") }, { key = "l", cb = tree_cb("edit") } } },
	},
})
