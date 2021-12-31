vim.api.nvim_exec("autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)", false)
--[[
   [vim.api.nvim_exec(
	 [  "autocmd CursorHold,CursorHoldI * lua require('config.lsp.code_action_utils').code_action_listener()",
	 [  false
   [)
   ]]
