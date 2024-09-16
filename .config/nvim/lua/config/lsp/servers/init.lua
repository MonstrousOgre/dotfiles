local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")
local on_attach = require("config.lsp.servers.on_attach")

require("config.lsp.servers.mason")

local capabilities = require('cmp_nvim_lsp').default_capabilities()

mason_lspconfig.setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    -- if server_name == "html" or server_name == "cssls" or server_name == "tsserver" or server_name == "jsonls" or server_name == "yamlls" then
    --   lspconfig[server_name].setup { on_attach = function(client, bufnr)
    --     client.server_capabilities.documentFormattingProvider = false
    --     client.server_capabilities.documentRangeFormattingProvider = false
    --     capabilities.textDocument.foldingRange = {
    --       dynamicRegistration = false,
    --       lineFoldingOnly = true
    --     }
    --     on_attach(client, bufnr)
    --   end,
    --     capabilities = capabilities
    --   }
    -- else
    if server_name == "tsserver" then
      lspconfig["ts_ls"].setup { on_attach = on_attach, capabilities = capabilities }
    else
      lspconfig[server_name].setup { on_attach = on_attach, capabilities = capabilities }
    end
    -- end
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  ["rust_analyzer"] = function()
    lspconfig.rust_analyzer.setup({
      settings = {
        ['rust-analyzer'] = {
          cargo = {
            allFeatures = true,
          },
          checkOnSave = {
            command = 'clippy',
          },
          diagnostics = {
            enable = true,
            experimental = {
              enable = true,
            },
          },
        },
      },
      on_attach = on_attach,
      capabilities = capabilities,
    })
    -- require("rust-tools").setup {}
  end
}

lspconfig.nushell.setup { on_attach = on_attach, capabilities = capabilities, }

--lspconfig.vala_ls.setup { on_attach = on_attach }
