return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			offsets = { { filetype = "neo-tree", text = "File Explorer" } },
			custom_filter = function(buf_number)
				-- Prevent CodeCompanion buffers from cluttering or cycling in the main list
				if vim.bo[buf_number].filetype == "codecompanion" then
					return false
				end
				return true
			end,
		},
	},
}
