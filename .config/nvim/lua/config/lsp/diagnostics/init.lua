require("config.lsp.diagnostics.signs")
--require("config.lsp.diagnostics.virtual_text")

vim.diagnostic.config({
  virtual_text = { severity = { min = vim.diagnostic.severity.ERROR } },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})
