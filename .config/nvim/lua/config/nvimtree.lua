--local tree_cb = require("nvim-tree.config").nvim_tree_callback

require("nvim-tree").setup({
	view = {
		--mappings = { list = { { key = "h", cb = tree_cb("close_node") }, { key = "l", cb = tree_cb("edit") } } },
    mappings = {
            custom_only = false,
            list = {
                { key = "l", action = "edit", action_cb = edit_or_open },
                { key = "L", action = "vsplit_preview", action_cb = vsplit_preview },
                { key = "h", action = "close_node" },
                { key = "H", action = "collapse_all", action_cb = collapse_all }
            }
          }
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
