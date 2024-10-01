local keybindings = require("config.lsp.servers.on_attach.keybindings")

return function(client, bufnr)
  keybindings(client, bufnr)
end
