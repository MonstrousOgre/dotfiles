require("config.lsp.diagnostics.signs")

vim.diagnostic.config({
  virtual_text = { severity = { min = vim.diagnostic.severity.ERROR } },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})
