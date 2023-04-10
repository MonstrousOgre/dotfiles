vim.api.nvim_exec("autocmd BufWritePre * lua vim.lsp.buf.format { async = false }", false)
--[[
   [vim.api.nvim_exec(
	 [  "autocmd CursorHold,CursorHoldI * lua require('config.lsp.code_action_utils').code_action_listener()",
	 [  false
   [)
   ]]
