return {
  'neovim/nvim-lspconfig',
  dependencies = { 'saghen/blink.cmp' },

  config = function()
    -- local capabilities = require('blink.cmp').get_lsp_capabilities()

    -- vim.lsp.config("*", {
    --   capabilities = capabilities,
    -- })

    vim.lsp.enable("qml-language-server")
    vim.lsp.enable("nushell")
  end
}
