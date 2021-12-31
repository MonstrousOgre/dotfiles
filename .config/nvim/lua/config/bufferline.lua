require("bufferline").setup({
	options = {
		offsets = { { filetype = "NvimTree", text = "File Explorer" } },
	},
})

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<TAB>", ":BufferLineCycleNext<CR>", opts)
vim.api.nvim_set_keymap("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-w>", ":bdelete<CR>", opts)
