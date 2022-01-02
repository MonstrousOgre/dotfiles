local opts = { noremap = true, silent = true }

--[[local function set_keymap(...)]]
--[[vim.api.nvim_set_keymap(...)]]
--[[end]]

local set_keymap = vim.api.nvim_set_keymap

set_keymap("n", "<Space>", "<NOP>", opts)
vim.g.mapleader = " "
vim.b.mapleader = " "
vim.g.maplocalleader = " "

set_keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)
-- set_keymap('n', '<Leader>r', ':RnvimrToggle<CR>', opts)

-- alt + hjkl to resize windows
set_keymap("n", "<M-j>", ":resize -2<CR>", opts)
set_keymap("n", "<M-k>", ":resize +2<CR>", opts)
set_keymap("n", "<M-h>", ":vertical resize -2<CR>", opts)
set_keymap("n", "<M-l>", ":vertical resize +2<CR>", opts)

-- better window movement
set_keymap("n", "<C-h>", "<C-w>h", opts)
set_keymap("n", "<C-j>", "<C-w>j", opts)
set_keymap("n", "<C-k>", "<C-w>k", opts)
set_keymap("n", "<C-l>", "<C-w>l", opts)

-- set_keymap('n', '<TAB>', ':bnext<CR>', opts)
-- set_keymap('n', '<S-TAB>', ':bprevious<CR>', opts)

set_keymap("n", "<C-s>", ":w<CR>", opts)
set_keymap("n", "<C-Q>", ":qa<CR>", opts)
-- set_keymap('n', '<C-c>', ':close<Esc>', opts)
-- set_keymap('i', '<C-c>', '<Esc>', opts)
set_keymap("i", "<C-[>", "<Esc>", opts)
-- set_keymap('n', '<C-w>', ':bwipe<CR>', opts)
-- set_keymap('n', ' w', ':bwipe<CR>', opts)

set_keymap("n", "<C-a>", "0ggvG$", opts)

set_keymap("v", "p", '"_dP', opts)

------ Look at barbar bindings
