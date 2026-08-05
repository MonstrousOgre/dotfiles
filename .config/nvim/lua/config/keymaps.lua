local default_opts = { noremap = true, silent = true }

local function map(mode, lhs, rhs, extra)
  vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", default_opts, extra))
end

map("n", "<Space>", "<NOP>", {})
vim.g.mapleader = " "
vim.b.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<Leader>e", ":Neotree toggle<CR>", { desc = "Neotree" })

-- alt + hjkl to resize windows
map("n", "<M-j>", ":resize -2<CR>", { desc = "" })
map("n", "<M-k>", ":resize +2<CR>", { desc = "" })
map("n", "<M-h>", ":vertical resize -2<CR>", { desc = "" })
map("n", "<M-l>", ":vertical resize +2<CR>", { desc = "" })

-- better window movement
map("n", "<C-h>", "<C-w>h", { desc = "" })
map("n", "<C-j>", "<C-w>j", { desc = "" })
map("n", "<C-k>", "<C-w>k", { desc = "" })
map("n", "<C-l>", "<C-w>l", { desc = "" })

-- set_keymap('n', '<TAB>', ':bnext<CR>', {desc = ""})
-- set_keymap('n', '<S-TAB>', ':bprevious<CR>', {desc = ""})

map("n", "<C-s>", ":w<CR>", { desc = "Save buffer" })
map("n", "<C-Q>", ":qa<CR>", { desc = "Quit Neovim" })
-- set_keymap('n', '<C-c>', ':close<Esc>', {desc = ""})
-- set_keymap('i', '<C-c>', '<Esc>', {desc = ""})
map("i", "<C-[>", "<Esc>", { desc = "Escape" })
-- set_keymap('n', '<C-w>', ':bwipe<CR>', {desc = ""})
-- set_keymap('n', ' w', ':bwipe<CR>', {desc = ""})

map("n", "<C-a>", "0ggvG$", { desc = "Select all" })

map("v", "p", '"_dP', { desc = "" })

if vim.g.neovide == true then
  map("n", "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", { desc = "" })
  map("n", "<C-_>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>", { desc = "" })
  map("n", "<C-)>", ":lua vim.g.neovide_scale_factor = 1<CR>", { desc = "" })

  map('v', '<sc-c>', '"+y', { desc = "" })
  map('n', '<sc-v>', 'l"+P', { desc = "" })
  map('v', '<sc-v>', '"+P', { desc = "" })
  -- set_keymap('c', '<sc-v>', '<C-o>l<C-o>"+<C-o>P<C-o>l', {desc = ""})
  map('c', '<sc-v>', '<c-r>+', { desc = "" })
  map('i', '<sc-v>', '<ESC>l"+Pli', { desc = "" })
  map('t', '<sc-v>', '<C-\\><C-n>"+Pi', { desc = "" })
end

map("n", "<TAB>", ":BufferLineCycleNext<CR>", { desc = "" })
map("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", { desc = "" })
map("n", "<C-w>", ":bdelete<CR>", { desc = "" })

------ Look at barbar bindings
