local lsp_installer = require("nvim-lsp-installer")

require("config.lsp.borders")
require("config.lsp.diagnostics")
local completionKinds = require("config.lsp.completion-kinds")
completionKinds.setup()

require("config.lsp.servers")

require("config.lsp.cmp")

require("config.lsp.lsp_auto_cmd")
