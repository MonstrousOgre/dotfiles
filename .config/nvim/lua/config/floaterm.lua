-- Configuration example
vim.g.floaterm_keymap_toggle = "<F1>"
vim.g.floaterm_keymap_prev = "<F2>"
vim.g.floaterm_keymap_next = "<F3>"
vim.g.floaterm_keymap_new = "<F4>"

-- Floaterm
vim.g.floaterm_gitcommit = "floaterm"
vim.g.floaterm_autoinsert = 1
-- vim.g.floaterm_width=0.8
-- vim.g.floaterm_height=0.8
vim.g.floaterm_wintitle = 1
vim.g.floaterm_title = "terminal: $1/$2"
vim.g.floaterm_autoclose = 2
vim.g.floaterm_borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

function Floaterm()
  -- HIGHLIGHT('FloatermBorder', { guibg = 'NONE', guifg = 'cyan' })
  vim.cmd("highlight link FloatermBorder LspSagaHoverBorder")
end

-- CREATE_AUGROUP("Floaterm", { { "ColorScheme", "*", "lua Floaterm()" } })
