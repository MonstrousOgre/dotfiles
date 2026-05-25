local opts = { noremap = true, silent = true }

local set_keymap = vim.api.nvim_set_keymap

set_keymap("n", "<Space>", "<NOP>", opts)
vim.g.mapleader = " "
vim.b.mapleader = " "
vim.g.maplocalleader = " "

vim.api.nvim_set_keymap("n", "<Leader>e", ":Neotree toggle<CR>", opts)

-- alt + hjkl to resize windows
vim.api.nvim_set_keymap("n", "<M-j>", ":resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<M-k>", ":resize +2<CR>", opts)
vim.api.nvim_set_keymap("n", "<M-h>", ":vertical resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<M-l>", ":vertical resize +2<CR>", opts)

-- better window movement
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)

-- set_keymap('n', '<TAB>', ':bnext<CR>', opts)
-- set_keymap('n', '<S-TAB>', ':bprevious<CR>', opts)

vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Q>", ":qa<CR>", opts)
-- set_keymap('n', '<C-c>', ':close<Esc>', opts)
-- set_keymap('i', '<C-c>', '<Esc>', opts)
vim.api.nvim_set_keymap("i", "<C-[>", "<Esc>", opts)
-- set_keymap('n', '<C-w>', ':bwipe<CR>', opts)
-- set_keymap('n', ' w', ':bwipe<CR>', opts)

vim.api.nvim_set_keymap("n", "<C-a>", "0ggvG$", opts)

vim.api.nvim_set_keymap("v", "p", '"_dP', opts)

if vim.g.neovide == true then
  vim.api.nvim_set_keymap("n", "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", opts)
  vim.api.nvim_set_keymap("n", "<C-_>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>", opts)
  vim.api.nvim_set_keymap("n", "<C-)>", ":lua vim.g.neovide_scale_factor = 1<CR>", opts)

  vim.api.nvim_set_keymap('v', '<sc-c>', '"+y', opts)
  vim.api.nvim_set_keymap('n', '<sc-v>', 'l"+P', opts)
  vim.api.nvim_set_keymap('v', '<sc-v>', '"+P', opts)
  -- set_keymap('c', '<sc-v>', '<C-o>l<C-o>"+<C-o>P<C-o>l', opts)
  vim.api.nvim_set_keymap('c', '<sc-v>', '<c-r>+', opts)
  vim.api.nvim_set_keymap('i', '<sc-v>', '<ESC>l"+Pli', opts)
  vim.api.nvim_set_keymap('t', '<sc-v>', '<C-\\><C-n>"+Pi', opts)
end

vim.api.nvim_set_keymap("n", "<TAB>", ":BufferLineCycleNext<CR>", opts)
vim.api.nvim_set_keymap("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-w>", ":bdelete<CR>", opts)

------ Look at barbar bindings
