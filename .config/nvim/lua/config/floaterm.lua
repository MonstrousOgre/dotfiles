-- Configuration example
vim.g.floaterm_keymap_toggle = "<F1>"
vim.g.floaterm_keymap_prev = "<F2>"
vim.g.floaterm_keymap_next = "<F3>"
vim.g.floaterm_keymap_new = "<F4>"

local set_keymap = vim.api.nvim_set_keymap
set_keymap("n", "<F1>", ":FloatermToggle<CR>", { noremap = true, silent = true })
set_keymap("n", "<F2>", ":FloatermPrev<CR>", { noremap = true, silent = true })
set_keymap("n", "<F3>", ":FloatermNext<CR>", { noremap = true, silent = true })
set_keymap("n", "<F4>", ":FloatermNew<CR>", { noremap = true, silent = true })
set_keymap("t", "<F1>", "<C-\\><C-n>:FloatermToggle<CR>", { noremap = true, silent = true })
set_keymap("t", "<F2>", "<C-\\><C-n>:FloatermPrev<CR>", { noremap = true, silent = true })
set_keymap("t", "<F3>", "<C-\\><C-n>:FloatermNext<CR>", { noremap = true, silent = true })
set_keymap("t", "<F4>", "<C-\\><C-n>:FloatermNew<CR>", { noremap = true, silent = true })


-- Floaterm
vim.g.floaterm_gitcommit = "floaterm"
vim.g.floaterm_autoinsert = 1
-- vim.g.floaterm_width=0.8
-- vim.g.floaterm_height=0.8
vim.g.floaterm_wintitle = 1
vim.g.floaterm_title = "terminal: $1/$2"
vim.g.floaterm_autoclose = 2
vim.g.floaterm_borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

vim.g.floaterm_shell = "nu"

function Floaterm()
  -- HIGHLIGHT('FloatermBorder', { guibg = 'NONE', guifg = 'cyan' })
  vim.cmd("highlight link FloatermBorder LspSagaHoverBorder")
end

-- CREATE_AUGROUP("Floaterm", { { "ColorScheme", "*", "lua Floaterm()" } })
