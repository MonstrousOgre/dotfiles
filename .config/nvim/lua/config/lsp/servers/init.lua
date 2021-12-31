local on_attach = require("config.lsp.servers.on_attach")
local lsp_installer = require("nvim-lsp-installer")
local tsserver = require("config.lsp.servers.tsserver")
local emmet = require("config.lsp.servers.emmet")

require("config.lsp.servers.installer")

--require("config.lsp.on_attach.diagnostics")

lsp_installer.on_server_ready(function(server)
	local opts = { on_attach = on_attach }

	if server.name == "tsserver" then
		opts = tsserver
	end

	if server.name == "emmet_ls" then
		opts = emmet
	end
	-- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
	server:setup(opts)
	--vim.cmd([[ do User LspAttachBuffers ]])
end)

require("config.lsp.servers.null-ls")
