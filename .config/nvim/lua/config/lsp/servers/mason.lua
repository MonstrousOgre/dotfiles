require("mason").setup {
  ui = {
    icons = {
      package_installed = "✓"
    }
  }
}

local server_names = {
  "lua_ls",
  "vimls",
  "bashls",
  "html",
  "cssls",
  "tsserver",
  --"eslint",
  "jsonls",
  "emmet_ls",
  "rust_analyzer",
  "yamlls",
  "pyright",
  --"jedi_language_server",
  --"pylsp",
  "clangd",
  --"vala_ls",
}

require("mason-lspconfig").setup {
  --ensure_installed = server_names,
  --automatic_installation = true,
}
