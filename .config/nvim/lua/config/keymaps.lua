local opts = { noremap = true, silent = true }

local set_keymap = vim.keymap.set

set_keymap("n", "<Space>", "<NOP>", opts)
vim.g.mapleader = " "
vim.b.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<Leader>e", ":Neotree toggle<CR>", opts)

-- alt + hjkl to resize windows
vim.keymap.set("n", "<M-j>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<M-k>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<M-h>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<M-l>", ":vertical resize +2<CR>", opts)

-- better window movement
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- set_keymap('n', '<TAB>', ':bnext<CR>', opts)
-- set_keymap('n', '<S-TAB>', ':bprevious<CR>', opts)

vim.keymap.set("n", "<C-s>", ":w<CR>", opts)
vim.keymap.set("n", "<C-Q>", ":qa<CR>", opts)
-- set_keymap('n', '<C-c>', ':close<Esc>', opts)
-- set_keymap('i', '<C-c>', '<Esc>', opts)
vim.keymap.set("i", "<C-[>", "<Esc>", opts)
-- set_keymap('n', '<C-w>', ':bwipe<CR>', opts)
-- set_keymap('n', ' w', ':bwipe<CR>', opts)

vim.keymap.set("n", "<C-a>", "0ggvG$", opts)

vim.keymap.set("v", "p", '"_dP', opts)

vim.keymap.set("v", "p", '"_dP', opts)

if vim.g.neovide == true then
  vim.keymap.set("n", "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", opts)
  vim.keymap.set("n", "<C-_>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>", opts)
  vim.keymap.set("n", "<C-)>", ":lua vim.g.neovide_scale_factor = 1<CR>", opts)

  vim.keymap.set('v', '<sc-c>', '"+y', opts)
  vim.keymap.set('n', '<sc-v>', 'l"+P', opts)
  vim.keymap.set('v', '<sc-v>', '"+P', opts)
  -- set_keymap('c', '<sc-v>', '<C-o>l<C-o>"+<C-o>P<C-o>l', opts)
  vim.keymap.set('c', '<sc-v>', '<c-r>+', opts)
  vim.keymap.set('i', '<sc-v>', '<ESC>l"+Pli', opts)
  vim.keymap.set('t', '<sc-v>', '<C-\\><C-n>"+Pi', opts)
end

vim.keymap.set("n", "<TAB>", ":BufferLineCycleNext<CR>", opts)
vim.keymap.set("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", opts)
vim.keymap.set("n", "<C-w>", ":bdelete<CR>", opts)

------ Look at barbar bindings
