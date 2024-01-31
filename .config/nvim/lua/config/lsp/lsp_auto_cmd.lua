vim.api.nvim_exec("autocmd BufWritePre * lua vim.lsp.buf.format { async = false }", false)
