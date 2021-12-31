-- Set which codelens text levels to show
local original_set_virtual_text = vim.lsp.diagnostic.set_virtual_text
local set_virtual_text_custom = function(diagnostics, bufnr, client_id, sign_ns, opts)
	opts = opts or {}
	-- show all messages that are Warning and above (Warning, Error)
	opts.severity_limit = "Error"
	original_set_virtual_text(diagnostics, bufnr, client_id, sign_ns, opts)
end

vim.lsp.diagnostic.set_virtual_text = set_virtual_text_custom

--vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--	virtual_text = {
--		prefix = "✗",
--	},
--})

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
})
