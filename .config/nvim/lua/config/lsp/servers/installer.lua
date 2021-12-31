local lsp_installer_servers = require("nvim-lsp-installer.servers")

local server_names = {
	"sumneko_lua",
	"vimls",
	"bashls",
  "html",
  "cssls",
	"tsserver",
  "jsonls",
	"emmet_ls",
	"rust_analyzer",
	"yamlls",
}

for _, server_name in ipairs(server_names) do
	local server_available, requested_server = lsp_installer_servers.get_server(server_name)
	if server_available then
		if not requested_server:is_installed() then
			-- Queue the server to be installed
			requested_server:install()
		end
	end
end
