local tree_cb = require("nvim-tree.config").nvim_tree_callback

require("nvim-tree").setup({
	view = {
		mappings = { list = { { key = "h", cb = tree_cb("close_node") }, { key = "l", cb = tree_cb("edit") } } },
	},
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
