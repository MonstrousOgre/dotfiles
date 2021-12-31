local on_attach = require("config.lsp.servers.on_attach")

--require("config.lsp.on_attach.diagnostics")
return {
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end,
}
