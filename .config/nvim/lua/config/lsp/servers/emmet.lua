local on_attach = require("config.lsp.servers.on_attach")

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
--local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
	on_attach = on_attach,
	capabilities = capabilities,
	--filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "php" },
	root_dir = function(fname)
		return vim.loop.cwd()
	end,
}
