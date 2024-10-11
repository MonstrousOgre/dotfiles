local opts = { noremap = true, silent = true }

--[[local function set_keymap(...)]]
--[[vim.api.nvim_set_keymap(...)]]
--[[end]]

local set_keymap = vim.api.nvim_set_keymap

set_keymap("n", "<Space>", "<NOP>", opts)
vim.g.mapleader = " "
vim.b.mapleader = " "
vim.g.maplocalleader = " "

-- set_keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)
set_keymap("n", "<Leader>e", ":Neotree toggle<CR>", opts)
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

if vim.g.neovide == true then
  set_keymap("n", "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", opts)
  set_keymap("n", "<C-_>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>", opts)
  set_keymap("n", "<C-)>", ":lua vim.g.neovide_scale_factor = 1<CR>", opts)

  set_keymap('v', '<sc-c>', '"+y', opts)
  set_keymap('n', '<sc-v>', 'l"+P', opts)
  set_keymap('v', '<sc-v>', '"+P', opts)
  -- set_keymap('c', '<sc-v>', '<C-o>l<C-o>"+<C-o>P<C-o>l', opts)
  set_keymap('c', '<sc-v>', '<c-r>+', opts)
  set_keymap('i', '<sc-v>', '<ESC>l"+Pli', opts)
  set_keymap('t', '<sc-v>', '<C-\\><C-n>"+Pi', opts)
end

------ Look at barbar bindings
