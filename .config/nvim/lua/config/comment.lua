require('Comment').setup()

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader>cc', '<cmd>lua require("Comment.api").comment.linewise()<cr>', opts)
vim.api.nvim_set_keymap('v', '<leader>cc',
  '<esc><cmd>lua require("Comment.api").comment.linewise(vim.fn.visualmode())<cr>',
  opts)
vim.api.nvim_set_keymap('n', '<leader>cu', '<cmd>lua require("Comment.api").uncomment.linewise()<cr>', opts)
vim.api.nvim_set_keymap('v', '<leader>cu',
  '<esc><cmd>lua require("Comment.api").uncomment.linewise(vim.fn.visualmode())<cr>',
  opts)
